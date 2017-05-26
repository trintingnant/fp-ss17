-- A *mobile* is a hanging ornament made of wires, struts and weights,
-- such as that illustrated in the following figure:

--      |       
--      |       
--      |            Legend: 
--   ===|=======        Wire: ------
--   |         |        Strut: ======
-- ==|=====    |        Weight: <int>
-- |      |    |
-- 3      |    |
--    ====|==  4
--    |     |   
--    5     2   


-- Mobiles can be modelled using the following types.

-- | A mobile is represented by the length of a wire and the object
-- which hangs on the wire.
data Mobile = Mobile Int Object
  deriving (Show)

-- | Hanging on a wire we have either a weight or a strut which
-- supports two smaller mobiles on both ends.
data Object = Weight Int
            | Strut Branch Branch
  deriving (Show)


-- | A branch is defined by its length and the mobile which hangs on
-- its end.
data Branch = Branch Int Mobile
  deriving (Show)


-------------------------------------------------------------------------------------------
-- Some sample mobiles

-- |
-- |
-- |
-- 4

m0 :: Mobile
m0 = Mobile 3 (Weight 4)

--   |     
--   |     
--   |     
--   |     
-- ==|=====
-- |      |
-- |      |
-- |      4
-- |       
-- 1       

m1 :: Mobile
m1 = Mobile 4 (Strut (Branch 2 (Mobile 4 (Weight 1))) 
                     (Branch 5 (Mobile 2 (Weight 4))))

--   |     
--   |     
--   |     
-- ==|===  
-- |    |  
-- |    |  
-- |  ==|==
-- 4  |   |
--    2   2

m2 :: Mobile
m2 = Mobile 3 (Strut (Branch 2 (Mobile 3 (Weight 4)))
                     (Branch 3 (Mobile 2 (Strut (Branch 2 (Mobile 1 (Weight 2)))
                                                (Branch 2 (Mobile 1 (Weight 2)))))))

--      |       
--      |       
--      |       
--   ===|=======
--   |         |
-- ==|=====    |
-- |      |    |
-- 3      |    |
--    ====|==  5
--    |     |   
--    5     2   

m3 :: Mobile
m3 = Mobile 3 (Strut (Branch 3 (Mobile 1 (Strut (Branch 2 (Mobile 1 (Weight 3)))
                                                (Branch 5 (Mobile 2 (Strut (Branch 4 (Mobile 1 (Weight 5)))
                                                                           (Branch 2 (Mobile 1 (Weight 2)))))))))
                     (Branch 7 (Mobile 4 (Weight 5))))
            

-- | A bounding box for mobile drawings. Its horizontal origin is the
-- attachment point of the wire. Next to the drawing, its extents left 
-- and right to the origin are provided.
data Box = Box Int       -- ^ The width left of the wire attachment
               Int       -- ^ The width right of the wire attachment
               [String]  -- ^ The drawing itself
  deriving (Show)


--  part 1 - complete
data Pixel = Black | White deriving (Eq, Show)

isBlack :: Pixel -> Bool
isBlack Black = True
isBlack White = False

-- Thought could be used for part 2
invertPixel :: Pixel -> Pixel
invertPixel Black = White
invertPixel White = Black

data Quadtree a 
    = Leaf a 
    | Node (Quadtree a) (Quadtree a) (Quadtree a) (Quadtree a) deriving (Eq, Show)

allWhite :: Int -> Quadtree Pixel
allWhite x = Leaf White

allBlack :: Int -> Quadtree Pixel
allBlack x = Leaf Black

clockwise :: Quadtree a -> Quadtree a -> Quadtree a -> Quadtree a -> Quadtree a
clockwise = Node

anticlockwise :: Quadtree a -> Quadtree a -> Quadtree a -> Quadtree a -> Quadtree a
anticlockwise tr tl bl br = Node tr br bl tl

-- attempt at part 2 - not complete
qtMap :: (a -> b) -> Quadtree a -> Quadtree b
qtMap f (Leaf val) = Leaf (f val)
qtMap f (Node tr br bl tl) = Node (qtMap f tr) (qtMap f br) (qtMap f bl) (qtMap f tl)

ndiff :: Quadtree a -> Quadtree a
ndiff (Leaf pixel) = Leaf pixel
ndiff (Node tr tl bl br) = Node (ndiff tr) (ndiff tl) (ndiff bl) (ndiff br)

-- didn't finish part 2 as not enough time with other courseworks and this coursework is only worth 5% of the final grade for the course. So was my least priority
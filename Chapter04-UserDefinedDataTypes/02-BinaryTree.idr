module BinaryTree

data Tree: Type -> Type where
  Empty : Tree a
  Node : Tree a -> a -> Tree a -> Tree a

%name Tree tree, tree1

insert : Ord a => a -> Tree a -> Tree a
insert admittee Empty                              = Node Empty admittee Empty
insert admittee original @ (Node left value right) = case admittee `compare` value of
                                                       LT => Node (insert admittee left) value right
                                                       EQ => original
                                                       GT => Node left value (insert admittee right)

-- Why is the Ord constraint on `insert` instead of on `Tree`? Here is why:
--
-- "Putting a constraint in the tree structure itself makes the type more
-- precise, in that it can now only store values that can be compared at the
-- nodes, but at the cost of making it less reusable. This is a tradeoff you’ll
-- often have to consider when defining new data types. There are various ways
-- of managing this trade-off, such as pairing data with predicates that
-- describe the form of that data, as you’ll see in chapter 9."

listToTree : Ord a => List a -> Tree a
listToTree = foldl (flip insert) Empty

treeToList : Ord a => Tree a -> List a
treeToList Empty                   = []
treeToList (Node left value right) = treeToList left ++ [value] ++ treeToList right

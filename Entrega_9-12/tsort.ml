
open Bin_tree;;

let rec insert_tree ord x tree = match tree with
  | Empty -> Node (x, Empty, Empty)
  | Node (y, l, r) ->
      if ord x y then Node (y, (insert_tree ord x l), r)
      else Node (y, l, insert_tree ord x r)

let tsort ord l =
  inorder (List.fold_left (fun a x -> insert_tree ord x a) Empty l)
;;
type 'a g_tree =
  Gt of 'a * 'a g_tree list
;;

let rec size = function 
    Gt (_, []) -> 1
  | Gt (r, h::t) -> size h + size (Gt (r, t));;

let rec maxList l = 
  List.fold_left (fun m t -> max (m) (height t)) 0 l

and height = function
  Gt (r, l) -> 1 + maxList l;;

let rec leaves = function
    Gt (r, []) -> [r]
  | Gt (r, h::t) -> List.fold_left (fun l t -> l @ leaves t) [] (h::t);;

let rec mirror = function
    Gt (r, []) -> Gt (r, [])
  | Gt (r, h::t) -> Gt (r, List.rev (List.map mirror (h::t)));;

let rec preorder = function
    Gt (r, []) -> [r]
  | Gt (r, h::t) -> r :: List.fold_left (fun l t -> l @ preorder t) [] (h::t);;

let rec postorder = function
    Gt (r, []) -> [r]
  | Gt (r, h::t) -> List.fold_left (fun l t -> l @ postorder t) [] (h::t) @ [r];;
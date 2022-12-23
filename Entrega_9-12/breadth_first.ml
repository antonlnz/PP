
open G_tree;;

let rec breadth_first = function
    Gt (x, []) -> [x]
  | Gt (x, (Gt (y, t2))::t1) -> x :: breadth_first (Gt (y, t1@t2));;

(* Tail recursive breadth_first *)
let rec breadth_first_t t =
  let rec breadth_aux acum = function
      Gt (x, []) -> List.rev (x::acum)
    | Gt (x, (Gt (y, t2))::t1) -> breadth_aux (x::acum) (Gt (y, List.rev_append (List.rev t1) t2))
  in breadth_aux [] t;;

(* (* create a function to build a tree with a given number of leaves *)
let rec build_tree num_leaves =
  if num_leaves = 1 then
    (* base case: a single leaf node *)
    Gt(1, [])
  else
    (* recursive case: a tree with multiple leaves *)
    let num_child_leaves = num_leaves / 2 in
    let left_child = build_tree num_child_leaves in
    let right_child = build_tree (num_leaves - num_child_leaves) in
    Gt (num_leaves, [left_child; right_child])

(* create a tree with 100,000 leaves *)
let t2 = build_tree 100000 *)

(* let rec init = function i -> function f -> 
  let rec init_aux = (function (1, n, m) -> 
    if n > m then init_aux ((f m)::1, n, m+1) else 1)
  in init_aux ([], i, 0);;

let t2 = Gt(0, init 150000 (fun x -> Gt(x, [])));; *)

let t2 =
  let rec create_deep_tree n =
    if n = 0 then Gt (n, [])
    else Gt (n, [create_deep_tree (n - 1)])
  in create_deep_tree 100000

(*

  Cuando llamas a la función breadth_first con t2 como argumento, la función se llamará a sí misma 10000 veces, 
  lo que resultará en un error de desbordamiento de pila.
    
  Por otro lado, cuando llamas a la función breadth_first_t con t2 como argumento, la función procesará el árbol
  en orden anchura-primero y evitará un error de desbordamiento de pila. La función breadth_first_t usa un acumulador
  para construir la lista de resultados de forma iterativa, en lugar de recursiva, lo que le permite manejar estructuras 
  de árbol profundas sin agotar el espacio de pila.

*)
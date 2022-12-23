
open Context;;
open Lib;;

type arith_oper =
    Opp;;

type arith_bi_oper =
    Sum | Sub | Prod | Div | Mod | Pow;;

type arith =
    Float of float
  | Var of string
  | Arith_op of arith_oper * arith
  | Arith_bi_op of arith_bi_oper * arith * arith
  | Fun_call of string * arith;;

let bi_op_to_fun = function
    Sum -> (+.)
  | Sub -> (-.)
  | Prod -> ( *. )
  | Div -> (/.)
  | Mod -> mod_float
  | Pow -> ( ** );;

let rec eval ctx = function
    Float f ->
      f

  | Var name ->
    (try
      get_binding ctx name
    with
      Not_found -> raise (Failure "" ))

  | Arith_op (operacion, e) -> 
      let f = eval ctx e in
      (match operacion with
          Opp -> (-. f))  

  | Arith_bi_op (op, e1, e2) -> 
    (try 
      let f1 = eval ctx e1 in
      let f2 = eval ctx e2 in
      bi_op_to_fun op f1 f2
      (* Podría ponerse como: bi_op_to_fun op (eval ctx e1) (eval ctx e2) *)
    with
      Division_by_zero -> raise (Failure "" ))
    
  | Fun_call (name, e) ->
      let g = eval ctx e in
      let fun_ = get_function name in
      fun_ g
;;
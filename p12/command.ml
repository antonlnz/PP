
open Context;;
open Arith;;

exception End_of_program;;

type command =
    Eval of arith
  | Var_def of string * arith
  | Quit;;

let rec run ctx = function
    Eval e ->
      let f = eval ctx e in
      let _ = print_endline (string_of_float f) in
      ctx

  | Var_def (name, value) -> 
      let f = eval ctx value in
      let _ = print_endline (name ^ " = " ^ string_of_float f) in
      let ctx' = add_binding ctx name f in
      ctx'
  
  | Quit -> raise (End_of_program);;
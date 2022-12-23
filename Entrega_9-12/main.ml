
open Parsing;;
open Lexing;;

open Context;;
open Lib;;
open Arith;;
open Command;;
open Parser;;
open Lexer;;

let rec loop ctx =
  print_string ">> ";

  try

    let cmd = s token (from_string (read_line ())) in
    let ctx' = run ctx cmd in
    (* Continue the loop with the updated context. *)
    loop ctx'

  with

    (* Catch and handle any exceptions that may be raised. *)
    | Lexical_error ->
        print_endline ("Lexical error");
        loop ctx
    | Parse_error ->
        print_endline "Syntax error";
        loop ctx
    | No_binding name ->
        print_endline ("Unbound variable: " ^ name);
        (* print_endline ("Variable " ^ name ^ "not defined"); *)
        loop ctx
    | Function_not_defined name ->
        loop ctx
    | End_of_file -> ()
    | End_of_program -> ()

;;

let _ = print_endline "Floating point calculator..." in
let _ = loop empty_context in
print_endline "... bye!!!";;


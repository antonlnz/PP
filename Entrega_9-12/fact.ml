(*

./fact 2

Sys.argv
Array.legth

Sys.argv Sys.argv = 2
Sys.argv.(0) = "./fact"
Sys.argv.(1) = "2"

*)

let rec fact = function 0 -> 1 | n -> n * fact (n - 1) (*Se pone rec para indicar que la funcion es recurrente o recursiva. Es decir, vamos a usar lo que estamos definiendo en la misma definicion, no hace refecencia a algo ya definido*)
(*Hay parte de la memoria que esta acotada para las funciones recursivas. Se llama stack de recursividad*)


let _ = try
  if int_of_string(Sys.argv.(1)) < 0 
          then raise (Invalid_argument "fact: argumento invalido")
  else if Array.length Sys.argv=2 
          then print_int(fact(int_of_string(Sys.argv.(1)))) 
        else print_string("fact: número de argumentos inválido")
  with (Invalid_argument _) -> print_string ("fact: argumento invalido")
        | Stack_overflow -> print_string ("fact: argumento invalido")
        

let () = print_newline()
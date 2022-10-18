let rec fibonacci n = if n <= 1 then n else fibonacci (n-1) + fibonacci (n-2)

let rec fib n x = if n<x then () else (print_int(fibonacci(x)); print_newline(); fib n (x + 1))

let () = if Array.length Sys.argv=2 then fib(int_of_string(Sys.argv.(1)))0 else print_string("número de argumentos inválido")

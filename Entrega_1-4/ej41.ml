let rec sum_cifras n = if (n <> 0) then (n mod 10) + sum_cifras(n/10) else 0

let rec num_cifras n = if (n/10 <> 0) then 1 + num_cifras(n/10) else 1


let rec exp10 n = if (n=0) then 1 else 10 * exp10(n-1)


let reverse n = let rec loop acc = function | 0 -> acc | n -> loop (acc * 10 + n mod 10) (n / 10) in loop 0 n
  

(*La funcion reverse_string no se pide en la practica*)
let reverse_string x = String.to_seq x |> List.of_seq |> List.rev |> List.to_seq |> String.of_seq

(*Otra forma de hacer la funcion reverse_string*)
(*let reverse_string2 x =
  let len = String.length x in
  String.init len (fun n -> String.get x (len - n - 1)) *)


let rec palindromo s = let le = String.length s in
if (le = 0 || le = 1) 
  then true 
else if (s.[0] = s.[le-1]) 
  then palindromo (String.sub s 1 (le-2)) 
else false

(* Otra forma de hacer la funcion palindromo *)
(* let palindromo2 s = 
  let rec loop i j = 
    if i >= j then true 
    else if s.[i] <> s.[j] then false 
    else loop (i+1) (j-1) in 
  loop 0 (String.length s - 1);; *)

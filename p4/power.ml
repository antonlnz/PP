let rec power x y = if y <> 0 then x * power x (y-1) else 1

let rec power' x y = if y = 0 then 1 else if (y mod 2 = 0) then power' (x*x) (y/2) else x * power' (x*x) (y/2)
(*
power' es mejor que power porque no hace tantas llamadas recursivas (y-1 decrece mas lento que y/2), y por lo tanto es más eficiente. 
Aunque probando ambas funciones, no percibo una diferencia de tiempo de ejecución significativa.
*)

let rec powerf x n = if n = 0 then 1.0 else x *. powerf x (n-1)
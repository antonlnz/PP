let rec mcd (x,y) = if x = 0 then y else if x < y then mcd(y,x) else mcd(x mod y, y);;

(* Otra forma de implementar la funcion *)
(* let rec mcd x y = if x = y then x else if x > y then mcd (x-y) y else mcd x (y-x) *)
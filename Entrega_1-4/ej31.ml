(*let f1 n = if n mod 2 = 0 then n / 2 else 2 * n;;*)

let f1 n = (function true -> n / 2 | false -> 2 * n) (n mod 2 = 0)

(*let f2 n = if n mod 2 = 0 then "es par" else "es impar";;*)

let f2 n = (function true -> "es par" | false -> "es impar") (n mod 2 = 0)

(*let f3 n = if n mod 2 = 0 then "múltiplo de 2" else if n mod 3 = 0 then "múltiplo de 3" else "impar";;*)

let f3 n = (function true -> "múltiplo de 2" | false -> ((function true -> "múltiplo de 3" | false -> "impar") (n mod 3 = 0))) (n mod 2 = 0)

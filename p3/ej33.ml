(*let g n = (n >= 0 && n mod 2 = 0) || n mod 2 = -1;;*)

let g1 n = if (if (n >= 0) then n mod 2 = 0 else false) then true else (n mod 2 = -1)


let g2 n = (function true -> true | false -> (n mod 2 = -1)) ((function true -> (n mod 2 = 0) | flase -> false) (n >= 0))

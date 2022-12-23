
exception Function_not_defined of string;;

let funs = [
    ("ln", fun a -> log a);
    ("sqrt", sqrt); (*Puede hacerse como: fun a b -> a ** (1. /. b)*)
    ("sin", fun a -> sin a);
    ("cos", fun a -> cos a);
    ("tan", fun a -> tan a);
    ("asin", fun a -> asin a);
    ("acos", fun a -> acos a);
    ("atan", fun a -> atan a);
    ("exp", fun a -> exp a);
    ("log10", fun a -> log10 a);
    ("round", Float.round);
]

let get_function s =
  try 
    List.assoc s funs 
  with 
    Not_found -> raise (Function_not_defined (""));;
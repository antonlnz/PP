let rec remove n l = match l with
  | [] -> []
  | h::t -> if n = h then t else h::(remove n t);;

let rec remove_all n l = match l with
  | [] -> []
  | h::t -> if n = h then remove_all n t else h::(remove_all n t);;

let rec ldif l1 l2 = match l2 with
  [] -> l1
| h::t -> ldif(remove_all h l1) t;;

let rec lprod l1 l2 = match l1 with
  [] -> []
  | h::t -> let rec aux h1 l2 = match l2 with
      [] -> []
    | h::t -> (h1, h)::(aux h1 t)
    in List.append (aux h l2) (lprod t l2);;

let rec divide l = match l with
  [] -> ([], [])
  | h::t -> let (l1, l2) = divide t in (h::l2, l1);;
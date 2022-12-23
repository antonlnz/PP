(*let rec to0from n =
  if n < 0 then [] else n :: to0from (n-1);;*)

let to0from n = 
  let rec aux l i =
    if i < 0 then List.rev l
    else aux (i::l) (i - 1)
  in aux [] n;;

(*let rec fromto m n =
  if m > n then [] else m :: fromto (m+1) n;;*)

let fromto m n = 
  let rec aux l i =
    if i < m then l
    else aux (i::l) (i - 1)
  in aux [] n;;

(*let incseg l =
  List.fold_right (fun x t -> x::List.map ((+) x) t) l [];;*)

let incseg l = 
  let rec aux l acc l2 = match l with
    [] -> []
    | [h] -> List.rev ((h + acc)::l2)
    | h::t -> aux t (h + acc) ((h + acc)::l2)
  in aux l 0 [];;

(*let rec remove x = function
  [] -> []
  | h::t -> if x = h then t else h :: remove x t;;*)

let rec remove x l = let rec aux acc = function
  [] -> l
  |h::t -> if x = h then List.rev_append acc t
           else aux (h::acc) t 
in aux [] l ;;

(* Otra forma de hacer el remove *)
(*let rec remove x l = 
  let rec remove' x l acc =
    match l with
      [] -> acc
    | h::t -> if x = h then List.rev_append acc t else remove' x t (h::acc)
  in remove' x l [];;*)


(*let rec compress = function
  | h1::h2::t -> if h1 = h2 then compress (h2::t)
                 else h1 :: compress (h2::t)
  | l -> l;;*)

let rec compress l = 
  let rec compress' l acc =
    match l with
      h1::h2::t -> if h1 = h2 then compress' (h2::t) acc
                   else compress' (h2::t) (h1::acc)
    | l -> List.rev_append acc l
  in compress' l [];;
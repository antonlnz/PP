let hd = function 
	h::_ -> h
	| _ -> raise(Failure "hd")

let tl = function
	[] -> raise(Failure "tl")
	| h::t -> t

let length l =
  let rec aux l acum = match l with
    [] -> acum
    | h::t -> aux t (acum + 1)
  in aux l 0;;

let compare_lengths l1 l2 = 
	let rec aux l1 l2 n = 
		match l1, l2 with
		[], [] -> 0
		| [], _ -> -1
		| _, [] -> 1
		| _::t1, _::t2 -> aux t1 t2 (n+1)
	in aux l1 l2 0

let rec nth l n = match l with
	[] -> raise(Failure "nth")
	| h::t -> if n<0 then raise(Invalid_argument "nth") 
            else if n = 0 
              then h 
            else nth t (n-1)

let rec append l1 l2 = match l1 with (* No recursiva terminal en el modulo List *)
[] -> l2
| h::t ->  h :: append t l2

(*let rec tail_recursive_append l1 l2 = 
  let rec aux l1 l2 = match l1 with
  [] -> l2
  | h::t -> aux t (h::l2)
  in aux l1 l2 *)

(* ****************************************************************** *)

let rec find f l = match l with 
	[] -> raise(Not_found)
	| h::t -> if f h then h else find f t

let rec for_all p l = match l with (* No recursiva terminal, pero como el operador && se evalua de forma lazy, no es necesario que sea recursiva terminal. El valor de "if true then e1 else e2" es el de e1, y e2 nunca se evalua*)
	[] -> true
	| h::t -> p h && for_all p t

(*let rec tail_recursive_for_all p l = 
  let rec aux p l = match l with
  [] -> true
  | h::t -> if p h then aux p t else false
  in aux p l *)

let rec exists p l = match l with (* No recursiva terminal, pero como el operador || se evalua de forma lazy, no es necesario que sea recursiva terminal. El valor de "if false then e1 else e2" es el de e2, y e1 nunca se evalua *)
	[] -> false
	| h::t -> p h || exists p t

(*let rec tail_recursive_exists p l = 
  let rec aux p l = match l with
  [] -> false
  | h::t -> if p h then true else aux p t
  in aux p l*)

let rec mem x l = match l with
	[] -> false
	| h::t -> if x = h then true else mem x t

let rev l =
  let rec aux v = function
    [] -> v
    | h::t -> aux (h::v) t
  in aux [] l;;

let rec filter f l =
  let rec aux f l auxl = match l with
    [] -> auxl
    | h::t -> if f h
      then aux f t (h::auxl)
      else aux f t auxl
    in aux f (rev l) [];;

let find_all = filter

let partition f l =
  let rec aux f l l1 l2 = match l with
    [] -> (rev l1, rev l2)
    | h::t -> if f h
      then aux f t (h::l1) l2
      else aux f t l1 (h::l2)
    in aux f l [] [];;

let rec split = function (* No recursiva terminal en el modulo List *)
  [] -> ([], [])
  | (h1, h2)::t -> let (l1, l2) = split t in (h1::l1, h2::l2);;

let rec combine l1 l2 = match l1, l2 with (* No recursiva terminal en el modulo List *)
	[], [] -> []
	| [], _ -> raise(Failure "Invalid_argument")
	| _, [] -> raise(Failure "Invalid_argument")
	| h1::t1, h2::t2 -> (h1,h2) :: combine t1 t2

(* ****************************************************************** *)

let rec fold_left f e l = match l with
	[] -> e
| h::t -> fold_left f (f e h) t;;

let init n f =
  if n < 0
    then raise (Invalid_argument "init")
    else let rec aux (i, l) =
      if i = n then l else aux(i + 1, f i::l)
    in rev(aux(0, []));;

let rec rev_append l1 l2 = match l1 with
	[] -> l2
| h::t -> rev_append t (h::l2);;

let rec concat l = match l with (* No recursiva terminal en el modulo List *)
	[] -> []
	| h::t -> append h (concat t);;

let flatten = concat;;

let rec map f l = match l with (* No recursiva terminal en el modulo List *)
	[] -> []
	| h::t -> f h :: map f t;;

let rev_map f l =
  let rec aux l auxl = match l with
    [] -> auxl
    | h::t -> aux t (f(h)::auxl)
  in aux l [];;

let rec map2 f l1 l2 = match l1, l2 with (* No recursiva terminal en el modulo List *)
	[], [] -> []
	| [], _ -> raise(Invalid_argument"map2")
	| _, [] -> raise(Invalid_argument"map2")
	| h1::t1, h2::t2 -> f h1 h2 :: map2 f t1 t2;;

let rec fold_right f l e = match l with (* No recursiva terminal en el modulo List *)
	[] -> e
	| h::t -> f h (fold_right f t e);;
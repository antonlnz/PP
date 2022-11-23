let hd = function 
	h::_ -> h
	| _ -> raise(Failure "hd")

let tl = function
	[] -> raise(Failure "tl")
	| h::t -> t

let rec length = function 
	[]->0 
	| _::t -> 1 + length(t) (* No es recursiva terminal *)

(* Otra forma de definir length seria con una funcion auxiliar que vaya
contando, para hacerla recursiva terminal *)

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
	| h::t -> if n<0 then raise(Failure "Invalid_argument") else if n = 0 then h else nth t (n-1)

let rec append l1 l2 = match l1 with
	[] -> l2
	| h::t ->  h :: append t l2

(* ****************************************************************** *)

let rec find f l = match l with
	[] -> raise(Failure "Not_found")
	| h::t -> if f h then h else find f t

let rec for_all p l = match l with
	[] -> true
	| h::t -> p h && for_all p t

let rec exists p l = match l with
	[] -> false
	| h::t -> p h || exists p t

let rec mem x l = match l with
	[] -> false
	| h::t -> if x = h then true else mem x t

let rec filter f l = match l with
	[] -> []
	| h::t -> if f h then h :: filter f t else filter f t

let find_all = filter

let rec partition f l = match l with 
	[] -> ([],[])
	| h::t -> let (l1, l2) = partition f t in
		if f h then (h::l1, l2) else (l1, h::l2)

let rec split l = match l with 
	[] -> ([],[])
	| (x,y)::t -> let (l1, l2) = split t in (x::l1, y::l2)

let rec combine l1 l2 = match l1, l2 with
	[], [] -> []
	| [], _ -> raise(Failure "Invalid_argument")
	| _, [] -> raise(Failure "Invalid_argument")
	| h1::t1, h2::t2 -> (h1,h2) :: combine t1 t2

(* ****************************************************************** *)

let rec fold_left f e l = match l with
	[] -> e
| h::t -> fold_left f (f e h) t;;

let init len f = if len < 0 then
	raise (Failure "Invalid_argument")
	else match len with
	0 -> []
	| _ -> let rec aux n = if n = len then [] else f n :: aux (n+1) in aux 0;;

let rev l = fold_left (fun t h -> h::t) [] l;;

let rec rev_append l1 l2 = match l1 with
	[] -> l2
| h::t -> rev_append t (h::l2);;

let rec concat l = match l with
	[] -> []
	| h::t -> append h (concat t);;

let flatten = concat;;

let rec map f l = match l with
	[] -> []
	| h::t -> f h :: map f t;;

let rec rev_map f l = match l with
	[] -> []
	| h::t -> append (rev_map f t) [f h];;

let rec map2 f l1 l2 = match l1, l2 with
	[], [] -> []
	| [], _ -> raise(Failure "Invalid_argument")
	| _, [] -> raise(Failure "Invalid_argument")
	| h1::t1, h2::t2 -> f h1 h2 :: map2 f t1 t2;;

let rec fold_right f l e = match l with
	[] -> e
	| h::t -> f h (fold_right f t e);;
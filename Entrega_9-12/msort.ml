let rec divide l = match l with
  h1::h2::t -> let t1, t2 = divide t in (h1::t1, h2::t2)
| _ -> l, [];;
 
let rec merge = function
  [], l | l, [] -> l
| h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, h2::t2)
                    else h2 :: merge (h1::t1, t2);;

let rec msort1 l = match l with
  [] | _::[] -> l
| _ -> let l1, l2 = divide l in
       merge (msort1 l1, msort1 l2);;

(* ¿Puede provocar algun problema la no terminalidad de divide o merge? *) (*

Si, para ordenar listas muy grandes puede provocar el agotamiento de la pila de llamadas (Stack Overflow)

*)

let l2 = List.rev (List.init 1_000_000 abs);;

let rec divide' l = 
  let rec aux l1 l2 l = match l with
    h1::h2::t1 -> aux (h1::l1) (h2::l2) t1
  | [] -> l1, l2
  | h::[] -> h::l1, l2
  in aux [] [] l;;

let rec merge' f (l1,l2) = 
  let rec aux l l1 l2 = match l1, l2 with
    [], l3 | l3, [] -> List.rev_append l l3
  | h1::t1, h2::t2 -> if f h1 h2 then aux (h1::l) t1 (h2::t2)
                      else aux (h2::l) (h1::t1) t2
  in aux [] l1 l2 ;;

let rec msort2 f l = match l with
  [] | _::[] -> l
| _ -> let l1, l2 = divide' l in
       merge' f ((msort2 f l1),(msort2 f l2));;

(*let rlist n = List.init n (fun _ -> Random.int n);;*)

(* let crono f x = 
let t = Sys.time () in
f x; Sys.time () -. t;; *)

(*crono (msort2 (<=))*)

(* Compare el rendimiento en tiempo de ejecucion de msort2 con el de msort1 y con el de
qsort2. *) (*
   Tiempos para una lista de 100_000 elementos aleatorios
      msort1: 0.427435999999999927 seg
      msort2: 0.342034 seg
      qsort2: 0.357201 seg
    Tiempos para una lista de 100_000 elementos ordenados
      msort1: 0.295048 seg
      msort2: 0.24326800000000004 seg
      qsort2: no funciona (Al estar ordenados, el pivote es el primer elemento)
    
  Para listas muy grandes (aleatorias), msort2 es mas rapido que msort1, porque no se agota la pila
  En el caso de listas ordenadas, msort1 es mas rapido que msort2.
*)


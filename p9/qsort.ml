let rec qsort1 ord = function
  [] -> []
| h::t -> let after, before = List.partition (ord h) t in
          qsort1 ord before @ h :: qsort1 ord after;;

(* ¿En que casos no sera bueno el rendimiento de esta implementacion? *) (*

Cuando el pivote es el menor elemento o el mayor
Cuando la lista de entrada esta ordenada ascendentemente (el pivote seria el primer elemento (el menor), con esta implementacion)

*)

let rec qsort2 ord =
  let append' l1 l2 = List.rev_append (List.rev l1) l2 in
  function
  [] -> []
  | h::t -> let after, before = List.partition (ord h) t in
  append' (qsort2 ord before) (h :: qsort2 ord after);;

(* ¿Tiene qsort2 alguna ventaja sobre qsort1? ¿Permite qsort2 ordenar listas que no
podrian ordenarse con qsort1? *) (*

Si, evita problemas de Stack Overflow, debido a que @ no tiene recursividad terminal. 
Si, permite ordenar listas de muchos mas elementos que qsort1

*)

let l1 =  List.init 1_000_000 abs;;

(* ¿Tiene qsort2 alguna desventaja sobre qsort1? Compruebe si qsort2 es mas lento que
qsort1. *) (*

Si, es mas lento que qsort1 para listas relativamente cortas, es decir, para los casos en los que qsort1 
funciona mejor (2 veces el tamaño de l1)

En estos casos qsort2 es al rededor de un 117.45% más lento

*)
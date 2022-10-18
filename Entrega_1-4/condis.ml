false && (2 / 0 > 0);;
(*Si false es verdadero entonces evalua la parte derecha, si no lo es devuelve false.
En este caso devuelve false porque la parte izquierda siempre es false.
*)

true && (2 / 0 > 0);;
(*Si true es true entonces evalua la parte derecha, si no devuelve false.*)
(*En este caso devuelve true porque la parte izquierda siempre es verdadera*)
(*Correccion: da un error exception porque no podemos dividir por 0, al evaluarse con lazy, da error porque se evalua la parte derecha, no como en la instruccion anterior*)

true || (2 / 0 > 0);;
(*Si la parte izquierda es true, devuelve true. Si no lo es evalúa la parte derecha
En este caso devuelve true.  
*)

false || (2 / 0 > 0);;
(*Da error porque al ser false la parte izquierda evalua la parte derecha y lee el 2/0*)

let con b1 b2 = b1 && b2;;
(*Da una funcion de tipo bool en otra funcion de bool->bool
con: significa conjuncion (&&)
*)

let dis b1 b2 = b1 || b2;;
(*Devuelve una funcion de bool en una funcion de bool->bool
dis: significa disjuncion (||)
*)

con (1 < 0) (2 / 0 > 0);;
(*Equivale a la conjunción (1 < 0) && (2 / 0 > 0);;, devuelve falso porque la parte izquierda es falsa, ya no evalua la derecha

Correccion: Como es una evaluacion tipo eager, evalua las dos expresiones, y da fallo porque hay una division por 0
*)

(1 < 0) && (2 / 0 > 0);;
(*Evalua la parte izquierda y como es false devuelve false sin evaluar la derecha (equivale a la anterior instruccion)*)

dis (1 > 0) (2 / 0 > 0);;
(*Da error porque evalua las dos expresiones antes de proporcionar un resultado y hay una division por 0 en una de ellas*)

(1 > 0) || (2 / 0 > 0);;
(*Devuelve true porque la parte izquierda es true, ya no evalúa la derecha*)


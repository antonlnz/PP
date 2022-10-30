let curry f x y = f (x, y)

let uncurry f (a, b) = f a b

(* Comprobacion de frases *)
uncurry (+);;
(* La funcion + es una funcion que dado un int devuelve una funcion que suma ese int a otro int *)
(* Ahora es una funcion que suma un par dado *)
(* Correccion: Correcto *)

let sum = (uncurry (+));;
(* Define una funcion que es la funcion suma descurrificada, que recibe un par de numeros y los suma *)
(* Correccion: Correcto *)

sum 1;;
(* Da error porque no es un par (Consecuencia de la definicion anterior) *)
(* Correccion: Correcto *)

sum (2,1);;
(* Devuelve 3 *)
(* Correccion: Correcto *)
let g = curry (function p -> 2 * fst p + 3 * snd p);;
(* Define una funcion g que dado un numero, devuelve un par al que le aplica la expresion que sucede a la flecha*)
(* Correccion: Incorrecto, define una funcion g : int -> int -> int que 
asigna a cada p 2 * fst p + 3 * snd p *)

g (2,5);;
(* Da error, porque es un par y la funcion g espera un unico numero *)
(* Correccion: Correcto *)

let h = g 2;;
(* Define una funcion que consiste en aplicarle el resultado de g 2 al valor dado *)
(* Correccion: Correcto, define una funcion de int -> int *)
h 1, h 2, h 3;;
(* Da error *)
(* Correccion: Incorrecto, devuelve una tupla de 3 elementos, que corresponden con el resultado de aplicar h a los tres valores dados *)

let comp f g = fun x -> f (g x);;

let f = let square x = x * x in comp square ((+) 1);;
(* Define una funcion f que es la composicion de la funcion square y la funcion que suma 1 a un numero, una funcion int -> int *)
(* Correccion: Correcto *)

f 1, f 2, f 3;;
(* Devuelve el una tupla con los resultados de aplicar f a los valores dados. (4, 9, 16) *)
(* Correccion: Correcto *)

(* POLIMORFISMO *)

let i x = x;;
(* Define una funcion f que dado un valor de cualquier tipo devuelve ese mismo valor *)
(* Solo se puede escribir una funcion de este tipo. Porque para que i sea polimorfica 
lo unico que puedes hacer con el valor x es devolver el mismo valor, porque si haces otras
operaciones, como compararlo, ya estas definiendo el tipo de valor que debe ser x *)

let j (x,y) = x;;
(* Define una funcion f que dado un par de valores de cualquier tipo devuelve el primer valor *)
(* Se puede escribir una funcion, que devuelva el primer elemento de la tupla *)

let k (x,y) = y;;
(* Define una funcion f que dado un par de valores de cualquier tipo devuelve el segundo valor *)
(* Se puede escribir una funcion, que devuelva el segundo elemento de la tupla *)

let l x = [x];;
(* Define una funcion f que dado un valor de cualquier tipo devuelve una lista con el valor *)
(* Infinitas funciones, que devuelven una lista con el elemento x repetido n veces, pero sin cambiar el tipo del elemento x *)
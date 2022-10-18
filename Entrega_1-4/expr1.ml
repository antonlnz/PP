();;
(*devuelve el tipo de dato, que es unit*)

2 + 5 * 3;;
(*devuelve 17 porque la multiplicacion tiene prioridad sobre la suma*)

1.0;;
(*devuelve el tipo de valor: float*)

(* 1.0 * 2;; *)
(*devuelve un error porque estamos intentando multiplicar un float por un int*)
(*efectivamente devuelve un error, error de tipos*)
(*correccion: 1*2;; *)

(* 2 - 2.0;; *)
(*igual que en la expresion de arriba*)
(*error de tipo. cabe destacar que el error es poner el float, porque el operador es de tipo int*)
(*correccion: 2 - 2;;*)

(* 3.0 + 2.0;; *)
(*devuelve 5*)
(*Da error de tipo. Porque el operador es para valores de tipo int, y no float*)
(*correccion: 3 + 2;;*)

5 / 2;;
(*2.5*)
(*correccion: estamos usando un operador de ints, por tanto devuelve un entero, no un float*)

5 mod 3;;
(*devuelve el valor de 5 en modulo 3*)

3.0 *. 2.0 ** 3.0;;
(*no sé que significa que haya dos asteriscos, parece que mezcla operandos tipo float con operandos tipo int*)
(*correccion: 3 * 2^3, puesto que el doble asterisco es la exponenciacion*)

3.0 = float_of_int 3;;
(*devuelve true*)

(* sqrt 4;; *)
(*2*)
(*error de tipo, la funcion sqrt espera un float no un int, deberia ser 4.*)
(*correccion: sqrt 4.0;;*)

int_of_float 2.1 + int_of_float (-2.9);;
(*ESPERADO: int = -1*)
(*ERROR LÉXICO: OCaml aproxima -0.8 a 0 *)

truncate 2.1 + truncate (-2.9);;
(*resultado: 0*)

floor 2.1 +. floor (-2.9);;
(*no se que hace la funcion floor*)
(*floor busca el entero menor mas cercano*)

(* ceil 2.1 +. ceil -2.9;; *)
(*no se que hace la funcion ceil*)
(*redondea al entero mayor mas cercano. aun asi da error sintactico porque falta un parentesis en el segundo ceil*)

2.0 ** 3.0 ** 2.0;;
(*2^6*)
(*correccion: el resultado es 512, por tanto es 2^(3^2)*)

'B';;
(*devuelve el tipo char*)

int_of_char 'A';;
(*devuelve el valor en la tabla ASCII de la letra A*)

char_of_int 66;;
(*al reves que la anterior funcion. Devuelve el caracter correspondiente a 66 en la tabla ASCII*)

Char.code 'B';;
(*es otro nombre para la funcion int_of_char*)

Char.chr 67;;
(*es otro nombre para la funcion char_of_int*)

'\067';;
(*devuelve el char asociado al numero 67 en la tabla ASCII*)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(*devuelve el char asociado al resultado de sumar los valores ASCII de a, A y M*)
(*Es correcto. 97 - 65 + 77 = 109 que es igual a m en la tabla ASCII*)

"this is a sting";;
(*devuelve el tipo string, segido del string escrito*)

String.length "longitud";;
(*devuelve un int que es la longitud del string dado. Es 8*)

(* "1999" + "1";; *)
(*concatena ambos strings*)
(*Da error de tipo porque el operador es tipo int y los operandos son strings*)
(*correccion: 1999 + 1;;*)

"1999" ^ "1";;
(*no se*)
(*este si que concatena los strings*)

int_of_string "1999" + 1;;
(*convierte el string a entero y le suma 1*)

"\064\065";;
(*no se*)
(*cambia los numeros por los caracteres asociados en la tabla ASCII y los concatena*)

string_of_int 010;;
(*convierte el 010 en "010"*)
(*correccion: elimina el 0 porque lo convierte a la representacion estandar de una cadena*)

not true;;
(*false, lo contrario de true*)

true && false;;
(*false, porque no se puede tener valor verdadero y falso simultaneamente*)

true || false;;
(*true, es posible tener un valor true o false*)

"1" < "2";;
(*true, porque el valor en la tabla ASCII de 1 es menor que el de 2 (49 y 50 respectivamente)*)

2 < 12;;
(*true, porque el int 2 es menor que el 12*)

"2" < "12";;
(*true, porque el valor ASCII de 2 es menor que el de 12*)
(*correccion: false, porque compara la cadena caracter por caracter*)

"uno" < "dos";;
(*false, porque la d esta antes que la u en la tabla ASCII, es decir, hace lo mismo que la anterior expresion*)

if 3 = 4 then 0 else 4;;
(*devuelve 4 porque 3 es distinto de 4*)

if 3 = 4 then "0" else "4";;
(*devuelve el string 4 porque 3 es distinto de 4*)

(* if 3 = 4 then 0 else "4";; *)
(*devuelve "4" porque 3 es distinto de 4*)
(*correccion: da error porque las expresiones del if no coinciden*)
(*la version correcta seria if 3 = 4 then "0" else "4";; o if 3 = 4 then 0 else 4;;*)

(if 3 < 5 then 8 else 10) + 4;;
(*devuelve 12 porque 3 es menor que 5, por tanto queda 8 + 4*)

2.0 *. asin 1.0;;
(*devuelve un valor aproximado de pi*)

sin (2.0 *. asin 1.0 /. 2.);;
(*devuelve el seno del valor aproximado de pi (expresion de antes) entre 2, operando con floats*)

function x -> 2 * x;;
(*define una funcion de enteros a enteros. dado un x de entrada, devuelve el doble de ese valor. La funcion es tipo int -> int, esto lo deduce ocaml por el operador * que no lleva el punto*)

(function x -> 2 * x) (2 + 1);;
(*no se*)
(*evalua la funcion dando a x el valor de la expresion situada a la derecha: (2+1)*)

let x = 1;;
(*le da a 1 el nombre x*)

let y = 2;;
(*le da a 2 el nombre de y*)

x - y;;
(*resta 1 - 2, resultado -1*)

let x = y in x - y;;
(*no se*)
(*primero se hace lo que esta entre el = y el in, se asocia temporalmente a x y se evalua lo de la derecha del in, el resultado es 0*)

x - y;;
(*la expresion anterior es temporal, por tanto este resultado debe ser calculado con los valores de x e y iniciales*)

(* z;; *)
(*devuelve el tipo char y vuelve a escribir el caracter*)
(*esta mal escrito porque no esta definida*)
(*correccion: 'z';; o declarar el valor de z antes: let z = 10;;*)

let z = x + y;;
(*llama z al valor 3 (se usan x e y iniciales) *)

z;;
(*devuelve 3*)

let x = 5;;
(*llama a 5, x*)

z;;
(*da 7*)
(*da 3, porque el let x = 5;; estabamos creando un nuevo valor, pero la z sigue usando el valor de x con el que estaba definido*)

let y = 5 in x + y;;
(*devuelve 10, porque la expresion let x = 5;; es previa a esta y por tanto se usa 5 como valor de x y no el que se había declarado antes que era 1*)

x + y;;
(*devuelve 7 porque se emplea el nuevo valor de x (5) pero el antiguo de y (2)*)

let x = x + y in let y = x * y in x + y + z;;
(*almacena x+y en x, x*y en y y realiza la operacion x+y+z, que da de resultado 24*)


x + y + z;;
(*devuelve el resultado sin tener en cuenta los valores de la expresion anterior, porque el let-in crea una definicion local que no se mantiene, por tanto el resultado debe ser 5 + 2 + 3 = 10*)

int_of_float;;
(*devuelve el tipo de la funcion, float -> int*)

float_of_int;;
(*devuelve el tipo de la funcion, int -> float*)

int_of_char;;
(*devuelve el tipo de la funcion, char -> int*)

char_of_int;;
(*devuelve el tipo de la funcion, int -> char*)

abs;;
(*no se*)
(*devuelve el tipo de la funcion valor absoluto, int -> int*)

sqrt;;
(*devuelve el tipo, que es de float -> float*)

truncate;;
(*indica el tipo, que es de float -> entero*)

ceil;;
(*indica el tipo, que es de float -> float*)
(*esta funcion redondea al entero mayor mas cercano*)

floor;;
(*indica el tipo, que es de float -> float*)
(*esta funcion redondea al entero menor mas cercano*)

Char.code;;
(*indica el tipo, que es de char -> entero*)
(*esta funcion devuelve el valor ASCII corespondiente a un caracter*)

Char.chr;;
(*indica el tipo, que es de int -> char*)
(*esta funcion devuelve el caracter dado un valor del codigo ASCII*)

int_of_string;;
(*indica el tipo, que es de string -> entero*)
(*convierte la cadena de caracteres en un entero*)

string_of_int;;
(*indica el tipo, que es de int -> string*)
(*convierte un int en una cadena de caracteres*)

String.length;;
(*indica el tipo, que es de float -> entero*)
(*devuelve el numero de caracteres de un string dado*)

let f = function x -> 2 * x;;
(*declara una funcion f tal que dado un valor, devuelve el doble del mismo*)

f (2 + 1);;
(*realiza la suma y al resultado le aplica la funcion declarada anteriormente, f(3) = 6*)

f 2 + 1;;
(*al no haber parentesis y la aplicacion de funciones tener prioridad sobre cualquier operador infijo, aplicara f al valor 2 y le sumara 1 al resultado. Resultado = 5*)

let n = 1;;
(*llama al valor 1, n*)

let g x = x + n;;
(*no se, no entiendo la x al lado de la g*)
(*declara una funcion que asocia a x la suma de x mas el valor de n declarado anteriormente (1) *)

g 3;;
(*aplica la funcion g a 3, dando como resultado 4*)

let n = 5;;
(*llama a 5, n. Este valor es uno "nuevo", no sobreescribe al anterior n*)

g 3;;
(*por lo dicho en las lineas anteriores, como no se sobreescribe, se toma n=1 para realizar la funcion g a 3*)

let l = function r -> let pi = 2.0 *. asin 1.0 in 2.0 *. pi *. r;;
(*declara una funcion de float -> float*)

l 3.0;;
(*aplica la funcion l al valor 3.0 y devuelve el resultado de haber sustituido pi por 2.0 multiplicado por el asin de 1 en la parte a la derecha del in, dando como resultado 18.849555*)

(* l 2;; *)
(*da error porque la funcion l espera un valor tipo float, no int*)
(*correccion: l 2.;; o l 2.0;; *)

(* pi;; *)
(*imprime el valor asignado al nombre pi*)
(*da error, porque el nombre pi no esta definido. Aunque salga en la definicion de la funcion l, es un valor temporal*)
(*correccion: darle a pi un valor antes (let pi = 3.14) *)

let pi = 2.0 *. asin 1.0;;
(*le asigna a la aproximacion del valor de pi (la parte a la derecha del igual) el nombre "pi"*)

pi;;
(*Ahora imprimira el valor de pi, porque ya le dimos un valor, que es: 3.1415926535...*)

let v = function r -> pi *. r ** 2.0;;
(*declara una funcion de tipo float -> float*)

v 2.0;;
(*aplica la funcion v a 2.0, dando de resultado pi*2^2 = 12.56637061...*)
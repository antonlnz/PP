let rec find_possible_moves (x,y) salto = (* Devuelve una lista con las posiciones a las que se puede saltar *)
  if salto = 0 
    then []
  else (x-salto,y)::(x+salto,y)::(x,y-salto)::(x,y+salto)::find_possible_moves (x,y) (salto-1)

let is_valid m n camino trees (x,y) = 
  (x>=1 && y>=1 && x<=m && y<=n) && not (List.mem (x,y) camino) && (List.mem (x,y) trees)

let valid_moves m n (x,y) salto promesa trees = (* Dada una posicion, indica si es un movimiento posible *)
  (*Si x,y esta en la lista de find_possible_moves*)
  let possible_moves = find_possible_moves (x,y) salto in
  List.filter (is_valid m n promesa trees) possible_moves

let rec tour m n trees salto = (* Funcion principal *)
  if m <= 0 || n <= 0 
    then raise (Invalid_argument "tour")
  else let rec aux camino posibles = match posibles with
    h::t -> if h = (m,n) then List.rev(h::camino)
    else begin try aux (h::camino) (valid_moves m n h salto camino trees) with 
             Not_found -> aux camino t end
    | [] -> raise (Not_found)
in aux [] [(1,1)]
let rec find_possible_moves (x,y) salto = (* Devuelve una lista con las posiciones a las que se puede saltar *)
  if salto = 0 
    then []
  else (x-salto,y)::(x+salto,y)::(x,y-salto)::(x,y+salto)::find_possible_moves (x,y) (salto-1)

let is_valid m n camino trees (x,y) = 
  (x>=1 && y>=1 && x<=m && y<=n) && not (List.mem (x,y) camino) && (List.mem (x,y) trees)

let valid_moves m n (x,y) salto promesa trees = (* Dada una posicion, indica si es un movimiento posible *)
  (* Si x,y esta en la lista de find_possible_moves *)
  let possible_moves = find_possible_moves (x,y) salto in
  List.filter (is_valid m n promesa trees) possible_moves

let remove_used_trees path trees = 
  List.filter (fun (x,y) -> not (List.mem (x,y) path)) trees  

let shortest_tour m n trees salto = (* Da un warning por el partial-matching, pero el caso no contemplado, nunca se va a dar *)
  if (m <= 0 || n <= 0)
    then raise (Invalid_argument "tour: m y n deben ser mayores que 0") 
  else let rec aux caminos sigNivel trees = match caminos with (* caminos: contiene los posibles caminos desde el punto de inicio hasta el punto final. Cada lista de pares (x, y) representa un camino individual, y cada par (x, y) representa una posición en la matriz. *)
  | [] -> aux sigNivel [] trees
  | ((x,y)::c)::t -> 
    if x=m && y=m 
      then List.rev(((x,y)::c))
    else 
      let newtrees = valid_moves m n (x,y) salto [] trees in
      let newLevel = List.map (fun (a,b) -> (a,b)::(x,y)::c) newtrees in
      aux t (newLevel@sigNivel) (remove_used_trees newtrees trees)
in aux [[(1,1)]] [] trees
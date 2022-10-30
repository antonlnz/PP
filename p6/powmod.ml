let rec power' x y m = let producto_modular x y m = ((x mod m) * (y mod m)) mod m in
	if y = 0 then 1 
	else if (y mod 2 = 0) 
		then power' (producto_modular x x m) (y/2) m
	else x * power' (producto_modular x x m) (y/2) m

let powmod m b e = power' b e m mod m
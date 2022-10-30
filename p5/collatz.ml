let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1

let rec orbit n = 
	if n = 1 
		then "1" 
	else string_of_int(n) ^ ", " ^ orbit (f n) (*No se tiene en cuenta el caso n = 0 porque es precondicion que no lo sea*)

let rec length n = 
	if n = 1 
		then 0 
	else length(f n) + 1

let rec top n =  
	if n = 1
		then 1
	else let x = top(f n) in 
	if n > x 
		then n 
	else x;;

let rec length'n'top n = 
	if n = 1
		then (0, 1)
	else let (lengthfn,topfn) = length'n'top(f n) in 
		if n > topfn
			then (lengthfn+1,n)
		else (lengthfn+1,topfn);;

let rec longest_in m n = 
	if m = n 
		then (m, length m)
	else let (maxRest,maxLength) = longest_in (m+1) n in
		let mLength = length m in
		if ( mLength >= maxLength )
			then (m, mLength)
		else (maxRest, maxLength);;

let rec highest_in m n = 
	if m = n 
		then (m, top m)
	else let (maxRest,maxTop) = highest_in (m+1) n in
		let mTop = top m in
		if ( mTop >= maxTop )
			then (m, mTop)
		else (maxRest, maxTop);;
(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let
		val r = g f1 f2
    in
		case p of
		    Wildcard          => f1 ()
		  | Variable x        => f2 x
		  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
		  | ConstructorP(_,p) => r p
		  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(* 1 *)
val only_capitals = List.filter (fn x => Char.isUpper(String.sub(x, 0)))

(* 2 *)
fun longest_string1 xs = foldl (fn (acc, x) => if String.size(x) >= String.size(acc) then x else acc) "" xs

(* 3 *)
fun longest_string2 xs = foldl (fn (acc, x) => if String.size(x) > String.size(acc) then x else acc) "" xs

(* 4 *)
fun longest_string_helper f xs = foldl (fn (acc, x) => if f(String.size(x), String.size(acc)) then x else acc) "" xs
val longest_string3 = longest_string_helper (op >=)
val longest_string4 = longest_string_helper (op >)

(* 5 *)
val longest_capitalized = longest_string1 o only_capitals

(* 6 *)
val rev_string = String.implode o rev o String.explode

(* 7 *)
fun first_answer f xs =
	case xs of
		[] => raise NoAnswer
		| x::xs' => case f x of
		 			NONE => first_answer f xs'
		 			| SOME y => y

(* 8 *)
fun all_answers f xs =
	let
		fun all_answers_helper(acc, ys) =
			case ys of
				[] => SOME acc
				| y::ys' => case f y of
					NONE => NONE
					| SOME ls => all_answers_helper(acc @ ls, ys')
	in
		case xs of
			[] => SOME []
			| _ => all_answers_helper([], xs)
	end


(* 9 *)
val count_wildcards = g (fn () => 1) (fn a => 0)
val count_wild_and_variable_lengths = g (fn () => 1) String.size
fun count_some_var (str, ptn) = g (fn a => 0) (fn x => if x = str then 1 else 0) ptn

(* 10 *)
fun get_variable_names ptn =
	case ptn of
		Variable x => [x]
		| TupleP xs => List.foldl (fn (x, acc) => acc @ get_variable_names x ) [] xs
		| ConstructorP(_, x) => get_variable_names x
		| _ => []

fun unique xs =
	case xs of
		[] => true
		| x::xs' => (not (List.exists (fn y => y = x) xs')) andalso unique xs'

val check_pat = unique o get_variable_names

(* 11 *)
fun match (vl, ptn) =
	case (vl, ptn) of
	(_, Wildcard) => SOME []
	| (_, Variable(x)) => SOME [(x, vl)]
	| (Unit, UnitP) => SOME []
	| (Const a, ConstP b) => if a = b then SOME [] else NONE
	| (Constructor (a, b), ConstructorP (c, d)) => if a = c then match (b, d) else NONE
	| (Tuple vs, TupleP ps) => if length vs = length ps then all_answers match (ListPair.zip (vs, ps)) else NONE
	| _ => NONE

(* 12 *)
fun first_match vl ps =
	SOME (first_answer (fn p => match (vl, p)) ps)
	handle NoAnswer => NONE

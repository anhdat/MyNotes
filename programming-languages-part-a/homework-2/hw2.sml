(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
(* 1a *)
fun all_except_option(str, strings) =
    case strings of
          []    =>  NONE
        | x::xs =>  if same_string(x, str)
                    then SOME xs
                    else
                        case all_except_option(str, xs) of
                              NONE     => NONE
                            | SOME xs' => SOME(x::xs')


(* 1b *)
fun get_substitutions1(substitutions, str) =
    case substitutions of
          []          => []
        | subs::subs_list =>
            case all_except_option(str, subs) of
                  NONE         => get_substitutions1(subs_list, str)
                | SOME strings => strings @ get_substitutions1(subs_list, str)


(* 1c *)
fun get_substitutions2(substitutions, str) =
    let
        fun substitute(substitutions, str, acc) =
            case substitutions of
                  []          => acc
                | subs::subs_list =>
                    case all_except_option(str, subs) of
                          NONE         => substitute(subs_list, str, acc)
                        | SOME strings => substitute(subs_list, str, acc @ strings)
    in
        substitute(substitutions, str, [])
    end

(* 1d *)
fun similar_names (substitutions, {first=first_name, last=last_name, middle=middle_name})=
    let
        fun get_names (subs, {first=first_name, last=last_name, middle=middle_name}) =
            case subs of
                  []    => []
                | x::xs =>
                    {first=x, last=last_name, middle=middle_name} :: get_names(xs, {first=first_name, last=last_name, middle=middle_name})

    in
        case substitutions of
              []    => []
            | x::xs =>
                case get_substitutions1(substitutions, first_name) of
                      []    => []
                    | y::ys => {first=first_name, last=last_name, middle=middle_name} :: get_names(y::ys, {first=first_name, last=last_name, middle=middle_name})
    end



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)

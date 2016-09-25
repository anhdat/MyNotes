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
        fun get_names (subs) =
            case subs of
                  []    => []
                | x::xs =>
                    {first=x, last=last_name, middle=middle_name} :: get_names(xs)

    in
        {first=first_name, last=last_name, middle=middle_name} :: get_names(get_substitutions1(substitutions, first_name))
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


(* 2a *)
fun card_color(suit, rank) =
    case suit of
          Clubs    => Black
        | Diamonds => Red
        | Hearts   => Red
        | Spades   => Black

(* 2b *)
fun card_value(suit, rank) =
    case rank of
          Ace   => 11
        | Num n => n
        | _     => 10

(* 2c *)
fun remove_card(cards, card, exc) =
    case cards of
          []    => raise exc
        | x::xs =>
            if x = card
            then xs
            else x :: remove_card(xs, card, exc)

(* 2d *)
fun all_same_color(cards) =
    case cards of
          []               => true
        | card::[]         => true
        | card::card_2::xs =>
            if card_color card = card_color card_2
            then all_same_color(card_2::xs)
            else false

(* 2e *)
fun sum_cards(cards) =
    let
        fun sum_cards_helper(cards, acc) =
            case cards of
                  []    => acc
                | x::xs => sum_cards_helper(xs, card_value(x) + acc)
    in
        sum_cards_helper(cards, 0)
    end


(* 2f *)
fun score(cards, goal) =
    let
        val sum = sum_cards(cards)
        val preliminary_score = if sum >= goal then 3 * (sum - goal) else goal - sum
    in
        if all_same_color(cards) then preliminary_score div 2 else preliminary_score
    end

(* 2g *)
fun officiate(cards, moves, goal) =
    let
        fun play(held_cards, cards, moves, goal)=
            case moves of
                  []    => score(held_cards, goal)
                | m::ms =>
                    case m of
                          Discard c => play(remove_card(held_cards, c, IllegalMove), cards, ms, goal)
                        | Draw      =>
                            case cards of
                                  []    => score(held_cards, goal)
                                | c::cs =>
                                    let
                                        val new_held_cards = c::held_cards
                                    in
                                        if sum_cards(new_held_cards) >= goal
                                        then score(new_held_cards, goal)
                                        else play(new_held_cards, cs, ms, goal)
                                    end
    in
        play([], cards, moves, goal)
    end

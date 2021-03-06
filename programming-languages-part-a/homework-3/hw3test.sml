use "hw3.sml";
(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
val test1 = only_capitals ["A","B","C"] = ["A","B","C"]
val test1_1 = only_capitals [] = []
val test1_2 = only_capitals ["A","b"] = ["A"]
val test1_3 = only_capitals ["bA","A"] = ["A"]

val test2 = longest_string1 ["A","bc","C"] = "bc"
val test2_1 = longest_string1 ["A","bc","Ca"] = "bc"
val test2_2 = longest_string1 ["A","Ca","bc"] = "Ca"
val test2_3 = longest_string1 [] = ""
val test2_4 = longest_string1 ["A"] = "A"

val test3 = longest_string2 ["A","bc","C"] = "bc"
val test3_1 = longest_string2 ["A","bc","Ca"] = "Ca"

val test4a = longest_string3 ["A","bc","C"] = "bc"
val test4b = longest_string4 ["A","B","C"] = "C"

val test5 = longest_capitalized ["A","bc","C"] = "A"
val test6 = rev_string "abc" = "cba"

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test8_1 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []
val test8_2 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [4,5,6,7] = SOME [4,5,6,7]
val test9a = count_wildcards Wildcard = 1
(*val test9a_1 = count_wildcards TupleP[Wildcard, Wildcard] = 2*)
val test9b = count_wild_and_variable_lengths (Variable("a")) = 1
val test9c = count_some_var ("x", Variable("x")) = 1

val test10a_1 = get_variable_names (Variable("x")) = ["x"]
val test10a_2 = get_variable_names (ConstructorP("SOME", Variable("y"))) = ["y"]
val test10a_3 = get_variable_names (TupleP[Variable("x"), Variable("y")]) = ["x","y"]

val test10b_1 = unique (["x"]) = true
val test10b_2 = unique (["x", "y"]) = true
val test10b_3 = unique (["x", "x"]) = false

val test10 = check_pat (Variable("x")) = true
val test10_2 = check_pat (ConstructorP("SOME", Variable("y"))) = true
val test10_3 = check_pat (TupleP[Variable("x"), Variable("x")]) = false

val test11 = match (Const(1), UnitP) = NONE
val test11_1 = match (Const(1), ConstP(1)) = SOME []
val test11_2 = match (Const(1), ConstP(2)) = NONE
val test11_3 = match (Const(1), ConstP(1)) = SOME []
val test11_4 = match (Const(1), Wildcard) = SOME []
val test11_5 = match (Const(1), Variable("x")) = SOME [("x", Const(1))]
val test11_6 = match (Constructor("SOME", Const(1)), ConstructorP("SOME", Variable("x"))) = SOME [("x", Const(1))]
val test11_7 = match (Tuple[Const(1), Const(2)], TupleP[ConstP(1), Variable("x")]) = SOME [("x", Const(2))]
val test11_8 = match (Tuple[Const(1), Const(2), Const(3)], TupleP[ConstP(1), Variable("x")]) = NONE

val test12 = first_match Unit [UnitP] = SOME []
(*













*)
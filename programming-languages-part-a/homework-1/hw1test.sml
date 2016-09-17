use "hw1.sml";

val test1 = is_older((1,2,3),(2,3,4)) = true
val test1_1 = is_older((1,2,3),(1,3,4)) = true
val test1_2 = is_older((1,2,3),(1,2,4)) = true
val test1_3 = is_older((1,2,3),(1,2,3)) = false
val test1_4 = is_older((1,2,3),(2,2,2)) = true
val test1_4_a = is_older((1,2,3),(2,2,2))
val test1_5 = is_older((2012,2,28),(2011,3,31)) = false
val test1_6 = is_older((2011,4,28),(2011,3,31)) = false
val test1_7 = is_older((2011,3,31), (2011,4,28)) = true
val test1_8 = is_older((2,2,2),(1,2,3)) = false

val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test2_2 = number_in_month ([(2012,3,28),(2013,12,1)],2) = 0

val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"
val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test8_1 = number_before_reaching_sum (10, [1,2,3,4,5])
val test8_2 = number_before_reaching_sum (11, [1,2,3,4,5]) = 4
val test9 = what_month 70 = 3
val test9_1 = what_month 31 = 1
val test9_2 = what_month 32 = 2
val test10 = month_range (31, 34) = [1,2,2,2]
val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11_1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)])
val test11_2 = oldest([]) = NONE
val test11_3 = oldest([(2012,3,31),(2011,4,28),(2012,2,28)]) = SOME (2011,4,28)
val test11_3_a = oldest([(2012,3,31),(2011,4,28),(2012,2,28)])
(*










*)
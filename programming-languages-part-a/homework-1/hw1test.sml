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
val test3_challenge = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,3,4]) = 3
val test_dup = remove_dup_num(2, [2,2,3,4]) = [3, 4]
val test_dup_v = remove_dup_num(2, [2,2,3,4])
(*val test_dups = remove_duplicates([2,2,3,3,4]) = [3, 4, 2]*)
val test_dups_v = remove_duplicates([2,2,3,3,4])

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

val test_leap_year = is_leap_year(2016) = true
val test_leap_year_1 = is_leap_year(2000) = true
val test_leap_year_2 = is_leap_year(2500) = false

val test_num_days_of_month = num_days_of_month(2, 2000) = 29
val test_num_days_of_month_1 = num_days_of_month(3, 2000) = 31
val test_num_days_of_month_1_v = num_days_of_month(3, 2000)
val test_num_days_of_month_2 = num_days_of_month(2, 2001) = 28
val test_num_days_of_month_3 = num_days_of_month(3, 2012) = 31

val test_13_1 = reasonable_date(2012,3,31) = true
val test_13_2 = reasonable_date(2012,3,32) = false
val test_13_3 = reasonable_date(2012,13,31) = false
val test_13_4 = reasonable_date(2001,2,29) = false
val test_13_5 = reasonable_date(2000,2,29) = true
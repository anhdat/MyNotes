(*
1. Write a function is_older that takes two dates and evaluates to true or false.
It evaluates to true if the first argument is a date that comes before the second argument.
(If the two dates are the same, the result is false.)
*)

fun is_older(a: (int*int*int), b: (int*int*int)) =
    let
        val year_a = #1 a
        val month_a = #2 a
        val day_a = #3 a

        val year_b = #1 b
        val month_b = #2 b
        val day_b = #3 b
    in
        if year_a > year_b
        then false
        else
            if year_a < year_b
            then true
            else
                (* year_a = year_b*)
                if month_a > month_b
                then false
                else
                    if month_a < month_b
                    then true
                    else
                       (* month_a = month_b*)
                       day_a < day_b
    end


(*
2. Write a function number_in_month that takes a list of dates and a month (i.e., an int)
and returns how many dates in the list are in the given month
*)

fun number_in_month(dates: (int*int*int) list, month: int) =
    if null dates then 0
    else
        let
            val date = hd dates
            val month_in_date = #2 date
            val num_date_in_current_month = if month_in_date = month then 1 else 0
        in
            num_date_in_current_month + number_in_month(tl dates, month)
        end


(*
3. Write a function number_in_months that takes a list of dates and a list of months
(i.e., an int list) and returns the number of dates in the list of dates
that are in any of the months in the list of months.
Assume the list of months has no number repeated.
Hint: Use your answer to the previous problem.
val number_in_months = fn : (int * int * int) list * int list -> int
*)
fun number_in_months(dates: (int * int * int) list, months: int list) =
    if null months then 0
    else
        number_in_month(dates, hd months) + number_in_months(dates, tl months)



(*

4. Write a function dates_in_month that takes a list of dates and a month (i.e., an int)
and returns a list holding the dates from the argument list of dates that are in the month.
The returned list should contain dates in the order they were originally given.
val dates_in_month = fn : (int * int * int) list * int -> (int * int * int) list
*)

fun dates_in_month(dates: (int*int*int) list, month: int) =
    if null dates then []
    else
        let
            val date = hd dates
            val month_in_date = #2 date
        in
            if month_in_date = month
            then
                date :: dates_in_month(tl dates, month)
            else
                dates_in_month(tl dates, month)
        end


(*
5. Write a function dates_in_months that takes a list of dates and a list of months
(i.e., an int list) and returns a list holding the dates from the argument list of dates
that are in any of the months in the list of months.
Assume the list of months has no number repeated.
Hint: Use your answer to the previous problem and SML’s list-append operator (@).
val dates_in_months = fn : (int * int * int) list * int list -> (int * int * int) list
*)

fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if null months then []
    else
        dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)


(*
6. Write a function get_nth that takes a list of strings and an int n and
returns the nth element of the list where the head of the list is 1st.
Do not worry about the case where the list has too few elements:
your function may apply hd or tl to the empty list in this case, which is okay.
val get_nth = fn : string list * int -> string
*)

fun get_nth(strings: string list, index: int) =
    if index = 1 then hd strings
    else
        get_nth(tl strings, index - 1)


(*
7. Write a function date_to_string that takes a date and
returns a string of the form January 20, 2013 (for example).
Use the operator ^ for concatenating strings and
the library function Int.toString for converting an int to a string.
For producing the month part, do not use a bunch of conditionals.
Instead, use a list holding 12 strings and your answer to the previous problem.
For consistency, put a comma following the day and use capitalized English month names:
January, February, March, April, May, June, July, August, September, October, November, December.
val date_to_string = fn : int * int * int -> string
*)

fun date_to_string(date: int*int*int) =
    let
        val MONTH_NAMES = [
            "January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"
        ]

        val year = #1 date
        val month = #2 date
        val day = #3 date
        val month_name = get_nth(MONTH_NAMES, month)
    in
        month_name ^ " " ^ Int.toString(day) ^ ", " ^ Int.toString(year)
    end


(*
8. Write a function number_before_reaching_sum that takes
an int called sum, which you can assume is positive,
and an int list, which you can assume contains all positive numbers, and returns an int.
You should return an int n such that the first n elements of the list add to less than sum,
but the first n + 1 elements of the list add to sum or more.
Assume the entire list sums to more than the passed in value;
it is okay for an exception to occur if this is not the case.
val number_before_reaching_sum = fn : int * int list -> int
*)

fun number_before_reaching_sum(sum: int, nums: int list) =
    if sum <= hd nums then 0
    else
        1 + number_before_reaching_sum(sum - hd nums, tl nums)


(*
9. Write a function what_month that takes a day of year (i.e., an int between 1 and 365)
and returns what month that day is in (1 for January, 2 for February, etc.).
Use a list holding 12 integers and your answer to the previous problem.
val what_month = fn : int -> int
*)
fun what_month(date_of_year: int) =
    let
        val nums_dates_in_month = [
            31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
        ]
    in
        number_before_reaching_sum(date_of_year, nums_dates_in_month) + 1
    end


(*
10. Write a function month_range that
takes two days of the year day1 and day2 and
returns an int list [m1,m2,...,mn]
where m1 is the month of day1, m2 is the month of day1+1, ...,
and mn is the month of day day2.
Note the result will have length day2 - day1 + 1 or length 0 if day1>day2.
val month_range = fn : int * int -> int list
*)

fun month_range(date_1: int, date_2: int) =
    if date_1 > date_2 then []
    else
        what_month(date_1) :: month_range(date_1 + 1, date_2)


(*
11. Write a function oldest that
takes a list of dates and evaluates to an (int*int*int) option.
It evaluates to
NONE if the list has no dates and
SOME d if the date d is the oldest date in the list.
val oldest = fn : (int * int * int) list -> (int * int * int) option
*)

fun oldest(dates: (int*int*int) list) =
    if null dates then NONE
    else
        let
            fun oldest_nonempty(dates: (int*int*int) list) =
                if null (tl dates)
                then hd dates
                else
                    let
                        val tl_ans = oldest_nonempty(tl dates)
                    in
                        if is_older(hd dates, tl_ans)
                        then hd dates
                        else tl_ans
                    end
        in
            SOME(oldest_nonempty dates)
    end


(*
12. Challenge Problem:
Write functions number_in_months_challenge and dates_in_months_challenge
that are like your solutions to problems 3 and 5
except having a month in the second argument multiple times has no more effect than having it once.
(Hint: Remove duplicates, then use previous work.)
*)
fun remove_dup_num(num: int, nums: int list) =
    if null nums then []
    else
        if num = hd nums
        then remove_dup_num(num, tl nums)
        else hd nums :: remove_dup_num(num, tl nums)


fun remove_duplicates(nums: int list) =
    if null nums then []
    else
        let
            val new_list = remove_dup_num(hd nums, nums)
        in
            hd nums :: remove_duplicates(new_list)
        end


fun number_in_months_challenge(dates: (int * int * int) list, months: int list) =
    if null months then 0
    else
        let
            val months = remove_duplicates(months)
        in
            number_in_months(dates, months)
        end


fun dates_in_months_challenge(dates: (int*int*int) list, months: int list) =
    if null months then []
    else
        let
            val months = remove_duplicates(months)
        in
            dates_in_months(dates, months)
        end


(*
13. Challenge Problem:
Write a function reasonable_date that takes a date
and determines if it describes a real date in the common era.
A “real date” has
a positive year (year 0 did not exist),
a month between 1 and 12,
and a day appropriate for the month.
Solutions should properly handle leap years.
Leap years are years that are either
divisible by 400 or
divisible by 4 but not divisible by 100.
(Do not worry about days possibly lost in the conversion to the Gregorian calendar
in the Late 1500s.)
*)
val NUMS_DATES_IN_MONTH = [
    31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
]


fun is_leap_year(year: int) =
    year mod 400 = 0 orelse (year mod 4 = 0 andalso year mod 100 <> 0)


fun pick(index: int, nums: int list) =
    if index = 0
    then hd nums
    else pick(index - 1, tl nums)


fun num_days_of_month(month: int, year: int) =
    if month = 2
    then
        if is_leap_year(year) then 29 else 28
    else
        pick(month + 1, NUMS_DATES_IN_MONTH)


fun reasonable_date(date: int*int*int) =
    let
        val year = #1 date
        val month = #2 date
        val day = #3 date
    in
        year > 0 andalso
        month < 12 andalso month > 1 andalso
        day > 0 andalso day <= num_days_of_month(month, year)
    end


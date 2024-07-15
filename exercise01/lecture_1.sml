(* Factorial *)
fun fact n: int =
    if n = 0 then 1
    else n * fact (n - 1);

print ("Factorial: " ^ Int.toString (fact 10) ^ "\n");

(* Odd-Even Devide and Conquer Factorial *)
fun oedc_fact_sub (n: int, m: int): int =
    if n > m then oedc_fact_sub (n, m * 2) * oedc_fact_sub (abs (n - m), m * 2)
    else n;

fun oedc_fact n = 
    if n = 0 then 1
    else oedc_fact_sub (n, 1);

print ("Odd-Even Devide and Conquer Factorial: " ^ Int.toString (oedc_fact 10) ^ "\n");

(* Summation *)
fun sum n =
    if n = 0 then 0
    else n + sum (n - 1);

print ("Summation: " ^ Int.toString (sum 1024) ^ "\n");

(* Odd-Even Devide and Conquer Summation *)
fun oedc_sum_sub (n, m) =
    if n > m then oedc_sum_sub (n, m * 2) + oedc_sum_sub (abs (n - m), m * 2)
    else n;

fun oedc_sum n = 
    if n = 0 then 0
    else oedc_sum_sub (n, 1);

print ("Odd-Even Devide and Conquer Summation: " ^ Int.toString (oedc_sum 1024) ^ "\n");

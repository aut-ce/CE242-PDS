"""
--/*
--**********************************************************
--  Design Automation Course Homework (Spring, 2020 Semester)
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce.aut.ac.ir
--  Created by TA (ali[dot]mohammadpour[at]ac[dot]ir)
--  *******************************************************
--  Student ID  : XXXXXXX
--  Student Name: -----------------
--  Student Mail: -----------------
--  *******************************************************
--  Module: ProblemSet 5, Problem 1, Fibonacci Model
--  *******************************************************
--  Additional Comments:
--*/
"""

import math

# This Source is an example of fibonacci soft model

phi = (1.0 + math.sqrt(5))/ 2.0

def fibo(n=1):
    return int( (phi ** n - (1 - phi) ** n) / math.sqrt(5))


for i in range(0, 15):
    print(fibo(i))


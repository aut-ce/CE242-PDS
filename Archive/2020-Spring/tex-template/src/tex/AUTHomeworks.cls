
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AUTHomeworks}
              [02/02/2020 v0.1
 FPGA laboratory manual document class in XeLaTeX for 
 Computer Engineering department of 
 Amirkabir University of Technology (Tehran Polytechnic)  
 ceit.aut.ac.ir
 ]
 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper,10pt]{article}
\def\CourseName{
طراحی سیستم‌های دیجیتال برنامه‌پذیر
}
\def\SemesterTerm{1}
\def\SemesterYear{1398}
\def\UniversiryName{
دانشگاه صنعتی امیرکبیر\\(پلی‌تکنینک تهران)
}
\def\DepartmentName{
دانشکده‌ی مهندسی کامپیوتر
}
\newcommand{\HomeworkSeries}{1}

\def\DeadlineHour{23}

\def\DeadlineMin{59}
\def\DeadlineYear{1398}
\def\DeadlineMonth{12}
\def\DeadlineDay{03}
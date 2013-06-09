Code Kata Four
==========
http://codekata.pragprog.com/2007/01/kata_four_data_.html

Questions Post-Exercise
---------
**To what extent did the design decisions you made when writing the original programs make it easier or harder to factor out common code?**
 - I made the reading of the dat file an external class, which allowed for ease of use when it was needed in the two parts

**Was the way you wrote the second program influenced by writing the first?**
 - Yes. The dat file followed the same format and the analysis of the data was the same. The only real difference was which columns had to be analyzed and taking into account absolute values

**Is factoring out as much common code as possible always a good thing? Did the readability of the programs suffer because of this requirement? How about the maintainability?**
 - ALWAYS factoring out common code will sometimes present an issue. If you look at the final state, the two methods that invoke the analysis essentially do the same thing. Even the printing to the screen is the same - it's just displayed differently. You could say I didn't follow the directions by refactoring all the common code - and it's true. I stopped where I believed the program was readable and maintainable. You could refactor it a bit more to have a SoccerDataAnalysis and WeatherDataAnalysis classes or SmallestSpreadAnalysis classes, etc, but then you start to complicate the system for no reason. You could say that doing so would break the common motto of TDD that's along the lines of 'do the least you could do to get the tests to pass' (which, ironically, I wrote no tests for this program, lol).


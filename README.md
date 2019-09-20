best-practices
Jamie Mothersbaugh, CSCI 7000 

This file explains the code in releases 1.0 and 2.0 of the cu-swe4s-fall-2019/best-practices-jamo4892 repository.

September 12 2019 (1.0)
1. Fixed style.py to conform to PEP8 formatting standards. This is checked with pycodestyle.
To install & run pycodestyle:
$ pip install pycodestyle
$ pycodestyle python_file.py

2. Fixed get_column_stats.py
Fixed code to conform to PEP8 formatting standards.
Added argparse for input parameters
Added error handling for input file (try-catch exceptions and exit codes)
Added error handling for chosen column number of input file (try-catch exceptions and exit codes)
Added comments to explain the code
To run get_column_stats.py:
$ python get_column_stats.py --file_name 'name of file' --col_num 'column number of file'

3. Fixed basics_test.sh
Added test with an out-of-range column number passed to get_column_stats.py
Added test with an incorrect input file name passed to get_column_stats.py
To run basics_test.sh:
$ bash basics_test.sh

September 19 2019 (2.0)
1. Edited get_column_stats.py
Converted code to find mean & standard deviation to functions

2. Wrote basics_test.py
Wrote unit tests for mean and standard deviation functions in get_column_stats.py
To run basics_test.py:
$ python basics_test.py

3. Edited basics_test.sh
Added lines to install Stupid Simple Bash Testing framework
Changed random integer, integer 1, wrong column number and wrong file name tests to use the new testing framework
To run basics_test.sh:
$ bash basics_test.sh

4. Edited .travis.yml
Added lines to run basics_test.py, the new version of basics_test.sh and pycodestyl on get_column_stats.py. This script is run automatically when changes to the code are pushed back up to the remote repository.
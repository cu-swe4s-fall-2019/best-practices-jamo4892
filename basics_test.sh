#!/bin/bash

pycodestyle style.py

pycodestyle get_column_stats.py

# Check Python scripts against PEP8.

test -e ssshtest || wget -q https://raw.githubusercontent.com/ryanlayer/ssshtest/master/ssshtest
. ssshtest

(for i in `seq 1 100`; do echo -e "$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM"; done )> data.txt

run random_test python get_column_stats.py --file_name data.txt --col_num 2
assert_no_stderr
assert_exit_code 0
# Test get_column_stats with second column of randomly generated integer list.

V=1
(for i in `seq 1 100`; do echo -e "$V\t$V\t$V\t$V\t$V"; done )> data.txt

run one_test python get_column_stats.py --file_name data.txt --col_num 1
assert_in_stdout "mean: 1.0"
assert_no_stderr
assert_exit_code 0

# Test get_column_stats with first column of integer list of all values =1.

(for i in `seq 1 100`; do echo -e "$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM"; done )> data.txt

run wrong_col_test python get_column_stats.py --file_name data.txt --col_num 8
assert_in_stdout 'Selected column number is > number of available columns'
assert_exit_code 1

# Test get_column_stats with column that doesn't exist in a randomly generated integer list.

(for i in `seq 1 100`; do echo -e "$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM"; done )> data.txt

run wrong_file_test python get_column_stats.py --file_name wrong_file.txt --col_num 2
assert_int_stdout 'Could not find wrong_file.txt'
assert_exit_code 1

# Test get_column_stats with name of an input file that doesn't exist.

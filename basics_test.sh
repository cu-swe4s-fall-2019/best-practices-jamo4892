#!/bin/bash

pycodestyle style.py

pycodestyle get_column_stats.py

# Check Python scripts against PEP8.

(for i in `seq 1 100`; do echo -e "$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM"; done )> data.txt

python get_column_stats.py --file_name data.txt --col_num 2

# Test get_column_stats with second column of randomly generated integer list.

V=1
(for i in `seq 1 100`; do echo -e "$V\t$V\t$V\t$V\t$V"; done )> data.txt

python get_column_stats.py --file_name data.txt --col_num 1

# Test get_column_stats with first column of integer list of all values =1.

(for i in `seq 1 100`; do echo -e "$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM"; done )> data.txt

python get_column_stats.py --file_name data.txt --col_num 8

# Test get_column_stats with column that doesn't exist in a randomly generated integer list.

(for i in `seq 1 100`; do echo -e "$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM\t$RANDOM"; done )> data.txt

python get_column_stats.py --file_name wrong_file.txt --col_num 2

# Test get_column_stats with name of an input file that doesn't exist.

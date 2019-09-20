import sys
import math
import argparse

# System modules.

parser = argparse.ArgumentParser(description='Best Practices Homework',
                                 prog='get_column_stats')

parser.add_argument('--file_name',
                    type=str,
                    help='Name of the file',
                    required=True)

parser.add_argument('--col_num',
                    type=int,
                    help='Column number',
                    required=True)


def Mean(V):
    return sum(V)/len(V)


def StDev(V):
    avg = Mean(V)
    return math.sqrt(sum([(avg-x)**2 for x in V]) / len(V))


if __name__ == "__main__":
    args = parser.parse_args()
    print(args.file_name, args.col_num)

    # Arguments passed from command line.

    f = None
    try:
        f = open(args.file_name, 'r')
    except FileNotFoundError:
        print('Could not find ' + args.file_name)
        sys.exit(1)
    except PermissionError:
        print('Could not open ' + args.file_name)
        sys.exit(1)

    # Error handling for file name.

    V = []

    for l in f:
        A = [int(x) for x in l.split()]
        try:
            V.append(A[args.col_num])
        except IndexError:
            print('Selected column number is > number of available columns')
            sys.exit(1)

    # Put all entries in the selected column into the list.
    # Error handling for column number.

    print('mean:', Mean(V))
    print('stdev:', StDev(V))
    sys.exit(0)

    # Calculate mean & standard deviation of V.

# Python script with unit tests for get_column_stats.py.

import unittest
import get_column_stats
import random
import statistics

# Import modules.


class GetColumnStatsTest(unittest.TestCase):
    def test_mean(self):
        V = []
        for i in range(0, 100):
            V.append(random.randint(-1000, 1000))
            # Fill V with 50 random integers between -1000 and 1000.

            self.assertEqual(round(get_column_stats.Mean(V), 4),
                             round(statistics.mean(V), 4))
            # Python mean = get_column_stats.Mean?

    def test_stdev(self):
        V = []
        for i in range(0, 200):
            V.append(random.randint(-500, 2000))
            # Fill V with 200 random integers between -500 and 2000.

            self.assertEqual(round(get_column_stats.StDev(V), 4),
                             round(statistics.pstdev(V), 4))
            # Python standard deviation = get_column_stats.StDev?

    def test_mean_exception(self):
        V = []
        self.assertRaises(ZeroDivisionError, get_column_stats.Mean, V)
        # Cannot calculate mean if list = 0 (can't divide by 0).


if __name__ == '__main__':
    unittest.main()

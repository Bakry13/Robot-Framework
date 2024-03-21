import csv


# from variables import paths

# filePath = paths.users_test_csv
# testDataPath = paths.testData

class csvReader(object):

    def read_csv_file(self, filename, rowIndex, columnIndex):
        '''This creates a keyword named "Read CSV File"

        This keyword takes one argument, which is a path to a .csv file. It
        returns a list of rows, with each row being a list of the data in
        each column.
        '''
        # filePath = testDataPath+filename
        data = []
        with open(filename, 'r') as csvfile:
            reader = csv.reader(csvfile)
            for row in reader:
                data.append(row)
        return data[int(rowIndex)][int(columnIndex)]

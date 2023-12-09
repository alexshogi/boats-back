import csv
import uuid

fin = open('products.csv', 'rt', encoding='utf-8')
fout = open('data.csv', 'w')

reader = csv.reader(fin, delimiter=',', quotechar='"')
writer = csv.writer(fout, delimiter=',', quotechar='"')

firstrow = True
for row in reader:
    if firstrow:
        row.append('id')
        firstrow = False
    else:
        row.append(uuid.uuid4())
    writer.writerow(row)
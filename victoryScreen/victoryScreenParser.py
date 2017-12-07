import csv
text_file = open("Output_WINNER.txt", "w")

text_file.write("\tcreateVictoryScreen:\n")
text_file.write("\t\tla $t0, BASE_ADDRESS\n\n")


with open("WINNER.csv") as csvfile:
        startReader = csv.reader(csvfile, delimiter=';', quotechar='|')
        for row in startReader:
            for value in row:
                if not value:
                    value = '0x8fff00'

                text_file.write('\t\tli $t1,' + value + '\n')
                text_file.write("\t\tsw $t1, 0($t0)\n")
                text_file.write("\t\taddi $t0, $t0, 4\n\n")

text_file.write("jr $ra")
text_file.close()

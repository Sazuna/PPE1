import os

path = "generated/contexts"

# get filenames
#word = "batiburrillo"
#n = 105 # ESP corpus length

word = "méli-mélo"
n = 100 # FR corpus length

filenames = [] # filename list
for i in range(1, n):
    filenames.append(f"{word}-{i}.txt")

with open(f"generated/wordcloud/{word}-output_file.txt", "w") as outfile:
    for fname in filenames:
        with open(f"{path}/{fname}") as infile:
            outfile.write(infile.read())
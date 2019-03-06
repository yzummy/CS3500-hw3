#!/bin/bash
flex lingzhang.l
bison lingzhang.y
g++ lingzhang.tab.c -o lingzhang_parser


for file in ./sample_input/*; do
lingzhang_parser < $file > "output/`basename "$file.out"`"
done

for file in ./output/*; do
diff $file "sample_output/`basename "$file"`" --ignore-space-change --side-by-side --ignore-case --ignore-blank-lines > "./diff_results/`basename "$file.diffout"`"

done

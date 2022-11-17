#!/bin/bash
WORD="$1" # 要找的词语
OUTPUT_NUMBER=0

# If the directory does not exist yet
# 不存在就新建文件夹
if [ ! -d "$WORD" ]
then
	mkdir "$WORD"
fi

echo "getting URLs of $2..."

# For every url in the file
for URL in $(cat $2)
do
    # 指定输出的txt的路径
	OUTPUT_FILE="$WORD"/$OUTPUT_NUMBER"_head.txt"
	# curl -i to get the header of the response before the body response
	# curl -I to get only the header of the response
    # curl：访问网页的工具，会返回header（本次访问的状态response code，如200/404，内容的类型 UTF8）和内容
    # curl -I：仅返回header
	RESPONSE=$(curl -I $URL)
    # 将返回的header存进上面的输出路径
	echo $RESPONSE > "$OUTPUT_FILE"
	./get_response_code.sh $RESPONSE
	OUTPUT_NUMBER=$(expr $OUTPUT_NUMBER + 1 )
done
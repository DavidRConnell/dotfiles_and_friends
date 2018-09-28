message_nums=$(grep -nA7 ^! $1.log | grep -o ^[0-9]* | sort | uniq)

for i in $(echo $message_nums);
	do cat $1.log | tail -n +$i| head -n 1;
done

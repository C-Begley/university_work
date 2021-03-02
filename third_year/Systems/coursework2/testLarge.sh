N=10000;
make clean
make

cd ./test
echo "Testing $N times"
for i in $(seq 1 $N)
do
    OUTPUT=$(../dependencyDiscoverer *.y *.l *.c | diff - output)

   if [ -z "$OUTPUT" ]; then
      echo -n ". \r"
   else
     echo -n "\n \n"
     echo "Test $i"
     echo "${OUTPUT} "
  fi 
done
echo -n "\n \n \n Done $N tests \n"


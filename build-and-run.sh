echo 'Building...'
gcc -Wall nsdncmon.m -o nsdncmon -lobjc -framework Foundation

echo 'Done building! Running...'
./nsdncmon
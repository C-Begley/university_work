let numbers = words "one two three four five six seven eight nine ten"
     backnums = map reverse numbers 
in last $ sort backnums

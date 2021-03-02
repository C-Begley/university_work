
punc = [',','.','!','"' '\'']

def word_counter(sentence):
    global punc 
    word_list = sentence.split()
    count = {}
    for word in word_list:
        word = word.lower()
        if word[0] in punc:
            word= word[1:]
        if word[(len(word)-1)] in punc:
            word = word[0:(len(word)-1)]


        count[word] = count.get(word,0) +1

    return count


print word_counter('The first test of the function. The second test of the function')


            
        
        

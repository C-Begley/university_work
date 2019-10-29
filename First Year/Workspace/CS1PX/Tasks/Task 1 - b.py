#Task 1 - b)

def split(combined_list):
    list1 = []
    list2 = []
    
    for i in range(len(combined_list)):
        list1.append(combined_list[i][0])
        list2.append(combined_list[i][1])
        
    return list1,list2

print split([[1, 'a'], [2, 'b'], [3, 'c']])

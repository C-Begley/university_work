#Task 1 - a)
def join(list1, list2):
    combined_list = []
    for i in range(len(list1)):
        combined_list.append([list1[i],list2[i]])
        
    return combined_list

print join([1,2,3], ['a','b','c'])

print join([], [])
        


#Step 1
birth_dict = {}
months = {'Jan':'January', 'Feb':'February', 'Mar':'March', 'Apr':'April', 'May':'May', 'Jun':'Jun', 'Jul':'July', 'Aug':'August', 'Sep':'September', 'Oct':'October', 'Nov':'November', 'Dec':'December'}

with open('birthdays.txt', 'r') as f:
    for line in f:
        data = line.strip().split(',')
        birth_dict[data[0]] = {'month': data[1], 'day':data[2] }

#Step 2
        
print 'Step 2 : \n'

def find_date(name):
    global month
    
    number = birth_dict[name]['day']

    date = prefix_adder(number)

    print name +': '+ date + 'of '+ months[birth_dict[name]['month']]


def prefix_adder(number):
    prefix ='th'
    if number[-1] == '1':
        prefix = 'st'

    if number[-1] == '2':
        prefix = 'nd'

    if number[-1] == '3':
        prefix = 'rd'

    return (number+prefix +' ')

find_date('John')
find_date('Susan')

print '-'*80
print'\n'


#Step 3

print 'Step 3: \n'


def find_month(month):
    people = []
    for name in birth_dict:
        if birth_dict[name]['month'] == month:
            people.append((name, birth_dict[name]['day']))

    print 'People with birthdays in ' +months[month] + ':'

    people = sorted(people, key=lambda person: person[1])
    for person in people:
        print person[0] + ': ' + prefix_adder(birth_dict[person[0]]['day'])


find_month('Apr')

print '-'*80
print'\n'

#Step 4
print 'Step 4 : \n'


next_month = {'Jan':'Feb', 'Feb':'Mar', 'Mar':'Apr', 'Apr':'May', 'May':'Jun', 'Jun':'Jul', 'Jul':'Aug', 'Aug':'Sep', 'Sep':'Oct', 'Oct':'Nov', 'Nov':'Dec', 'Dec':'Jan'}
days = {'Jan':31, 'Feb':28, 'Mar':31, 'Apr':30, 'May':31, 'Jun':30, 'Jul':31, 'Aug':31, 'Sep':30, 'Oct':31, 'Nov':30, 'Dec':31}


def upcoming(date, month):
    print 'Upcoming birthdays in the next week starting: ' + prefix_adder(str(date)) +'of ' + months[month]
    week = 7
    upcoming_people = []

    final_month = ''

    if date == 29 and month == 'Feb':
        days['Feb'] = 29

    if (date + week) > days[month]:
        final_date = (date +week) - days[month]
        final_month = next_month[month]

    for name in birth_dict:
        if (birth_dict[name]['month'] == month and int(birth_dict[name]['day']) > (date-1) ) or (birth_dict[name]['month'] == final_month and int(birth_dict[name]['day']) < (final_date +1)):
            upcoming_people.append((name,int(birth_dict[name]['day'])))

    upcoming_people = sorted(upcoming_people, key=lambda person: person[1])

    for person in upcoming_people:
        find_date(person[0]) 

upcoming(1,'Jan')
            

    

        
    
        
            

    


    
    




        
        

        

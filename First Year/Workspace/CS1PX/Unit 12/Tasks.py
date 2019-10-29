Book = {}
Quiting = False
months = {'Jan':'January', 'Feb':'February', 'Mar':'March', 'Apr':'April', 'May':'May', 'Jun':'Jun', 'Jul':'July', 'Aug':'August', 'Sep':'September', 'Oct':'October', 'Nov':'November', 'Dec':'December'}
next_month = {'Jan':'Feb', 'Feb':'Mar', 'Mar':'Apr', 'Apr':'May', 'May':'Jun', 'Jun':'Jul', 'Jul':'Aug', 'Aug':'Sep', 'Sep':'Oct', 'Oct':'Nov', 'Nov':'Dec', 'Dec':'Jan'}
days = {'Jan':31, 'Feb':28, 'Mar':31, 'Apr':30, 'May':31, 'Jun':30, 'Jul':31, 'Aug':31, 'Sep':30, 'Oct':31, 'Nov':30, 'Dec':31}

def getBirthdays(filename,book = Book, runs = 0):
    try:
        with open(filename, 'r') as f:
            for line in f:
                data = line.strip().split(',')
                Book[data[0]] = {'month': data[1], 'day': int(data[2]) }
        if runs == 0:
            print('Data from file added')
    except:
        print 'File did not exist'
        filename = raw_input('Please enter a valid file name')
        getBirthdays(filename)

    return Book

def prefix_adder(number):
    prefix ='th'
    if number[-1] == '1':
        prefix = 'st'

    if number[-1] == '2':
        prefix = 'nd'

    if number[-1] == '3':
        prefix = 'rd'

    return (number+prefix +' ')        

def read():
    filename = raw_input('Please enter a filename')
    getBirthdays(filename, Book)

def quits():
    global Quiting
    Quiting = True

def find_date
():
    global Book
    name = raw_input('Please enter the person\'s first name')
    if name not in Book:
                     find_date()

    else:
        finding_date(name)

def finding_date(name):
    global Book
    global months
                     
    number = str(Book[name]['day'])
    date = prefix_adder(number)

    print name +': '+ date + 'of '+ months[Book[name]['month']]

def checking_month():
    global months
    checking = True

    while checking:
        month = raw_input('Please enter the first three letters of the month')
        month = month.capitalize()
        if month in months:
            checking = False
    return month

def checking_date(month):
    global days
    checking = True
    
    while checking:
        date = raw_input('Please enter a  valid date')

        if date == 29 and month == 'Feb':
            days['Feb'] = 29

        if int(date) < days[month] +1:
            checking = False

    return date
        

def find_month():
    global Book
    month = checking_month()
    people = []
    for name in Book:
        if Book[name]['month'] == month:
            people.append((name, Book[name]['day']))

    print 'People with birthdays in ' +months[month] + ':'

    people = sorted(people, key=lambda person: person[1])
    for person in people:
        print person[0] + ': ' + prefix_adder(str(Book[person[0]]['day']))    

def upcoming():
    global months
    global Book
    
    month = checking_month()
    date = int(checking_date(month))
    week = 7
    upcoming_people = []
    final_month = ''
    
    print 'Upcoming birthdays in the next week starting: ' + prefix_adder(str(date)) +'of ' + months[month]

    if (date + week) > days[month]:
        final_date = (date +week) - days[month]
        final_month = next_month[month]

    for name in Book:
        if (Book[name]['month'] == month and int(Book[name]['day']) > (date-1) ) or (Book[name]['month'] == final_month and int(Book[name]['day']) < (final_date +1)):
            upcoming_people.append((name,int(Book[name]['day'])))

    upcoming_people = sorted(upcoming_people, key=lambda person: person[1])

    for person in upcoming_people:
        finding_date(person[0]) 

def adds():
    global Book
    entering = True
    while entering:
        person = raw_input('Please enter the person\'s first name')
        if person != '':
            entering = False
    month = checking_month()
    date = checking_date(month)
    Book[person] = {'month': month, 'day': int(date) }
    

def commands():
    print('The valid commands available are as follows:')
    print ''
    for command in command_dict:
        item = command
        print '%10s' %item , '-', command_dict[command][0]

command_dict = {'quit':['Quits the program', quits],'read':['Reads file with birthday information', read],'find_date':['Finds peoples\' birthday on that date', find_date], 'find_month' : ['Finds the birthdates of people in that month', find_month], 'commands':['Prints all the commands available', commands], 'upcoming':['Finds the people who have a birthday within the upcoming week', upcoming], 'add':['Adds the person and their birthday to the birthday Book', adds]}

def main():
    global Book
    global Quting
    
    Book = getBirthdays('birthdays.txt', Book , 1)
    
    print 'Welcome to the Birthday directory application.'
    print ''
    
    commands()
    
    while not Quiting:
        print'' 
        command = raw_input('Please enter a command:')
        command = command.strip()
        
        if command not in command_dict:
            print '\'%s\' is not a valid command , please enter a valid command' %command
            commands()
        else:
             command_dict[command][1]()
             
main()

import pickle
import date

Details = pickle.load(open('accounts.pck','r'))

instructions = ['w - withdraw money', 'd - deposit money','b - current balance','m - mini statement','c - cancel request']

Working = True

Account = 0

def check():
    acc_checking = True
    pin_checking = True
    global Details
    global Working
    global Account
    
    while acc_checking:
        Account = (raw_input('Please enter your Account number:'))
        
        if Account in Details:
            acc_checking = False

        elif Account =='0':
            acc_checking = False
            Working = False
        
        else:
            print 'Incorrect Account number'

    while pin_checking:
        pin = raw_input('Please enter your PIN:')
        
        if pin == (Details[Account]['pin']):
            pin_checking = False

        else:
            print 'Incorrect pin number'
                        
def instruction():
    global instructions
    print 'What would you like to do'
    for i in instructions:
        print i

def getAmount(amount):
    getting = True
    
    while getting:
        try:
            amount = float(amount)
            if amount > 0:
                getting = False

            else:
                print ('Please enter a positive float point number')
                amount = raw_input('Amount:')
                
        except:
            print ('Please enter a float point number')
            amount = raw_input('Amount:')

    return amount

    
def transaction(action, amount):
    global Account
    global Details
    getting = True

    amount = getAmount(amount)
    
    current = date.getDate()

    if action == 'w':
        if amount < Details[Account]['balance']:
            Details[Account]['transactions'].append({'date':current, 'nature':'w', 'amount':str(amount)})
            Details[Account]['balance'] -= amount
            print '£%.2f withdrawn' %(amount)
        else:
            print 'Insufficent Funds'

    else:
        Details[Account]['transactions'].append({'date':current, 'nature':'d', 'amount':str(amount)})
        Details[Account]['balance'] += amount
        print '£%.2f deposited' %(amount)

def withdraw(amount = 0):
    if amount == 0:
        amount = getAmount(amount)
    transaction('w', amount)
    
def deposit(amount):
    if amount == 0:
        amount = getAmount(amount)
        
    transaction('d', amount)

def balance():
    global Account
    print '£ %.2f' %(Details[Account]['balance'])

def statement():
    global Account
    print 'Acount %s mini-statement' % (Account)
    for i in Details[Account]['transactions'][-6:]:
        print 'Date:', i['date'], 

        if i['nature'] == 'w':
            print 'withdrawal',

        else:
            print 'deposit',

        print i['amount']
    
                      
        
    

def cancel():
    pass

Commands = {'w': withdraw, 'd':deposit, 'b':balance, 'm':statement, 'c':cancel}

def main():
    global Commands
    global Account
    global Working
    
    while Working:
        commanding = True
        check()
        instruction()
        while commanding:
            command = (raw_input('Action:'))
            commandsplit = command.split()
            
            if commandsplit[0] not in Commands:
                commandsplit = 'Invalid command !'.split()
                 
            if len(commandsplit) == 2:
                Commands[commandsplit[0]](commandsplit[1])
                commanding = False

            elif len(commandsplit) == 1:
                Commands[commandsplit[0]]()
                commanding = False

            else:
                print 'Invalid command. Please enter a correct one'
                    
    pickle.dump(details, open("new_accounts.pck", 'w'))

main()

#


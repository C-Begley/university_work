#
# Program to simulate an ATM
#
# The main data structure is a dictionary with account numbers
# (represented by strings) as keys, and account details as values.
#
# Details of an account are stored in a dictionary with the following
# keys and values:
#
# "pin" : the PIN, as a string
# "balance" : the account balance, as a floating point number
# "transactions" : a list of the last 6 transactions
#
# One transaction is stored as a dictionary with the following
# keys and values:
#
# "date" : the date and time, as a string
# "nature" : a string, "w" for withdrawal, "d" for deposit
# "amount" : the amount of withdrawal or deposit, as a floating point number

def getOption():
    print "Options:  w: withdrawal"
    print "          d: deposit"
    print "          b: display balance"
    print "          m: mini-statement"
    print "          c: cancel request"
    return raw_input("Choose option: ")

# load account details

# get account number
while account not zero: # need to edit this line
    if account found:   # need to edit this line
        # get PIN
        if correct PIN: # need to edit this line
            # get option
            # process option
        else:
            # report incorrect PIN
    else:
        # report invalid account number
    # get account number

# dump updated account details

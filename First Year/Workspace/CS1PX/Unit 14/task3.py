import Tkinter

Currencies = {1:'Euro', 2:'Pound', 3:'Dollar'}
Rates = {'Euro':1.0 ,'Pound':0.85 , 'Dollar':1.06 } #Rates relative to euro

top = Tkinter.Tk()

top.title('Currency Convertor')

def convert():
    global Currencies
    global Rates
    global Errors

    try:
        value = float(int(textVar.get()))

        ConIn = Inchoice.get()
        ConOut = Outchoice.get()

        if ConIn == ConOut:
            ValueLabel.configure(text = "Please choose different currencies" )

        else:
            rate = Rates[Currencies[ConOut]]/Rates[Currencies[ConIn]]
            conversion = (value*rate)
            ValueLabel.configure(text = "%.2f" % conversion)

    except:
        ValueLabel.configure(text = "Please enter a positive value" )


    
    

#Input Currencies

FromLabel = Tkinter.Label(top,text="From:",width=12)
FromLabel.grid(row=0,column=0)

textVar = Tkinter.StringVar("")
textEntry = Tkinter.Entry(top,textvariable=textVar,width=12)
textEntry.grid(row=0,column=1)

Inchoice = Tkinter.IntVar(0)

EuroInButton = Tkinter.Radiobutton(top,text="Euro",
                                  variable=Inchoice,value=1)
EuroInButton.grid(row=1,column=2)

PoundInButton = Tkinter.Radiobutton(top,text="Pound",
                                    variable=Inchoice,value=2)
PoundInButton.grid(row=1,column=3)

DollarInButton = Tkinter.Radiobutton(top,text="Dollar",
                                    variable=Inchoice,value=3)
DollarInButton.grid(row=1,column=4)

#Output Currencies

ToLabel = Tkinter.Label(top,text="To",width=12)
ToLabel.grid(row=3,column=0)

ValueLabel = Tkinter.Label(top,text="",width=30)
ValueLabel.grid(row=3,column=1)


Outchoice = Tkinter.IntVar(0)

EuroOutButton = Tkinter.Radiobutton(top,text="Euro",
                                  variable=Outchoice,value=1)
EuroOutButton.grid(row=4,column=2)

PoundOutButton = Tkinter.Radiobutton(top,text="Pound",
                                    variable=Outchoice,value=2)
PoundOutButton.grid(row=4,column=3)

DollarOutButton = Tkinter.Radiobutton(top,text="Dollar",
                                    variable=Outchoice,value=3)
DollarOutButton.grid(row=4,column=4)

ConvertButton = Tkinter.Button(top,text="Convert",command=convert)
ConvertButton.grid(row=7,column=5)

quitButton = Tkinter.Button(top,text="Quit",command=top.destroy)
quitButton.grid(row=8,column=5)

Tkinter.mainloop()

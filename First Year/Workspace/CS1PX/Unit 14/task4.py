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

def labelIn():
    global Currencies
    currency = Inchoice.get()
    InLabel.configure(text = Currencies[currency])

def labelOut():
    global Currencies
    currency = Outchoice.get()
    OutLabel.configure(text = Currencies[currency])


    
    

#Input Currencies
InLabel = Tkinter.Label(top,text="",width=10)
InLabel.grid(row=0,column=3)       

textVar = Tkinter.StringVar("")
textEntry = Tkinter.Entry(top,textvariable=textVar,width=12)
textEntry.grid(row=0,column=1)



Inchoice = Tkinter.IntVar(0)

fileMenuButton = Tkinter.Menubutton(top,text="From")
fileMenuButton.grid(row=0,column=0)
fileMenu = Tkinter.Menu(fileMenuButton,tearoff=0)
fileMenuButton.configure(menu=fileMenu)
fileMenu.add_radiobutton(label="Euro",variable=Inchoice,value=1, command = labelIn)
fileMenu.add_radiobutton(label="Pound",variable=Inchoice,value=2, command = labelIn)
fileMenu.add_radiobutton(label="Dollar",variable=Inchoice,value=3, command = labelIn)

#Output Currencies

ValueLabel = Tkinter.Label(top,text="",width=30)
ValueLabel.grid(row=3,column=1)

OutLabel = Tkinter.Label(top,text="",width=10)
OutLabel.grid(row=3,column=3)

Outchoice = Tkinter.IntVar(0)

fileMenuButton = Tkinter.Menubutton(top,text="To")
fileMenuButton.grid(row=3,column=0)
fileMenu = Tkinter.Menu(fileMenuButton,tearoff=0)
fileMenuButton.configure(menu=fileMenu)
fileMenu.add_radiobutton(label="Euro",variable=Outchoice,value=1,command = labelOut)
fileMenu.add_radiobutton(label="Pound",variable=Outchoice,value=2, command = labelOut)
fileMenu.add_radiobutton(label="Dollar",variable=Outchoice,value=3, command = labelOut)

ConvertButton = Tkinter.Button(top,text="Convert",command=convert)
ConvertButton.grid(row=7,column=5)

quitButton = Tkinter.Button(top,text="Quit",command=top.destroy)
quitButton.grid(row=8,column=5)

Tkinter.mainloop()

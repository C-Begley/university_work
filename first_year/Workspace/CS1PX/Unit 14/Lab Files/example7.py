
import Tkinter

def display():
    name = textVar.get()
    ch = choice.get()
    if ch == 1:
        message = "Hello "+name
    elif ch == 2:
        message = "Goodbye "+name
    else:
        message = ""
    messageLabel.configure(text=message)

top = Tkinter.Tk()

textVar = Tkinter.StringVar("")

def setName():
    w = Tkinter.Toplevel()
    textEntry = Tkinter.Entry(w,textvariable=textVar,width=12)
    textEntry.grid(row=0,column=0)
    confirmButton = Tkinter.Button(w,text="OK",command=w.destroy)
    confirmButton.grid(row=0,column=1)

messageLabel = Tkinter.Label(top,text="",width=12)
messageLabel.grid(row=1,column=0)

setButton = Tkinter.Button(top,text="Set name",command=setName)
setButton.grid(row=0,column=1)

choice = Tkinter.IntVar(0)

helloButton = Tkinter.Radiobutton(top,text="Hello",
                                  variable=choice,value=1,command=display)
helloButton.grid(row=1,column=1)

goodbyeButton = Tkinter.Radiobutton(top,text="Goodbye",
                                    variable=choice,value=2,command=display)
goodbyeButton.grid(row=1,column=2)

quitButton = Tkinter.Button(top,text="Quit",command=top.destroy)
quitButton.grid(row=1,column=3)

Tkinter.mainloop()

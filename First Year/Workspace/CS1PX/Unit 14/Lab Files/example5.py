
import Tkinter

def display():
    name = textVar.get()
    messageLabel.configure(text="Hello "+name)

top = Tkinter.Tk()

textVar = Tkinter.StringVar("")
textEntry = Tkinter.Entry(top,textvariable=textVar,width=12)
textEntry.grid(row=0,column=0)

messageLabel = Tkinter.Label(top,text="",width=12)
messageLabel.grid(row=1,column=0)

showButton = Tkinter.Button(top,text="Show",command=display)
showButton.grid(row=1,column=1)

quitButton = Tkinter.Button(top,text="Quit",command=top.destroy)
quitButton.grid(row=1,column=2)

Tkinter.mainloop()

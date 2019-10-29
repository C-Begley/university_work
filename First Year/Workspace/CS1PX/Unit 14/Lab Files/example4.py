
import Tkinter

def display():
    messageLabel.configure(text="Hello World!")

top = Tkinter.Tk()

messageLabel = Tkinter.Label(top,text="",width=12)
messageLabel.grid(row=0,column=0)

showButton = Tkinter.Button(top,text="Show",command=display)
showButton.grid(row=0,column=1)

quitButton = Tkinter.Button(top,text="Quit",command=top.destroy)
quitButton.grid(row=0,column=2)

Tkinter.mainloop()

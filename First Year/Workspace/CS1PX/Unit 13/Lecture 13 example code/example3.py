
import Tkinter

def display():
    messageLabel.configure(text="Hello World!")

top = Tkinter.Tk()

messageLabel = Tkinter.Label(top,text="")
messageLabel.grid()

showButton = Tkinter.Button(top,text="Show",command=display)
showButton.grid()

quitButton = Tkinter.Button(top,text="Quit",command=top.destroy)
quitButton.grid()

Tkinter.mainloop()



import Tkinter

def display():
    messageLabel = Tkinter.Label(top,text="Hello World!")
    messageLabel.grid()

top = Tkinter.Tk()


showButton = Tkinter.Button(top,text="Show",command=display)
showButton.grid()

quitButton = Tkinter.Button(top,text="Quit",command=top.destroy)
quitButton.grid()

Tkinter.mainloop()

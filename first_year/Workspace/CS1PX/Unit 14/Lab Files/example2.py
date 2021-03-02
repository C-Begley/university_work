
import Tkinter

top = Tkinter.Tk()

messageLabel = Tkinter.Label(top,text="Hello World!")
messageLabel.grid()

quitButton = Tkinter.Button(top,text="Quit",command=top.destroy)
quitButton.grid()

Tkinter.mainloop()

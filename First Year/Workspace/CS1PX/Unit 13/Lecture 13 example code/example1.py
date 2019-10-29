
import Tkinter

top = Tkinter.Tk()
#top.minsize(300,300)

quitButton = Tkinter.Button(top,text="Quit",command=top.destroy)
quitButton.grid()

Tkinter.mainloop()
#top.mainloop()

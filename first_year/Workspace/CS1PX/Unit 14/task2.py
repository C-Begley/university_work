import Tkinter
colour = 'white'

def display():
    name = textVar.get()
    messageLabel.configure(text="Hello "+name)

top = Tkinter.Tk()

top.title('the title of your choice')

top.geometry('500x50-20+20')  #500 wide, 50 high 20 across and 20 down from the top right corner

top.configure(bg = colour)

textVar = Tkinter.StringVar("")
textEntry = Tkinter.Entry(top,textvariable=textVar,width=12)
textEntry.grid(row=0,column=0)

messageLabel = Tkinter.Label(top,text="",width=12, bg =colour)
messageLabel.grid(row=1,column=0)

showButton = Tkinter.Button(top,text="Show",command=display, bg =colour ,activebackground= colour)
showButton.grid(row=1,column=1)

quitButton = Tkinter.Button(top,text="Quit",command=top.destroy, bg = colour ,activebackground= colour)
quitButton.grid(row=1,column=2)

Tkinter.mainloop()

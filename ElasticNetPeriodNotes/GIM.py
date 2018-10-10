import os
current=os.getcwd()
Allname=os.listdir(current)
newlist=[]
for n in Allname:
    if n.endswith(".md"):
        newlist.append(n)
print newlist
AutoMd=current+'/autoInd.md'
f=open(AutoMd,'w')
f.write("# All md in this directory"+'\n')
for n in newlist:
    documentname='['+n+']'
    hyperlink='('+n+')'
    f.write(documentname+hyperlink+'\n'+'\n'+'\n')
f.close()

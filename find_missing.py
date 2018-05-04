#for sorting the the ASCIs from the text file and to find the rejected ASICs number.
import matplotlib.pylab as plt

f=open("file.txt","r")

lines=f.readlines()

#print(lines)

#choose the column want

result=[]

for x in lines:

    result.append(x.split(' ')[1])

f.close()

#print(result)
#sorting the rank
#sorted(result,reverse=True)
#sorting the ICs
result.sort()
# printing the ASICs from  the list of -- and use that to d find the missing one

print('Sorting the ASICS-- The Selected one')
      
for i in range(1,len(result)):
    print(result[i])
      

#for i in range(1,len(result)):
# if i==1:
print('The failed ASICs are')

for j in range (1,len(result)-1):
    x=int(result[j+1])-int(result[j])
    if x!=1:
       for k in range(1,x):
           print(int(result[j])+k)


plt.plot(result)
#plt.show()

print (len(result))

# most of the ADC are having problem with stuck code fraction

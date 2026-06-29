#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Name: Jeremiah Richard
# ID: 1001475742
# Lang ver. : Python 3 (ipykernel) - 3.10.5v
# OS: Windows 10
# Ran on Juypter Notebook

def rpn(expression):
    result = 0
    
    # Need array for storing digits
    digit = [] 
    
    #Need to take apart the expression
    for char in expression:
        if((char >= "0") and (char <= "9")):
            #Add digit into array
            digit.append(char)
         #DEBUG   print("New List ", len(digit), ": \n", digit)
        elif((char == "+") or (char == "-") or (char == "*") or (char == "/")):
            # Converting strings to integers
            dig1 = int(digit[-1])
            dig2 = int(digit[len(digit)-2])
            if(char == "+"):
                result = dig2 + dig1 #OPERATION
                digit[len(digit)-2] = result # Store Result in 2nd last index
                del digit[-1]   # Delete last one
            elif(char == "-"):
                result = dig2 - dig1
                digit[len(digit)-2] = result
                del digit[-1]
            elif(char == "/"):
                result = dig2 / dig1
                digit[len(digit)-2] = result
                del digit[-1]
            elif(char == "*"):
                result = dig2 * dig1
                digit[len(digit)-2] = result
                del digit[-1]
    #DEBUG print("Last List Update: \n", digit)
    return result;


# In[2]:


def main():
    file = open("input_RPN.txt", "r")
    for line in file:
        result = rpn(line)
        print("OUTPUT: ", result)
    
if __name__ == '__main__':
    main()


# In[ ]:





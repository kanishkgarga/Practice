def fibo_series(num):
    if (num==0):
        return 0
    elif(num==1):
        return 1
    else:
        return (fibo_series(num-1) +fibo_series(num-2))
        
print(fibo_series(6))





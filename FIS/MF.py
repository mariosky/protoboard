#!/usr/bin/env python

import math

class MF:
    def __init__ (self,term, mf):
        self.term = term    
        self.mf = mf
    def eval(self, x):
        return self.mf.eval(x)
    
class Triangular():
    def __init__ (self,a,b,c):
        self.a = a
        self.b = b
        self.c = c
        
    def eval(self,x):
        if x <= self.a or self.c <= x:
            result = 0;
        elif self.a <= x <= self.b:
            result = (x-self.a) / (self.b-self.a)
        elif self.b <= x  <= self.c:
            result = (self.c-x) / (self.c- self.b)
        return result       


class Bell():
    def __init__ (self,a,b,c):
        if a == 0:
            return "Error: invalid parameter"
        self.a = a
        self.b = b
        self.c = c
        
    def eval(self,x):
        return 1/(1+ math.pow( math.fabs((x-self.c)/self.a),2*self.b))
 
           
class Trapezoidal():
    def __init__ (self,a,b,c,d):
        self.a = a
        self.b = b
        self.c = c
        self.d = d
   
    def eval(self,x):
        if x <= self.a or self.d < x:
            result = 0;
        elif self.a <= x <= self.b:
            result = (x-self.a) / (self.b-self.a)
        elif self.b <= x <= self.c:
            result = 1
        elif self.c <= x  <= self.d:
            result = (self.d-x) / (self.d- self.c)
        return result

class Gaussian():
    def __init__ (self,sigma,c ):
        self.c = c
        self.sigma = sigma
   
    def eval(self,x):
        return math.exp(-1*(x-self.c)**2 / (2*self.sigma**2) )


 
if __name__ == "__main__":
 
 params = (20.0,25.0,30.0)
 tri = Triangular(*params)
 print ("Triangular")
 print (tri.eval(0.5))
    
 params = (7.0, 9.0, 10.0, 10.0)
 tri = Trapezoidal(*params)
 print ("Trapezoidal")
 print (tri.eval(10.0))
 
 print ("Gaussian")
 gaus = Gaussian(1.5,10.0)
 print (gaus.eval(3.0))


 
 
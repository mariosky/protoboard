#!/usr/bin/env python

from FIS import MF

class LinguisticVariable:
    def __init__(self, name, type="in", mfs=None, current_value = 0.0, range = None ):
        self.name = name
        if mfs is None:
            self.mfs = {}
        else:
            self.mfs = mfs
        self.type =type
        self.current_value = current_value
        
        ## Las variables de salida deben tener un Rango
        if type=="out" and range is None:
            self.range = (0,100)
        else:
            self.range = range
        
    def addMF(self,name,mf):
        if name in self.mfs:
            self.mfs[name].append(mf)
        else:
            self.mfs[name] = mf
        #self.mfs.append(MF.MF(name,mf))

class FuzzyProposition:
    def __init__(self, lv, mf, weight=1, negated = False):
        self.lv = lv
        self.mf = mf
        self.weight = weight
        self.negated = negated
    def eval(self, x=None):
        if x is None:
            return self.mf.eval(self.lv.current_value)
        else:
            return self.mf.eval(x)

class FuzzyOperator:
    def __init__(self,type,l,r):
        self.type = type
        self.l = l
        self.r =r
    def eval(self):
        if self.type == 'or':
            return max(self.l.eval(),self.r.eval())
        elif self.type == 'and':
            return min(self.l.eval(),self.r.eval())
        else:
            return "Error"
    
class FuzzyRule:
    def __init__(self, name="",antecedent = None,consequent = None):
        self.name = name
        if antecedent is None:
            self.antecedent = []
        else:
            self.antecedent = antecedent  
        
        if consequent is None:
            self.consequent = []
        else:
            self.consequent = consequent
    
    def getQualConsequence(self):
        degreeOfSupport = self.antecedent[0].eval()
        return QualConsequence(degreeOfSupport, self.consequent[0].mf)
   
   
class QualConsequence:
    def __init__(self, degreeOfSupport, mf):
        self.degreeOfSupport = degreeOfSupport
        self.mf = mf
    
    def eval(self, x):
        return min(self.degreeOfSupport, self.mf.eval(x))
  
class FIS():
    def __init__(self, rules = None):
        if rules == None:
            self.rules = []
        else:
            self.rules = rules
    def composition(self):
        return [r.getQualConsequence() for r in self.rules]

    def eval(self):
        Composition = [r.getQualConsequence() for r in self.rules]
        
        
        smallest,largest = self.rules[0].consequent[0].lv.range
        num = 0.0
        denom = 0.0
        
        delta = (largest - smallest) / 100.0
        
        x = smallest
        
        while x <= largest:
            #m = 0.0;
            m = max([q.eval(x) for q in Composition])
            #for q in Composition:
            #    mtest = q.eval(x)
            #    if mtest > m:
            #        m = mtest
            #print mtest,  m , x
            num += x * m
            denom += m;
            x+=delta
        if denom == 0:
           result = (0.0 + 10.0) / 2
        else:
            result = num / denom   
        return round(result,2)

if __name__ == "__main__":
    pass
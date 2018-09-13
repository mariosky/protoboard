#!/usr/bin/env python
from FIS.FIS import *

# Performance
visual = LinguisticVariable('Visual')
visual.addMF('Mild',MF.Bell(6, 3, 2.5))
visual.addMF('Strong',MF.Bell(13, 3.0, 25.0))


verbal = LinguisticVariable('Verbal')
verbal.addMF('Mild',MF.Bell(6, 3, 2.5))
verbal.addMF('Strong',MF.Bell(11, 3.0, 25.0))

recomended = LinguisticVariable('Recomended' , type = 'out', range = (0,10)  )
recomended.addMF('High',MF.Trapezoidal(6.0,7.0,10.0,10.0))
recomended.addMF('Low',MF.Trapezoidal(0.0,0.0,4.0, 7.0))


# Rules
r1 = FuzzyRule()
r1.antecedent.append(FuzzyOperator('and',FuzzyProposition(visual,visual.mfs['Strong']),FuzzyProposition(verbal,verbal.mfs['Mild'])))
r1.consequent.append(FuzzyProposition(recomended,recomended.mfs['Low']))

r2 = FuzzyRule()
r2.antecedent.append(FuzzyOperator('and',FuzzyProposition(visual,visual.mfs['Mild']),FuzzyProposition(verbal,verbal.mfs['Strong'])))
r2.consequent.append(FuzzyProposition(recomended,recomended.mfs['High']))



reglas = [r1,r2]
 
fis = FIS(reglas)
    
def eval(ver, vi):
    verbal.current_value = ver
    visual.current_value = vi
    return fis.eval()

if __name__ == '__main__':
    print (eval(12.5 , 6.31))

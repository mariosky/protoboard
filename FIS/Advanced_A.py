#!/usr/bin/env python
from FIS.FIS import *

# Performance
performance  = LinguisticVariable('Performance')
performance.addMF('Low',MF.Trapezoidal(0.0, 0.0, 40, 70))
performance.addMF('Medium',MF.Bell(15.0,5.0, 60.0))
performance.addMF('High',MF.Trapezoidal(80.0,90.0,100.0,100.0))

visual = LinguisticVariable('Visual')
visual.addMF('Mild',MF.Bell(9.0, 6.0, -2.956))
visual.addMF('Moderate',MF.Gaussian(3.5,10.0))
visual.addMF('Strong',MF.Bell(6.0, 4.0, 20.0))


recomended = LinguisticVariable('Recomended' , type = 'out', range = (0,10)  )
recomended.addMF('High',MF.Trapezoidal(5.0,6.0,10.0,11.0))
recomended.addMF('Low',MF.Trapezoidal(0.0,0.0,4.0, 6.0))


# Rules
r1 = FuzzyRule()
r1.antecedent.append(FuzzyOperator('and',FuzzyProposition(performance,performance.mfs['High']),FuzzyProposition(visual,visual.mfs['Strong'])))
r1.consequent.append(FuzzyProposition(recomended,recomended.mfs['High']))

r2 = FuzzyRule()
r2.antecedent.append(FuzzyProposition(performance,performance.mfs['Low']))
r2.consequent.append(FuzzyProposition(recomended,recomended.mfs['Low']))

r3 = FuzzyRule()
r3.antecedent.append(FuzzyOperator('and',FuzzyProposition(performance,performance.mfs['High']),FuzzyProposition(visual,visual.mfs['Mild'])))
r3.consequent.append(FuzzyProposition(recomended,recomended.mfs['Low']))


r4 = FuzzyRule()
r4.antecedent.append(FuzzyProposition(performance,performance.mfs['Medium']))
r4.consequent.append(FuzzyProposition(recomended,recomended.mfs['Low']))


reglas = [r1,r2,r3,r4]
 
fis = FIS(reglas)
    
def eval(p, v):
    performance.current_value = p
    visual.current_value = v
    return fis.eval()

if __name__ == '__main__':
    print (eval(50,15))

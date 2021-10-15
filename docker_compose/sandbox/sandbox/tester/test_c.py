__author__ = 'mariosky'
# -*- coding: utf-8 -*-
import shutil
import os
import tempfile
import subprocess
import json
import re

def run_test(code, test):
    try:
        java_class = test[2:test.index('\n')-len('Test')]
        code = unicode(code)
        test = unicode(test)


        tmp_dir = tempfile.mkdtemp()
        print tmp_dir
        tmp_program = open(os.path.join(tmp_dir, "%s.java" % java_class ),'w')
        tmp_program.write(code.encode('utf8'))
        tmp_program.close()
        result = [],0


        tmp_test = open(os.path.join(tmp_dir, "%sTest.java" % java_class ),'w')
        tmp_test.write(test.encode('utf8'))
        tmp_test.close()



        #COMPILE Program
        try:
            out = subprocess.check_output(['javac',os.path.join(tmp_dir,"%s.java" % java_class)], stderr=subprocess.STDOUT)
            result = (out,0)
        except subprocess.CalledProcessError , e:
            result = (json.dumps({ 'successes':[],'failures':[], 'errors': e.output.split('\n'), 'stdout': "", 'result': "Failure"}),e.returncode)
            return result

        #COMPILE Test
        try:
            out = subprocess.check_output(['javac','-cp','%s:/usr/share/java/hamcrest-core.jar:/usr/share/java/junit.jar' % tmp_dir, os.path.join(tmp_dir, "%sTest.java" % java_class)], stderr=subprocess.STDOUT)
            result = (out,0)
        except subprocess.CalledProcessError , e:
            result = (json.dumps({ 'successes':[],'failures':[], 'errors': e.output.split('\n'), 'stdout': "", 'result': "Failure"}),e.returncode)
            return result


        #TEST
        try:
            out = subprocess.check_output(['java','-cp', '%s:/usr/share/java/hamcrest-core.jar:/usr/share/java/junit.jar' % tmp_dir ,'org.junit.runner.JUnitCore', "%sTest" % java_class], stderr=subprocess.STDOUT)
            result = (process_out_as_json(out),0)
        except subprocess.CalledProcessError , e:
            result = process_error_as_json(e.output), e.returncode
        finally:
            shutil.rmtree(tmp_dir)
        return result
    except Exception, e:
        return ["Error, could not evaluate"], e


def process_out_as_json(output):
    # La salida de STDOUT estara primero
    # Extraerla y agregarla al json out
    stdout = []
    res = []
    if output:
        for l in output.split('\n'):
            if len(l) >0:
                if  l.startswith('JUnit'):
                    res.append(l)
                    continue
                if l.startswith('.'):
                    no_dots = re.sub(r'^\.*', '', l)
                    stdout.append(no_dots)
                    continue
                if l.startswith('Time') or l.startswith('OK'):
                    stdout.append(l)
                    continue
                stdout.append(l)
    result = {}
    result['result'] = "Success"
    result['errors']=  res
    result['failures']=  []
    result['successes']=  []
    result['stdout']=  stdout
    return json.dumps(result)


def process_error_as_json(output):
    res = []
    if output:
        for l in output.split('\n'):
            if len(l) >0 and not l.startswith('\t'):
                if  l.startswith('JUnit'):
                    res.append(l)
                    continue

                if l.startswith('.'):
                    no_dots = re.sub(r'^\.*', '', l)
                    res.append(no_dots)
                    continue
                res.append(l)
    result = {}
    result['result'] = "ProcessError"
    result['errors']=  res
    result['failures']=  []
    result['successes']=  []
    return json.dumps(result)



if __name__ == "__main__":
    test = r"""//CalculatorTest
    import static org.junit.Assert.assertEquals;
    import org.junit.Test;

    public class CalculatorTest {
      @Test
      public void evaluatesExpression() {
        System.out.println("Hello, World");
        Calculator calculator = new Calculator();
        int sum = calculator.evaluate("1+2+3");
        assertEquals(6, sum);
      }
    }"""

    code = r"""
    public class Calculator {
      public int evaluate(String expression) {
        int sum = 0;
        for (String summand: expression.split("\\+"))
          sum += Integer.valueOf(summand);
        return sum;
      }
    }"""

    print run_test(code, test)

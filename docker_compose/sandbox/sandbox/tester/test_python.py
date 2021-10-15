# -*- coding: utf-8 -*-
# Based on: http://readevalprint.github.com/blog/python-sandbox-with-pypy-part2.html


import shutil, os, tempfile
import subprocess,json, re


def run_test(code, test):
    try:

        code = """# -*- coding: utf-8 -*-\n""" +  code + test_begin + test +test_end
        tmp_dir = tempfile.mkdtemp()
        tmp_script = open(os.path.join(tmp_dir, "script.py"),'w')
        tmp_script.write(code)
        tmp_script.close()

        script_path = os.path.join(tmp_dir, "script.py")
        result = [],""
        try:
            out = subprocess.check_output(['python3',script_path], stderr=subprocess.STDOUT)
            result = (process_out_as_json(out.decode('utf-8')),0)


        except subprocess.CalledProcessError as e:
            result = process_error_as_json(e.output.decode('utf-8')), e.returncode

        finally:
            shutil.rmtree(tmp_dir)
        return result
    except Exception as e:
        return (json.dumps({
            'successes':[],
            'failures': [],
            'errors': [],
            'stdout': 'outer:'+str(e),
            'result': 'ProcessError'
        }) , 1)

def process_out_as_json(output):
    # La salida de STDOUT estara primero
    # Extraerla y agregarla al json out
    successes = []
    failures = []
    stdout = []
    N = 0 #Number of tests

    for l in output.split('\n'):
        if len(l) > 0:
            if l.startswith('#'):
                continue
            if l.startswith('ok'):
                successes.append(l[3:])
                continue
            if l.startswith('not ok'):
                failures.append(l[7:])
                continue
            if l.startswith('1..'):
                N = int(l[3:])
                continue
            stdout.append(l)


    result = failures and 'Failure' or 'Success'


    return json.dumps({
        'successes': successes,
        'failures': failures,
        'errors': [],
        'stdout': stdout,
        'result':result
    })

def process_error_as_json(output):
    return json.dumps({
        'successes': [],
        'failures': [],
        'errors': [],
        'stdout': output,
        'result': 'ProcessError'
    })




test_begin = u"""
import unittest
from tap import TAPTestRunner
"""

test_end = u"""
if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(Test)
    runner = TAPTestRunner()
    runner.set_stream(True)
    runner.run(suite)
"""

if __name__ == "__main__":
    code = """
def suma(a,b):
    print (a,b)
    return a+b
    """

    test = '''
class Test(unittest.TestCase):
    def test_Action(self):
        """Debes sumar mal"""
        self.assertEqual(suma( 1, 3), 4)
    def test_Action2(self):
        """Debes sumar bien"""
        self.assertEqual(suma( 1, 3), 4)'''

    print (run_test(code, test))


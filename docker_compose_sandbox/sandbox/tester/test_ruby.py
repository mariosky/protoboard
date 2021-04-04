# -*- coding: utf-8 -*-

import shutil
import os
import tempfile
import subprocess
import json

def run_test(code, test, type=None):
    try:
        code = """using NUnit.Framework;
        """ + code + test
        code = unicode(code)
        tmp_dir = tempfile.mkdtemp()
        tmp_script = open(os.path.join(tmp_dir, "ProgramTest.cs"),'w')
        tmp_script.write(code.encode('utf8'))
        tmp_script.close()
        result = [],0

        #COMPILE
        try:
            out = subprocess.check_output(['mcs',os.path.join(tmp_dir, "ProgramTest.cs"),  '/pkg:nunit',  '-target:library'], stderr=subprocess.STDOUT)
            result = (out,0)
        except subprocess.CalledProcessError , e:
            result = (json.dumps({ 'successes':[],'failures':[], 'errors': e.output.split('\n'), 'stdout': "", 'result': "Failure"}),e.returncode)
            return result

        #TEST
        try:
            out = subprocess.check_output(['nunit-console','-nologo', '-nodots','-output=out.txt',os.path.join(tmp_dir, "ProgramTest.dll")], stderr=subprocess.STDOUT)
            result = (_result(),0)
        except subprocess.CalledProcessError , e:
            result =  (_result(), e.returncode)
        finally:
            shutil.rmtree(tmp_dir)

        return result
    except Exception, e:
        return ["Error, could not evaluate"], e


def _result():
    import xml.etree.ElementTree as ET
    tree = ET.parse('TestResult.xml')
    a = open('out.txt')
    r = {
        'successes': [e.attrib['description']   for e in  tree.findall(".//test-case[@result='Success']")],
        'failures': [e.attrib['description'] for e in  tree.findall(".//test-case[@result='Failure']")],
        'errors': [],
        'stdout': a.read(),
        'result': tree.findall("test-suite")[0].attrib['result']
    }

    return json.dumps(r)

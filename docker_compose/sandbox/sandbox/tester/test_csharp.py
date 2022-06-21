# -*- coding: utf-8 -*-
import shutil
import os
import tempfile
import subprocess
import json


def run_test(code, test):
    try:
        # Create folder
        tmp_dir = tempfile.mkdtemp()
        print("Folder Created:",tmp_dir )

        # Create the project
        print("Copy Project Folder", tmp_dir)

        try:
            out = subprocess.check_output(
                ['cp','-r', '/home/sandbox/test_csharp/', tmp_dir],
                stderr=subprocess.STDOUT)
            print("out:", out)
            print("Project Copied")
        except subprocess.CalledProcessError as e:
            print("out Exception:", e)
            result = (json.dumps(
                {'successes': [], 'failures': [], 'errors': e.output.decode('utf8').split('\n'), 'stdout': "",
                 'result': 'ProcessError'}), e.returncode)
            return result

        # Create the file
        code = """using Xunit;
        """ + code + test
        tmp_script = open(os.path.join(tmp_dir, "UnitTest1.cs"), 'w')
        tmp_script.write(code)
        tmp_script.close()
        result = [], 0
        print("File Created")

        # TEST
        try:
            out = subprocess.check_output(
                ['dotnet', 'test', tmp_dir+'/test_csharp', '--nologo', '--no-restore'],
                stderr=subprocess.STDOUT)
            print("Pass TEST:", out)
            result = (json.dumps({
                'successes': out.decode('utf8').split("\n"),
                'failures': [],
                'errors': [],
                'stdout': '',
                'result': 'Success'
            }), 0)

        except subprocess.CalledProcessError as e:
            print("Fail TEST:", e.output.decode('utf8'))
            return (json.dumps({
                'successes': [],
                'failures': [e.output.decode('utf8')],
                'errors': [],
                'stdout': 'outer:' + str(e),
                'result': "Failure"
            }), 1)
        finally:
            shutil.rmtree(tmp_dir)

        return result
    except Exception as e:
        return ["Error, could not evaluate"], e

if __name__ == "__main__":
    code = """using System.IO;
    using System;
    
    public class Product
    {
            public int  code;
            public string  desc;

            public Product(int c, string d)
            {
            code=c;
            desc=d;
            }

            public void Print()
            {
            Console.WriteLine("Producto {0}: {1}", code,desc);
            }

    }"""

    test = """
    public class ProductTest
    {

        [Fact]
        public void Constructor()
        {
            Product p = new Product(1,"hola");
            // Constraint Syntax
            Assert.Equal(1,p.code);
        }


        [Fact]
        public void PrintTest()
        {
            Product p = new Product(1,"hola");
            p.Print();

            using (StringWriter sw = new StringWriter())
            {
                Console.SetOut(sw);


                p.Print();

            string expected = "Producto 1: hola";
            Assert.StartsWith(expected, sw.ToString());


            }

        }
    }"""

    print((run_test(code, test)))

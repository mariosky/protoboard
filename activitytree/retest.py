

import re


def re_tests(program, test_list):
    return [ error  for test, error  in test_list if pattern_match(program ,test, error) ]


def pattern_match(program, test,error):
    if re.search(test,program,re.MULTILINE):
        return None
    else:
        return error

def get_strings(re_list):
    return [map(str.strip, row.split("%")) for  row in re_list.split('\n') if len(row.split("%")) == 2]

def re_test(program, pattern):
    strings = get_strings(pattern)
    return re_tests(program,strings)




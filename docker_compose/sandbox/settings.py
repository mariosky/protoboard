

settings = {
"csharp": {"command" :"python3 /home/sandbox/worker.py", "image": 'mariosky/sandbox-csharp:latest',"containers": 1},
"python": {"command": "python3 /home/sandbox/worker.py", "image": 'mariosky/sandbox-python:latest',"containers": 1},
"java"  : {"command" :"python /home/sandbox/worker.py", "image": 'mariosky/sandbox-java:latest'  ,"containers": 1},
"perl6" : {"command": "python /home/sandbox/worker.py", "image": 'mariosky/sandbox-perl6:latest' ,"containers": 1},
"golang": {"command" :"python /home/sandbox/worker.py", "image": 'mariosky/sandbox-golang:latest',"containers": 1},
}




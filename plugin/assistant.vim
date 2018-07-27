python3 << EOF

import subprocess
import time
import vim

PROC = None

def openAssistant():
    global PROC
    PROC = subprocess.Popen(["assistant", "-enableRemoteControl"],\
            bufsize=1, stdin=subprocess.PIPE, stdout=subprocess.PIPE,\
            stderr=subprocess.PIPE, universal_newlines=True)

def searchIndex(keyword = None):
    global PROC
    if PROC is not None and PROC.poll() is None:
        if keyword is None:
            keyword = vim.eval("expand('<cword>')");
        PROC.stdin.write("ActivateKeyword " + keyword + "\n")
    else:
        openAssistant()
        time.sleep(2)
        searchIndex(keyword)

#searchIndex(vim.eval("expand('<cword>')"))
EOF

function! GetDocFromAssistant()
python3 searchIndex() 
endfunction

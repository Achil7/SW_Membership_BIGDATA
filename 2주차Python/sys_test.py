import sys
if len(sys.argv) > 1:
    filename = sys.argv[1]
    file = open(filename, 'r', encoding ='utf8')
    text_str = file.read()
    print(text_str)
    file.close()
    
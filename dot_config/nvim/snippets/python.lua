s_add('def', fmt([[
def {}({}):
    {}
]], ins_generate()))

s_add('if', fmt([[
if {}:
    {}
]], ins_generate()))

s_add('for', fmt([[
for {}:
    {}
]], ins_generate()))

parse_add('init', fmt([[
    def __init__(self):
        $1
]], ins_generate()))

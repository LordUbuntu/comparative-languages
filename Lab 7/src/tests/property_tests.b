property based tests

HEY        should be ignored by interpreter
#          should start as clean slate
#[[[]]]#   should have no effects
#-+#       should have cell transition from 0 to _1 to 0
+++#[-]#   should start with 3 at 0 end with 0 at 0
---#[+]#   should start with 3 at 0 end with 0 at 0
#<<<#      should have head at 0 before and after
#>>>#<<<#  should have head transition from 0 to 3 to 0
.          should print nothing
,.         should request input and print first char provided
,,.        should request input and print first char of second string only
---.       should print b if e was stored at 0
#[-]#      should set value at 0 to 0
#>>>[+++]+#  should skip loop setting value at 3 to 1 instead of 4

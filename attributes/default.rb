### HASH BASED ###
# Identify the application type being referenced
default['cool_template']['my_app'] = 'app1'

# Hash for a thing called app1
default['cool_template']['app1']['key1'] = 'app1value1'
default['cool_template']['app1']['key2'] = 'app1value2'
default['cool_template']['app1']['key3'] = 'app1value3'
default['cool_template']['app1']['key4'] = 'app1value4'
default['cool_template']['app1']['key5'] = 'app1value5'

# Hash for a thing called app2
default['cool_template']['app2']['key1'] = 'app2value1'
default['cool_template']['app2']['key2'] = 'app2value2'
default['cool_template']['app2']['key3'] = 'app2value3'
default['cool_template']['app2']['proxy_pass'] = ['string1', 'string2']

# Hash for a thing called app3
default['cool_template']['app3']['key1'] = 'app3value1'
default['cool_template']['app3']['key2'] = 'app3value2'
### \hash based ###

#!/usr/bin/env bash

# execution of shell scripts: 
# chmod +x _name_.sh
# ./_name_.sh

#function declaration
function section()
{
  echo ""
  echo "---- $1 ----"
  return 0
}

# function call with arg
section "simple printing"

echo Hello World! #simple print
Variable="Some string" #variable declaration (note lack of spaces)
# Variable = "Some string" // no spaces in var. dec.!

echo $Variable          #works
echo "$Variable"        #works
echo '$Variable'        #doesn't work - prints $Variable
echo ${Variable}        #parameter expansion
echo ${Variable/Some/A} #string substitution

section "string indexing"

Length=7
echo ${Variable:0:Length} #-> Some str
echo ${Variable: -4} #-> ring
echo ${#Variable} # string length

section "indirect expansion"

#indirect expansion: expand other var's value
OtherVariable="Variable"
echo ${OtherVariable} #->Variable
echo ${!OtherVariable} #-> Some string

section "arrays"

#array w/ 5 items
array0=(kiki kokomo kuku moosh nooch)

echo $array0 #-> kiki
echo ${array0[0]} #-> kiki
echo ${array0[@]} #-> kiki kokomo kuku moosh nooch
echo ${#array0[@]} #-> 5 (length of array)
echo ${#array0[4]} #-> 5 (length of nooch)
echo ${array0[@]:3:2} #->moosh nooch (print 2 elements starting from 3+1th)
echo ""

#print each element on a newline
for i in "${array0[@]}"; do
  echo "$i"
done

section "brace expansion"

#generate arbitrary strings
echo {1..10} #-> 1 2 3 ... 9 10
echo {a..z}  #-> etc

section "builtin variables"
echo "Last program's return value: $?"
echo "Script's PID: $$"
echo "Num args passed to script: $#"
echo "All args passed to script: $@"
echo "Script's arguments separated into diff. variables: $1 $2..."

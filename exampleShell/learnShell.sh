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

section "more basics"

#cwd avail. thru pwd command/var
echo "I'm in $(pwd)" #command
echo "I'm in $PWD"   #var

# clear screen
# clear 


section "input"
echo "What's your name?"
read Name
echo Hello, $Name!

section conditionals
#man test for more info on conditionals
if [ $Name != $USER ]; then
  echo $Name != username!
else
  echo "Your name == your username!"
fi

# Note: if $Name is empty, bash sees the above condition as:
# if [ != $USER ]
# which is invalid syntax

# safe way to handle potentially empty variables in bash:
#if [ "$Name" != $USER]...
# --> if [ "" != $USER ]

section "shortcut evals"
echo "Always executed" || echo "Only executed if first command fails"
echo "Always executed" && echo "Only executed if first command succeeds"

section "complex conditions"
if [ "$Name" == "Moosh" ] && [ 10 > 5 ] 
then
  echo "Hi Moosh!"
fi

if [ "$Name" == "yared" ] || [ "$Name" == "yaird" ]
then
  echo "Hi yared || yaird!"
fi 

section regex
Email=me@example.com
if [[ "$Email" =~ [a-z]+@[a-z]{2,}\.(com|net|org) ]] #note double brackets
then
  echo "valid email!"
fi

section aliases
# alias echo='echo arstneoia'
# echo
# alias -p

section "shell cmds"
ls -l ../ | grep "\.lua"

Contents=$(ls ../ | grep "\.lua")
echo $Contents
echo -e "\nbegin sass.lua"
cat "../$Contents"
echo -e "end sass.lua \n"

echo -e "\nThere are $(ls | wc -l) items in here!"


section "subshells"
(echo "First, I'm here: $PWD") && (cd ~; echo "Then, I'm here: $PWD")
echo "but, *I'm* here: $PWD"


section "case statements"
echo "What's your fav num?"
read FavNum

case "$FavNum" in 
  0) echo "It's a zero :)";;
  1) echo "A one? Seriously?";;
  *) echo "Not a binary guy. Respect.";;
esac

section loops

#awko loop
for Variable in {1..3}
do
  echo "$Variable"
done

#trad loop
for ((a=1; a<=3; a++))
do
  echo $a
done

# #cat on file1 and file2
# for Var in file1 file1
# do
#   cat "$Var"
# done

# #cat each .markdown file
# for Out in ./*.markdown
# do
#   cat "$Out"
# done 

while [ true ]
do
  echo "loop body, etc"
  break
done

section functions
function foo ()
{
  echo "fn args in the same form as shell args: $@"
  echo "args passed to foo: $1 $2..."
  return 0
}

foo arg1 arg2 arg3
# foo "My Name Is " "yaird"

#alternative declaration
bar () 
{
  echo "ez dec LUL"
  return 0
}

bar

sed, grep, etc

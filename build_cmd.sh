#!/bin/bash

#aws cloudformation create-stack --stack-name myteststack --template-body file:///home/testuser/mytemplate.json --parameters ParameterKey=Parm1,ParameterValue=test1 ParameterKey=Parm2,ParameterValue=test2
#{
#  "StackId" : "arn:aws:cloudformation:us-west-2:123456789012:stack/myteststack/330b0120-1771-11e4-af37-50ba1b98bea6"
#}
#Document Conventions« Previous Next »

PARM=""

for i in `cat parms.txt` ;
do
	key=`echo $i |sed 's/:.*//'`
	val=`echo $i |sed 's/.*://'`

	PARM="$PARM ParameterKey=$key,ParameterValue=$val"
done

aws cloudformation create-stack --stack-name test --template-body file:///home/seibel/cftest/test-templ.json  --parameters $PARM

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

validationFlag=0

#checking the length is lower then 10
checkLen () {
if [[ $1 -lt 10 ]]; then
    echo -e "${RED}The Password lenght should be greater than or equal 10.${ENDCOLOR}"
    validationFlag=1
fi 
}

#checking if the Password contain a number
checkNum () {
if [[ "$Password" != *[0-9]* ]]; then
    echo -e "${RED}The Password should include at least 1 number.${ENDCOLOR}"
    validationFlag=1
fi
}

#checking if the Password contain a small letter
checkSmallLetter() {
if [[ "$Password" != *[a-z]* ]]; then
     echo -e "${RED}The Password should include at least 1 lower case letter.${ENDCOLOR}"
     validationFlag=1
fi
}

#checking if the Password contain a capital letter
checkCapLetter() {
if [[ "$Password" != *[A-Z]* ]]; then
     echo -e "${RED}The Password should include at least 1 upper case letter.${ENDCOLOR}"
     validationFlag=1
fi
}


Password=$1


#check if the option "-f" is added
while getopts f: flag; 
do
  case "${flag}" in                     
    f)  Password=`cat ${OPTARG}`;;
    esac
done



checkLen "${#Password}"
checkNum
checkSmallLetter
checkCapLetter

#If the password is valid, the user get a Ok massage
if [[ "$validationFlag" -eq 0 ]]; then
	echo -e ${GREEN}"The Password OK.${ENDCOLOR}"
fi

exit $validationFlag
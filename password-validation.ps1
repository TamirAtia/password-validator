#check if the option "-f" is added
param($password, $f)

if($f){
    $password=Get-Content $f
}

 
#checking the length is lower then 10
function checkLen {
    param (
        $passwordLen
    )
   
    if ($passwordLen -lt 10) {
        Write-Host -ForegroundColor Red "The Password lenght should be greater than or equal 10."
        $global:validationFlag = 1
    }
}

#checking if the Password contain a number
function checkNum {
    param (
        $password
    )
    if (!($password | Select-String -Pattern [0-9] -Quiet)) {
        Write-Host -ForegroundColor Red "The Password should include at least 1 number."
        $global:validationFlag = 1
    }
}

#checking if the Password contain a small letter
function checkSmallLetter {
    param (
        $password
    )
    if (!($password | Select-String -Pattern [a-z] -CaseSensitive -Quiet)) {
        Write-Host -ForegroundColor Red "The Password should include at least 1 lower case letter."
        $global:validationFlag = 1
    }
}

#checking if the Password contain a capital letter
function checkCapLetter {
    param (
        $password
    )
    if (!($password | Select-String -Pattern [A-Z] -CaseSensitive -Quiet)) {
        Write-Host -ForegroundColor Red "The Password should include at least 1 upper case letter."
        $global:validationFlag = 1
    }
}




$global:validationFlag = 0

checkLen $password.length
checkNum $password
checkSmallLetter $password
checkCapLetter $password


#If the password is valid (validationFlag equal to 0), the user get a Ok massage
if (!$validationFlag) {
    Write-Host -ForegroundColor Green "The Password OK."
}

exit $validationFlag

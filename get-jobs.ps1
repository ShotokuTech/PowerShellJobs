
#This is the job here:
$scriptblock = {
param($i) #Comma delimited
start-sleep 2 #Slowing things down a bit
$i #The output of the job
}

#Getting loopy here:
$i = 0
$j = 9
while($j -le 100){ #Stop at 100
for($i; $i -le $j; $i++){

#Starting a new job
$args = @($i) #Comma delimited
Start-Job $ScriptBlock -ArgumentList $args #Thinking remoting with telemetry? I know right?
} #End the for loop
While (Get-Job -State "Running") {start-sleep 1} #Waiting...
Get-Job | Receive-Job #Make sure to get your jobs
Remove-Job * #Clean up

$j=$j+10 #Next 0-9 

} #End the while loop


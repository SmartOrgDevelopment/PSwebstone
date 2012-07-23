function Publish-UDP
{
	param($message="")
	
	$root = Get-RootDir
	[System.Reflection.Assembly]::LoadFrom("$root\core\dll\UDPcommunications.dll") | Out-Null
	
	$ip = Get-Ip
	$port = Get-Port
	
	"Publish message $message on ip/port $ip $port"
	$talker = new-object UDPcommunications.talker($ip,$port)
	
	
	$talker.send("info $message")
	
	
}
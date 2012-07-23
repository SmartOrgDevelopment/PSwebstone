Function Get-RootDir
{
	"C:\data\dev\PSwebstone"
}


function Get-LogDir
{

	$root = Get-RootDir
	"$root/logs/trace.txt"

}

function Get-Ip
{

	"127.0.0.1"

}

function Get-Port{

	"7700"

}
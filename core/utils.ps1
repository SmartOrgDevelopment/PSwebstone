Function Get-WebserviceProxy
{
	param($url = "")
	if($url -EQ "")
	{
		$url = Get-Url
	}
	
	New-WebServiceProxy $url
}

Function Trace-Info
{
	param($s)
	Write-Host $s -backgroundColor white -foregroundColor blue
}

Function Get-Timestamp
{
	get-date -uformat "%Y-%m-%d@%H-%M-%S"

}
Function Log-Message
{
	param($message)
	#Trace-Info $message
	$message | Out-File Get-LogDir -append
}


Function ConvertTo-base64($string) {
	$bytes  = [System.Text.Encoding]::UTF8.GetBytes($string);
	$encoded = [System.Convert]::ToBase64String($bytes); 

	return $encoded;
} 

Function ConvertFrom-base64($string) {
	$bytes  = [System.Convert]::FromBase64String($string);
	$decoded = [System.Text.Encoding]::UTF8.GetString($bytes); 

	return $decoded;
}


Function Convert-CsvToStringXML ($list) {

	$listBits = $list.Split(',')

	$s = ""

	$listBits | foreach {

		$s = $s + "<string>" + $_ + "</string>"
	}

$s
}

Function Get-ConnectionString ($db) {

	"Persist Security Info=False;Integrated Security=true;Initial Catalog=$db;server=(local)"


}

Function Get-Bits{
    Switch ([System.Runtime.InterOpServices.Marshal]::SizeOf([System.IntPtr])) {
        4 {
            Return "32-bit"
        }
 
        8 { 
            Return "64-bit"
        }
 
        default {
            Return "Unknown Type"
        }
    }
}



workflow Invoke-PTask2 {
	param($counters)
	
	
	foreach -parallel ($counter in $counters)
	{
	    $m = inner-function
            $babu = Get-TheWebData $counter

	   InlineScript{

            #how to do this in a more functional way?
            #this is clearly procedural
            $r = new-object Random
            $random = $r.Next(1,10)
            $_url = "$using:counter"
            $_host = "astro-dev.smartorg.com"
            $root = 'C:\data\dev\PSwebstone'
            [System.Reflection.Assembly]::LoadFrom("$root\core\dll\UDPcommunications.dll") | Out-Null

            $ip = '127.0.0.1'
            $port = 7700
            $talker = new-object UDPcommunications.talker($ip,$port)
            $timestamp = get-date -uformat "%Y-%m-%d~%H-%M-%S"
            $message = "BEGIN $random"
            $talker.send("$timestamp >> $message")
            $valFromInnerFxn = "$using:m"
            $data = "$using:babu"

            #perform work remotely via REST method
            $url = "http://$_host/rest?command=Authenticate&kred=YWRtaW5fOGMzMTlmMjhkODFkMTUyN2E5NDI4ZTlhNWMyMTk1ZjU%3D"
            $results = Invoke-RestMethod $url
            $msg =  " Invoke-RestMethod {0} returned {1}" -f $url,$results.GetType()
            $message =  " $data [{0}] $valFromInnerFxn $msg " -f  $random

            #simulate long running task
            Start-Sleep $random

            #trace out result via udp broadcast ...
            $talker.send("$timestamp >> $message")
		}				
	}
	
	
	function inner-function{
		"boo"
	}

   
 function Get-TheWebData {

    param($url)

    ([string]$url).ToUpper()

    $url

    }
}





function Test-Parallel{

	param([int]$numberTests = 10)

	cd "c:\data\dev\PSwebstone\core\"
	if($numberTests -LT 1)
	{
		Write-Host "number of tests expected should be a positive number greater than zero"-backgroundColor DarkRed
		return "FAIL"
	}
	$counters = @()
	1..$numberTests | % { $counters += $_ }
	
	Clear-Host
	Invoke-PTask2 $counters #-AsJob
	
	
}

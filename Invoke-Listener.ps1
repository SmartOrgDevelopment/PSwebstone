function Invoke-Listen
{
    param(
        $logPath = 'c:\temp\log.txt',
        $port = 7700
    )

    cd c:\Users\admin2\Desktop\udpListner_Release\Release
    ls


    Write-Host "Starting up on Port :: $port" -BackgroundColor DarkMagenta -ForegroundColor Cyan
    .\listener.exe $port $logPath "True"
}
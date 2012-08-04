function Get-Words {
    

    $list = "Ferrari","Lamborghini","Alpha Romeo","Mazarati","Porshe","Ford","Volkswagen","Fiat","Mini","BMW","Toyota"
    $list += "Lexus"
    $list += "Mitshubishi"
    $list += "RAM"
    $list += "Lexus"
    $list += "Volvo"
    $list += "Audi"
    $list

}
function Get-RandomSilo
{
    param($size=7,$min=1,$max=9)
    
    $r = new-object Random
    $silo = @()
     1..$size | % {
      $silo += $r.Next($min ,$max)
     }
    Write-Host $silo -BackgroundColor DarkGreen
    $silo
  }


function Get-Fluff
{
    param($len,$flufChar = " ")

    $s= @()
    for ($i = 1; $i -lt $len; $i++)
    { 
        $s += $flufChar
    }

    return [string]::Join("",$s)

}


function Get-PaddedString
{
    param([string] $string,$pad=5)

    $len = $string.Length
    $z = $pad - $len
    if($z -ge 0)
    {
        $padding = Get-Fluff $z
        return $string + $padding
    }
    else
    {
        #trim
        return $string.Substring(0,$pad)
    }
}

function Get-LongestWord
{
    param($list)
    $len = $list.Length
    $longest = 0
    foreach ($item in $list)
    {
        $tmpLen = $item.Length
        if( $tmpLen -gt $longest )
        {
            $longest = $tmpLen
        }
    }

    $longest
}

function Invoke-Main
{

    $dictionary = Get-Words
    $numberWords = $dictionary.Count
    $longestWord = Get-LongestWord $dictionary
    $longestWord++


    $listWords = @()
    $listRandom = Get-RandomSilo 100 1 $numberWords
    $listRandom | % {

        $listWords += $dictionary[$_]

    }


    Show-PrettyPrintDualColumn $listWords $longestWord
   



}

function Show-PrettyPrintDualColumn
{
    param($listWords, $longestWord)

    for ($i = 1; $i -lt $listWords.Count; $i=$i +2)
    { 
        $a = Get-PaddedString $listWords[$i] $longestWord
        $b = Get-PaddedString $listWords[$i-1] $longestWord

        "$a $b"
    }

}

Invoke-Main
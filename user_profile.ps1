# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

Import-Module oh-my-posh
set-PoshPrompt 'M365Princess'
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression


# Load prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'takuya.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

#Alias
Set-Alias v nvim
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias tig "C:\Program Files\Git\usr\bin\tig.exe"
Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"
Set-Alias mkdir "C:\Program Files\Git\usr\bin\mkdir.exe"
Set-Alias touch "C:\Program Files\Git\usr\bin\touch.exe"
Set-Alias tail "C:\Program Files\Git\usr\bin\tail.exe"
Set-Alias cpy "C:\Program Files\Git\usr\bin\cp.exe"

# PSReadLine 
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSRealineChordProvider 'CTRl+f' -PSReadlineChordReverseHistory 'Ctrl+r'


# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object ExpandProperty Path -ErrorAction SilentlyContinue
  }


function getName {wmic "csproduct get name"}
function schrome {chrome.exe --user-data-dir="C:/Chrome dev session" --disable-web-security}
function thb { & "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" 'https://beta.theb.ai/home'}
function fcs { curl "https://wttr.in/tonekabon" }
function fcs2 { curl "https://v2.wttr.in/tonekabon" }
function des { Set-Location "C:\Users\Mkh\OneDrive\Desktop\" }
function which($command) { Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue }
function psconf { nvim "C:\Users\Mkh\.config\powershell\user_profile.ps1" }
function nvconf { nvim "C:\Users\Mkh\AppData\Local\nvim\init.lua" }
function nvfold { Set-Location C:\Users\Mkh\AppData\Local\nvim }
function hist { nvim "C:\Users\Mkh\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" }
# {yt-dlp -x --audio-format mp3 --output '%(playlist_index)s-%(title)s.%(ext)s' $link
function yymp3 ($link) { yt-dlp -x --audio-format mp3 --output '%(title)s.%(ext)s' $link }
function yy ($url) { yt-dlp -f "best[height<=720]" $url }
function who { Write-Output "Mkh's"; }
Function ex { explorer.exe . }
Function rc { Start-Process shell:RecycleBinFolder}
Function m { mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --shuffle $args }
Function mplay { mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback $args }
Function mm { mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --shuffle "C:\Users\Mkh\Music" }
function cdm { Set-Location C:\Users\Mkh\Music }
function zip {
    param (
        [Parameter(Mandatory = $true)]
        [ValidateScript({Test-Path $_ -PathType 'Container'})]
        [string]$FolderPath,
        
        [Parameter(Mandatory = $true)]
        [ValidateScript({$_ -match '\.zip$'})]
        [string]$ZipFilePath
    )
    
    Compress-Archive -Path $FolderPath -DestinationPath $ZipFilePath
}

function unzip {
    param (
        [Parameter(Mandatory = $true)]
        [ValidateScript({Test-Path $_ -PathType 'Leaf'})]
        [string]$ZipFilePath,
        
        [Parameter(Mandatory = $true)]
        [ValidateScript({Test-Path (Split-Path $_) -PathType 'Container'})]
        [string]$DestinationFolderPath
    )
    
    Expand-Archive -Path $ZipFilePath -DestinationPath $DestinationFolderPath
}
# browsers 
function edge {
    param([string]$query)
    & "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" "https://www.bing.com/search?q=$query"
}

function fox {
        param([string]$query)
        & "C:\Program Files\Mozilla Firefox\firefox.exe" "https://www.duckduckgo.com/search?q=$query"
    }

function icc {
    param([string]$query)
    & "C:\Program Files\IceCat\icecat.exe" "https://www.duckduckgo.com/search?q=$query"
    }

function tor {& "C:\Users\Mkh\OneDrive\Desktop\Browser\Tor Browser\Browser\firefox.exe"}


function prompt {
    $host.ui.RawUI.WindowTitle = "$pwd"
    $CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf
    $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();
    $Date = Get-Date -Format 'dddd hh:mm:ss tt'
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    $LastCommand = Get-History -Count 1
    if ($lastCommand) {
        $RunTime = ($lastCommand.EndExecutionTime - $lastCommand.StartExecutionTime).TotalSeconds 
    }
    if ($RunTime -ge 60) {
        $ts = [timespan]::fromseconds($RunTime)
        $min, $sec = ($ts.ToString("mm\:ss")).Split(":")
        $ElapsedTime = -join ($min, " min ", $sec, " sec")
    }
    else {
        $ElapsedTime = [math]::Round(($RunTime), 2)
        $ElapsedTime = -join (($ElapsedTime.ToString()), " sec")
    }
    Write-Host ""
    Write-host ($(if ($IsAdmin) {
                'Elevated ' 
            }
            else {
                '' 
            })) -BackgroundColor DarkRed -ForegroundColor White -NoNewline
    Write-Host " USER:$($CmdPromptUser.Name.split("\")[1]) " -BackgroundColor Blue -ForegroundColor White -NoNewline
    If ($CmdPromptCurrentFolder -like "*:*") {
        Write-Host " $CmdPromptCurrentFolder "  -ForegroundColor White -BackgroundColor DarkGray -NoNewline
    }
    else {
        Write-Host ".\$CmdPromptCurrentFolder\ "  -ForegroundColor White -BackgroundColor DarkGray -NoNewline
    }
    Write-Host " $date " -ForegroundColor White -BackgroundColor Blue -NoNewLine
    Write-Host "⌚️$elapsedTime " -ForegroundColor White -BackgroundColor DarkGray 
    return "🛸🛸🛸 "
} 


function transfer {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [Alias("FullName")]
        [String]$Path
    )

    if (-not (Test-Path $Path)) {
        Write-Host "$($Path): No such file or directory" -ErrorAction Stop
    }

    $fileName = (Split-Path $Path -Leaf).Replace(' ', '_')

    if ((Test-Path $Path) -and (Get-Item $Path).PSIsContainer) {
        $zipPath = Join-Path ([System.IO.Path]::GetTempPath()) ([System.IO.Path]::GetRandomFileName() + '.zip')
        Compress-Archive -Path $Path -DestinationPath $zipPath -Quiet
        $filePath = $zipPath
    } else {
        $filePath = $Path
    }

    try {
        Invoke-WebRequest -Uri "https://transfer.sh/$fileName" -Method Put -InFile $filePath |
            Select-Object -ExpandProperty Content
    }
    catch {
        Write-Host "An error occurred while uploading the file."
        Write-Host $_.Exception.Message
    }
    finally {
        if ($zipPath) {
            Remove-Item -Path $zipPath -ErrorAction SilentlyContinue
        }
    }
}



# process info function


# Revised function to get process information
function pinfo {
  param(
    [Parameter(Position=0)]
    [alias("pn")]
    [string]$ProcessName,
    
    [Parameter(Position=1)]
    [alias("pid")]
    [int]$ProcessId
  )

  begin {
    $procs = @() 
  }

  process {

    if ($ProcessName) {
    
      $procs += Get-Process | Where-Object { $_.Name -match $ProcessName }
    
    }
    elseif ($ProcessId) {

      $procs += Get-Process -Id $ProcessId -ErrorAction SilentlyContinue

    }
    else {
    
      $procs += Get-Process
    
    }

  }

  end {

    if (-not $procs) {
      Write-Warning "No matching processes found"
      return
    }

    foreach ($proc in $procs) {

      Write-Host "Process Name: $($proc.Name)" -ForegroundColor Cyan
      
      try {
        $path = (Get-Process -Id $proc.Id -ErrorAction Stop).Path
      }
      catch {
        $path = $null 
      }

      if ($path) {
        Write-Host "Process Path: $path" -ForegroundColor Green  
      }

      try {
        $cmdline = (Get-WmiObject Win32_Process -Filter "ProcessId = $($proc.Id)" -ErrorAction Stop).CommandLine
        Write-Host "Command Line: $cmdline" -ForegroundColor Green 
      }
      catch {
        Write-Warning "Unable to get command line"
      }
    }
  }
}

# New function to check which process is using a specific port
function portinfo {
  param(
    [Parameter(Position=0, Mandatory=$true)]
    [alias("p")]
    [int]$Port
  )

  $connections = Get-NetTCPConnection -LocalPort $Port -ErrorAction SilentlyContinue

  if ($connections) {
    foreach ($conn in $connections) {
      try {
        $proc = Get-Process -Id $conn.OwningProcess -ErrorAction Stop
        $procName = $proc.Name
        $procPath = $proc.Path
      }
      catch {
        $procName = $null
        $procPath = $null
      }

      Write-Host "Port $Port is being used by process $procName (ID: $($conn.OwningProcess))" -ForegroundColor Red
      if ($procPath) {
        Write-Host "Process Path: $procPath" -ForegroundColor Green  
      }
    }
  }
  else {
    Write-Host "Port $Port is not in use" -ForegroundColor Green
  }
}

function ws {
    param(
        [string]$foldername
    )
    $webstormPath = "C:\Program Files\JetBrains\WebStorm 2021.3\bin\webstorm64.exe"
    $arguments = $foldername
    if (Test-Path $webstormPath) {
        Start-Process $webstormPath -ArgumentList $arguments -WindowStyle Hidden
    } else {
        Write-Host "WebStorm not found at path: $webstormPath"
    }
}

Function pyt {
    $scriptPath = "C:\Users\Mkh\pytranslater.py"
    Start-Process python -ArgumentList $scriptPath -NoNewWindow -Wait
}


Function note {
    $scriptPath = "C:\Users\Mkh\note.py"
    Start-Process python -ArgumentList $scriptPath -NoNewWindow -Wait
}

Function wiki {
    $scriptPath = "C:\Users\Mkh\wikiSearch.py"
    Start-Process python -ArgumentList $scriptPath -NoNewWindow -Wait
}


Function greetBot {
    $scriptPath = "C:\Users\Mkh\greetBot.py"
    Start-Process python -ArgumentList $scriptPath -NoNewWindow -Wait
}

Function cmdChat {
    $scriptPath = "C:\Users\Mkh\cmdChat.py"
    Start-Process python -ArgumentList $scriptPath -NoNewWindow -Wait
}

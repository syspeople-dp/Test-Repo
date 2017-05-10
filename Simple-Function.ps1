<#
        .NOTES
        ===========================================================================
        Created by: CreatedBy
        Organization: Company
        Filename: FileName
        ===========================================================================
        DESCRIPTION
        Description
#>

trap {
    $line = $_.InvocationInfo.ScriptLineNumber
    $message = $_.Exception.Message

    $errorDescription = ('Caught error in line {0:00}: {1}' -f $line, $message)

    # Write error to screen
    Write-Output -InputObject $errorDescription

}


#region Settings


#endregion Settings


#region Functions

<#
.SYNOPSIS
    For writing out logs including timestampe
.EXAMPLE
    Write-OutTimeStamped "Script started"

        [00:00:84] Script started
.EXAMPLE
    "Script started" | Write-OutTimeStamped

        [00:00:84] Script started
#>
function Write-OutTimeStamped {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline=$True)]
        [string[]]$Output
    )
    
    begin {
    }
    
   process {
        if (Get-Variable -Name stopWatch  -ErrorAction SilentlyContinue) {
"`n[$('{0:D2}' -f $stopWatch.Elapsed.Minutes):$('{0:D2}' -f $stopWatch.Elapsed.Seconds):$('{0:D2}' -f $stopWatch.Elapsed.Milliseconds)] $Output"
    }
    }
    
   end {
    }
}

#endregion Functions

#region Init

$ErrorActionPreference = 'Stop'

$stopWatch = [Diagnostics.Stopwatch]::StartNew()


Write-Output -InputObject @"
$('#' * 80)
    Script description:
        <<< SCRIPT DESCRIPTION >>>

    Environment Information:
        Usercontext: $([System.Environment]::UserDomainName)\$([System.Environment]::UserName)
        Hostname: $env:COMPUTERNAME
        Host OS version: $([System.Environment]::OSVersion.Version) ($((Get-WmiObject -Class Win32_OperatingSystem).Caption))
        PSVersion: $($PSVersionTable.PSVersion)
$('#' * 80)
"@

 Write-OutTimeStamped "Script started"
#endregion Init

#region Main

#<INSERT CODE HERE>

#endregion Main

#region Finalize

 Write-OutTimeStamped "Script ran through"
"`n$('#' * 80)`n"
$stopWatch.Stop()

#endregion Finalize
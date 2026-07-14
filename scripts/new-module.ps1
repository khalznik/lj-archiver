param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern("^[a-z][a-z0-9_]*$")]
    [string]$Name
)

$module = $Name.ToLower()

$moduleDir = Join-Path $PSScriptRoot "..\$module"
$includeDir = Join-Path $PSScriptRoot "..\include"

if (-not (Test-Path $includeDir)) {
    Write-Host "Error: include directory not found." -ForegroundColor Red
    exit 1
}

$headerFile = Join-Path $includeDir "lj_$module.h"
$sourceFile = Join-Path $moduleDir "$module.c"

if ((Test-Path $headerFile) -or (Test-Path $sourceFile)) {
    Write-Host "Module '$module' already exists." -ForegroundColor Yellow
    exit 0
}

New-Item -ItemType Directory -Force -Path $moduleDir | Out-Null

$guard = "LJ_$($module.ToUpper())_H"

$header = @"
#ifndef $guard
#define $guard

#ifdef __cplusplus
extern "C" {
#endif

int lj_${module}_initialize(void);
void lj_${module}_shutdown(void);

#ifdef __cplusplus
}
#endif

#endif /* $guard */
"@

$source = @"
#include "lj_$module.h"

int lj_${module}_initialize(void)
{
    return 0;
}

void lj_${module}_shutdown(void)
{
}
"@

Set-Content -Encoding UTF8 $headerFile $header
Set-Content -Encoding UTF8 $sourceFile $source

Write-Host ""
Write-Host "Module created successfully." -ForegroundColor Green
Write-Host ""
Write-Host "  $moduleDir"
Write-Host "  $headerFile"
Write-Host ""
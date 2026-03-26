# concat-docs.ps1
# COBOL Structure Analysis Lab - Documentation Concatenation Script
#
# Purpose:
#   1. Concatenate all *.md files in each docs/* subdirectory into temp/docs/{dirname}/{dirname}.md
#   2. Skip processing if all source files are older than the target file
#   3. If any directory was updated, concatenate all temp/docs/*/*.md into docs/CobolStructureAnalysis.md
#
# Usage:
#   .\tools\concat-docs.ps1

$ErrorActionPreference = "Stop"

$docsRoot = "docs"
$tempDocsRoot = "temp/docs"
$finalOutput = "docs/CobolStructureAnalysis.md"

# Track if any directory was updated
$anyUpdated = $false

# Get all first-level directories under docs/
$directories = Get-ChildItem -Path $docsRoot -Directory | Sort-Object Name

Write-Host "Processing $($directories.Count) directories under $docsRoot/" -ForegroundColor Cyan

foreach ($dir in $directories) {
    $dirName = $dir.Name
    
    # Skip 00_project directory
    if ($dirName -eq "00_project") {
        Write-Host "`nSkipping: $dirName (excluded from processing)" -ForegroundColor Gray
        continue
    }
    
    $sourcePath = Join-Path $docsRoot $dirName
    $targetDir = Join-Path $tempDocsRoot $dirName
    $targetFile = Join-Path $targetDir "$dirName.md"
    
    Write-Host "`nProcessing: $dirName" -ForegroundColor Yellow
    
    # Get all *.md files in the source directory (first level only, no recursion)
    $mdFiles = Get-ChildItem -Path $sourcePath -Filter "*.md" -File | Sort-Object Name
    
    if ($mdFiles.Count -eq 0) {
        Write-Host "  No .md files found. Skipping." -ForegroundColor Gray
        continue
    }
    
    # Get the latest modification time of all source files
    $latestSourceTime = ($mdFiles | Measure-Object -Property LastWriteTime -Maximum).Maximum
    
    # Check if target file exists and compare timestamps
    if (Test-Path $targetFile) {
        $targetTime = (Get-Item $targetFile).LastWriteTime
        
        if ($latestSourceTime -le $targetTime) {
            Write-Host "  All source files are older than target. Skipping." -ForegroundColor Gray
            continue
        }
    }
    
    # Ensure target directory exists
    if (-not (Test-Path $targetDir)) {
        New-Item -Path $targetDir -ItemType Directory -Force | Out-Null
    }
    
    # Concatenate files
    Write-Host "  Concatenating $($mdFiles.Count) files..." -ForegroundColor Green
    
    $content = @()
    foreach ($file in $mdFiles) {
        $fileContent = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        $content += $fileContent
        $content += "`n---`n"
    }
    
    # Remove trailing separator
    if ($content.Count -gt 0) {
        $content = $content[0..($content.Count - 2)]
    }
    
    # Write to target file
    $content -join "" | Out-File -FilePath $targetFile -Encoding UTF8 -NoNewline
    
    Write-Host "  Created: $targetFile" -ForegroundColor Green
    $anyUpdated = $true
}

# If any directory was updated, create the final combined file
if ($anyUpdated) {
    Write-Host "`nCreating final combined file: $finalOutput" -ForegroundColor Cyan
    
    # Get all concatenated files from temp/docs/
    $combinedFiles = Get-ChildItem -Path $tempDocsRoot -Directory | Sort-Object Name | ForEach-Object {
        $dirName = $_.Name
        $catFile = Join-Path $_.FullName "$dirName.md"
        if (Test-Path $catFile) {
            [PSCustomObject]@{
                DirName = $dirName
                FilePath = $catFile
            }
        }
    }
    
    $finalContent = @()
    
    foreach ($item in $combinedFiles) {
        # Add chapter heading
        $finalContent += "# $($item.DirName)`n`n"
        
        # Add file content
        $fileContent = Get-Content -Path $item.FilePath -Raw -Encoding UTF8
        $finalContent += $fileContent
        $finalContent += "`n`n"
    }
    
    # Write final output
    $finalContent -join "" | Out-File -FilePath $finalOutput -Encoding UTF8 -NoNewline
    
    Write-Host "  Created: $finalOutput" -ForegroundColor Green
    Write-Host "  Total sections: $($combinedFiles.Count)" -ForegroundColor Green
} else {
    Write-Host "`nNo updates detected. Final file not regenerated." -ForegroundColor Gray
}

Write-Host "`nDone." -ForegroundColor Cyan

# Pauses the OCR redo (resume3.ps1) when the book being read is finished: waits for the next line in
# text/_ocr_queue.log, then kills the wrapper (so it cannot commit or start the text-layer stage), the OCR python
# processes and the llama-server Surya runs on. Restart later with resume3.ps1 (it skips done books).
# Usage: pwsh -NoProfile -File pause-after-book.ps1 -WrapperPid <pid> [-StopperPid <pid>]
param([int]$WrapperPid, [int]$StopperPid = 0)
$log = Join-Path $PSScriptRoot 'run.log'
$queueLog = 'C:\repo\ResourceLibrary\text\_ocr_queue.log'
if ($StopperPid) {
    Stop-Process -Id $StopperPid -Force -ErrorAction SilentlyContinue
    Add-Content $log "=== $(Get-Date -Format s) timed stopper (pid $StopperPid) cancelled by NGCFells; pausing after the current book"
}
$start = (Get-Content $queueLog).Count
while ((Get-Content $queueLog).Count -le $start) { Start-Sleep -Seconds 20 }
Stop-Process -Id $WrapperPid -Force -ErrorAction SilentlyContinue
$ocr = @(Get-CimInstance Win32_Process -Filter "Name='python.exe'" |
    Where-Object { $_.CommandLine -match 'ocr_queue|ocr_extract|surya_ocr|ocr_textlayer|extract_rulebooks' })
$ids = $ocr.ProcessId
@($ocr) + @(Get-CimInstance Win32_Process -Filter "Name='llama-server.exe'" | Where-Object { $ids -contains $_.ParentProcessId }) |
    ForEach-Object { Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue; Add-Content $log "    stopped pid $($_.ProcessId): $($_.Name)" }
Add-Content $log "    last book: $((Get-Content $queueLog -Tail 1))"
Add-Content $log "=== $(Get-Date -Format s) paused after the book (queue stage only; part 2 NOT committed: run helpers.py commit-queue with redo-offset.txt)"

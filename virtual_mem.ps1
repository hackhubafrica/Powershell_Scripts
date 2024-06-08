Get-CimInstance Win32_PageFileUsage | Select-Object -Property Name, AllocatedBaseSize, CurrentUsage, PeakUsage

Get-WmiObject Win32_PageFileUsage | Select-Object -Property Name, AllocatedBaseSize, CurrentUsage, PeakUsage

$pageFileUsage = Get-CimInstance Win32_PageFileUsage | Select-Object -Property Name, AllocatedBaseSize, CurrentUsage, PeakUsage

foreach ($file in $pageFileUsage) {
    $allocatedBaseSizeKB = $file.AllocatedBaseSize * 1024
    $currentUsageKB = $file.CurrentUsage * 1024
    $peakUsageKB = $file.PeakUsage * 1024

    "Paging File: $($file.Name)"
    "Allocated Base Size: $($allocatedBaseSizeKB) KB"
    "Current Usage: $($currentUsageKB) KB"
    "Peak Usage: $($peakUsageKB) KB"
}

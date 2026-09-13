$ESC = [char]27

$NUM_BALLS = 20
$LEVELS = 12

$bin = @(0) * ($LEVELS + 1)

Clear-Host

for ($b = 1; $b -le $NUM_BALLS; $b++) {
    $current_pos = 0
    
    for ($r = 0; $r -le $LEVELS; $r++) {
        
        $frame = "$ESC[H" # Replace le curseur en haut à gauche
        $frame += "Bille en cours : $ESC[31m$b$ESC[0m sur $NUM_BALLS`n`n"
        
        for ($y = 0; $y -le $LEVELS; $y++) {
            $spaces = $LEVELS - $y
            if ($spaces -gt 0) {
                $frame += " " * $spaces
            }
            
            for ($x = 0; $x -le $y; $x++) {
                if ($y -eq $r -and $x -eq $current_pos) {
                    # Dessiner la bille en rouge
                    $frame += "$ESC[91mO$ESC[0m "
                } else {
                    # Dessiner le clou en gris foncé
                    $frame += "$ESC[90m.$ESC[0m "
                }
            }
            $frame += "`n"
        }
        
        for ($i = 0; $i -le $LEVELS; $i++) {
            $val = $bin[$i]
            if ($val -gt 0) {
                # Vert si le bac contient des billes
                $frame += "$ESC[92m$val$ESC[0m "
            } else {
                # Gris sinon
                $frame += "$ESC[90m0$ESC[0m "
            }
        }
        $frame += "`n"
        
        [Console]::Write($frame)
        
        Start-Sleep -Milliseconds 50
        
        $current_pos += Get-Random -Minimum 0 -Maximum 2
    }
    
    $bin[$current_pos] += 1
}

Write-Host "`n$ESC[92mSimulation terminee !$ESC[0m"
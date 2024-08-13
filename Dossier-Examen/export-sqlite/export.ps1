# Chemin vers la base de données
$dbPath = "C:\Users\onixg\Desktop\humanite-numerique\BDD\footballeurs.db"

# Dossier où les fichiers CSV seront enregistrés
$outputFolder = "C:\Users\onixg\Desktop\humanite-numerique\export-sqlite"

# Chemin vers sqlite3.exe
$sqlitePath = "C:\Users\onixg\Desktop\sqlite\sqlite3.exe"

# S'assurer que le dossier de sortie existe
if (-not (Test-Path $outputFolder)) {
    New-Item -Path $outputFolder -ItemType Directory
}

# Liste des tables à exporter
$tables = @(
    "tbl_ClubsChampionnats",
    "tbl_PersonnesCentreFormations",
    "tbl_PersonnesClubs_Entraineur",
    "tbl_PersonnesClubs_faitParti",
    "tbl_PersonnesTitres",
    "tblCentreFormations",
    "tblChampionnats",
    "tblClubs",
    "tblGoals",
    "tblMatchs",
    "tblPersonnes",
    "tblPays",
    "tblPostes",
    "tblStades",
    "tblTitres",
    "tblTransferts"
)

# Exporter chaque table en fichier CSV
foreach ($table in $tables) {
    $outputFile = Join-Path $outputFolder "$table.csv"

    # Construire les commandes SQLite dans un fichier sql
    $batchFile = "$outputFolder\export_commands.sql"
    $commands = @"
.mode csv
.headers on
.output '$outputFile'
SELECT * FROM $table;
.output stdout
"@
    
    $commands | Set-Content -Path $batchFile

    # Exécuter les commandes via sqlite3
    & $sqlitePath $dbPath ".read $batchFile"

    Write-Host "Table $table exportée vers $outputFile"
}

Write-Host "Exportation terminée."
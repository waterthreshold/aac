if (-not (Test-Path "wav")) {
    New-Item -ItemType Directory -Path "wav"
}
Get-ChildItem *.mp3 | ForEach-Object {
	 $newName = [System.IO.Path]::ChangeExtension($_.FullName, ".wav")
		ffmpeg -i $_.FullName -acodec pcm_s16le -ar 44100 $newName
	
    
}
Move-Item -Path "*.wav"  -Destination "wav"
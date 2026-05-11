#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
param(
    [string]$img = "asciidoctor-app",
    [string]$cnt = "asciidoctor-script",
    [string]$cnt_path = "/usr/src/app/doc",
    [string]$dst_path = "C:\Users\alexp\Downloads\todo"
)

docker build -t $img .
docker run -it --name $cnt $img

$path = $cnt + ":" + $cnt_path
docker cp $path $dst_path

Read-Host -Prompt "Press any key to continue..." | Out-Null

docker rm --force $cnt
docker image rm --force $img
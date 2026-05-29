#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
param(
    [string]$img = "asciidoctor-app",
    [string]$cnt = "asciidoctor-script",
    [string]$cnt_path = "/usr/src/app/doc",
    [string]$dst_path = "C:\Users\alexp\Downloads\todo"
)

docker build --build-arg LANG=de_DE.UTF-8 --build-arg LANGUAGE=de_DE:de --build-arg LC_ALL=de_DE.UTF-8 -t $img .
#docker build --build-arg LANG=en_US.UTF-8 --build-arg LANGUAGE=en_US.UTF-8 --build-arg LC_ALL=en_US.UTF-8 -t $img .

docker run -it --name $cnt $img

$path = $cnt + ":" + $cnt_path
docker cp $path $dst_path

Read-Host -Prompt "Press any key to continue..." | Out-Null

docker rm --force $cnt
docker image rm --force $img
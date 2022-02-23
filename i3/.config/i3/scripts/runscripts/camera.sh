#bash!/bin
count=`ps aux | grep -c "name=camera"`
if [ $count -eq 1 ]; then
    mpv rtsp://kugalskaper:Kungfufighting1@10.0.0.7:554/stream1 --no-terminal --no-osc --x11-name=camera
else
   i3-msg '[instance="camera" class="mpv"] focus'
fi


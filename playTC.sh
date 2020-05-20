ffplay \
-vf "drawtext=fontfile=/usr/share/fonts/TTF/LiberationMono-Bold.ttf: text='%{eif\:trunc(n/3600/25)\:d\:2}\:%{eif\:trunc(n/60/25)\:d\:2}\:%{eif\:trunc(mod(n*25\,60))\:d\:2}: box=1:x=(w-tw)/2:y=h-(2*lh)" \
$1 

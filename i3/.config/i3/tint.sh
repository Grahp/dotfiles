outputs=$(xrandr | grep " connected " | awk '{print $1}')

for output in $outputs; do
    
done

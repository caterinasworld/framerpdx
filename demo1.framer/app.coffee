# console.log
console.log "Welcome to FramerPDX"

# print statement
print "Good morning!"
 
# Set Device background
Canvas.backgroundColor = "#ccc"

# Set Screen background
Screen.backgroundColor = "#00AAFF"

# # Create a layer
square = new Layer
	width: 400	
	height: 400
	backgroundColor: "#FFF"
	
# center the square
square.center()

# Create additional states
square.states =
	state1: scale: 1.5
	state2: rotation: 225
	state3: scale: 0.5, borderRadius: 250
	
# Create an animation
square.states.animationOptions =
#	curve: "spring(250,20,100)"
	curve: Bezier.ease

# Animate based on the onClick event
square.onClick ->
	square.stateCycle()
	
# Create new layer
# layer = new Layer

# layer = new Layer
# 	width: 150
# 	height: 150

# layer = new Layer
# 	width: 150
# 	height: 150
# 	x: 100
# 	y: 100

# Create layer2
# layer2 = new Layer
# 	width: 150, height: 150, x: 100, y: 100
	
# layer2.center()

# layer2.borderRadius = 100

# layer2.borderRadius = layer2.width/2

# layer2.on Events.Click, ->
#     layer2.animate
#         properties:
#             x: 200
#             y: 600

# layer2.draggable = true

# Create layer3
# layer3 = new Layer
# layer3.borderWidth = 2
# layer3.borderColor = "red"
# layer3.backgroundColor = "red"

# layer3.animate
#     x: 200
    
# layer3.animate
#     x: 200
#     options:
#         curve: Spring(damping: 0.5)
#         time: 1.5
        
# Create layer4
# layer4 = new Layer
# 	width: 200
# 	height: 200
# 	x: 100
# 	y: 100
# 	color: Utils.randomColor()
	
# layer4.shadowY = 1
# layer4.shadowBlur = 4
# layer4.shadowColor = "rgba(0,0,0,0.2)"

            

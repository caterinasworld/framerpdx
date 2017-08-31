# Import file "parallax_demo_01"
sketch = Framer.Importer.load("imported/parallax_demo_01@2x", scale: 1)

# Framer Parallax Demo for the Framer PDX Meetup (08/30/2017)
# ===========================================================

# Table of Contents 
# 01 ScrollComponent Setup
# 02 Scroll event listener
# 03 Utils.modulate
# 04 Scroll to a layer


# 01 Scroll setup 
# ====================================================
scroll = ScrollComponent.wrap(sketch.Mobile)
scroll.scrollHorizontal = false
scroll.directionLock = true
scroll.contentInset =
    top: 0
    right: 0
    bottom: 80
    left: 0

# Layers
progressBar = new Layer
	backgroundColor: new Color("hsla(198, 61, 82, 1)")
	height: 20
	width: 0

progressText = new TextLayer
	color: 'black'
	fontFamily: 'Roboto'
	fontWeight: 100
	fontSize: 18
	text: '0%'

trianglesWrap = new Layer
	height: 20
	width: Screen.width
	
sketch.Triangles.parent = trianglesWrap
sketch.Triangles.y = Screen.height

sketch.thed_end.states =
	default:
		scaleX: 0
	on:
		scaleX: 1
sketch.thed_end.animationOptions =
	time: 0.1

# 02 Scroll listener
# ====================================================
scrollArea = scroll.content.height - Screen.height
scroll.content.on "change:y", ->
	yPos = -scroll.content.y
	
	# Use position to change an object's properties
	
	# 03 Utils.modulate
	# ====================================================	
	yPosPercent = Utils.round(yPos / scrollArea * 100)
	progressText.text = yPosPercent + '%'
		
	progressBarWidth = Utils.round(Utils.modulate(yPos, [0, scrollArea], [0, scroll.content.width]))
	progressBar.width = progressBarWidth
	
	progressBarHue = Utils.round(Utils.modulate(yPos, [0, scrollArea], [220, 327]))
	progressBar.backgroundColor = new Color("hsla(" + progressBarHue + ", 90, 79, 1)")
	
	# Circles
	circlesXPos = Utils.round(Utils.modulate(yPos, [0, scrollArea], [-353, 710]))
	sketch.Circles.x = circlesXPos	
	sketch.Circles.y = yPos	
	
	# Triangles
	trianglesYPos = Utils.round(Utils.modulate(yPos, [0, scrollArea], [Screen.height, -(sketch.Triangles.height/2)]))
	sketch.Triangles.y = trianglesYPos
	
	# Rotate
	sketch.section_1_object.rotationZ = yPos * .9
	sketch.section_2_object.rotationZ = -yPos * .78
	sketch.section_3_object.rotationZ = yPos * .88
	
	# Animate End text when visible
	endVisibleAt = sketch.thed_end.y - Screen.height
	if yPos > endVisibleAt
		sketch.thed_end.animate("on")
	else
		sketch.thed_end.animate("default") 

# Scroll to a layer
# ====================================================
sketch.thed_end.parent = scroll.content # Add this layer to the ScrollComponent
sketch.down_btn.on Events.Click, ->
	scroll.scrollToLayer(sketch.thed_end)

# import twitter background layer with WWCode
bg = new Layer
	width: 1242, height: 2208
	image: "images/twitter.png"

# import balloon images as layers	

# set up an array of colors to represent the different balloon colors
colors = ["cerise", "redviolet", "monza", "stiletto"]

# generate multiple balloon colors
# print color to check
# generate multiple balloons
# print balloon.x to check
# place all balloon at the bottom of the screen
# animate the balloon moving up the screen

for[1..40]
	color = Utils.randomChoice colors
	#print color 
	heart = new Layer
		image: "images/#{color}.png"
		width: 226, height: 202
		x: Utils.randomNumber -70, Screen.width + 70
		y: Screen.height - 202
	#print balloon.x
	heart.animate
		properties:
			x: heart.x + Utils.randomNumber -500, 500
			y: -heart.height
		time: Utils.randomNumber 3, 6 
		delay: Utils.randomNumber 5, 10
		curve: Bezier.easeIn

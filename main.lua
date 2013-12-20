require "class"
require "game"
require "scene"
require "actor"
require "intro"
require "taker"
require "camera"
local gamera = require "libCam"


function love.load()
	love.graphics.setDefaultImageFilter("nearest", "nearest")
	love.mouse.setVisible(false)
	

	mouseX = love.mouse.getX()
	mouseY = love.mouse.getY()

	--assets
	imgCamera = love.graphics.newImage("images/camera.png")
	imgCamera2 = love.graphics.newImage("images/camera2.png")
	imgCamera3 = love.graphics.newImage("images/camera3.png")
	imgTakerCowboy = love.graphics.newImage("images/takeboardCowboy1.png")
	imgTakerCowboy2 = love.graphics.newImage("images/takeboardCowboy2.png")
	imgTakerCity = love.graphics.newImage("images/takeboardCity1.png")
	imgTakerCity2 = love.graphics.newImage("images/takeboardCity2.png")
	imgTakerHostage = love.graphics.newImage("images/takeboardHostage1.png")
	imgTakerHostage2 = love.graphics.newImage("images/takeboardHostage2.png")
	imgTalk = love.graphics.newImage("images/talk.png")
	imgLogo = love.graphics.newImage("images/logo.png")
	imgSheepolution = love.graphics.newImage("images/sheepolution.png")
	imgLove = love.graphics.newImage("images/love.png")

	----scenes
	imgCowboy = {}
	for i=1,7 do
		table.insert(imgCowboy,love.graphics.newImage("images/cowboyscene" .. i .. ".png"))
	end

	imgHostage = {
	love.graphics.newImage("images/hostagescene1.png"),
	love.graphics.newImage("images/hostagescene1.png"),
	love.graphics.newImage("images/hostagescene3.png"),
	love.graphics.newImage("images/hostagescene3.png"),
	love.graphics.newImage("images/hostagescene3.png"),
	love.graphics.newImage("images/hostagescene6.png"),
	love.graphics.newImage("images/hostagescene7.png"),
	}

	imgMenu = love.graphics.newImage("images/menuscene.png")

	imgCity = {}
	imgCity[1] = love.graphics.newImage("images/cityscene1.png")

	--papers
	imgPaperIntro = love.graphics.newImage("images/paperintro.png")
	imgPaperReview = love.graphics.newImage("images/paperreview.png")
	imgPaperCowboy = {}
	imgPaperCity = {}
	imgPaperHostage = {}
	for i=1,5 do
		table.insert(imgPaperCowboy,love.graphics.newImage("images/papercowboy" .. i .. ".png"))
		table.insert(imgPaperCity,love.graphics.newImage("images/papercity" .. i .. ".png"))
		table.insert(imgPaperHostage,love.graphics.newImage("images/paperhostage" .. i .. ".png"))
	end
	
	imgBillyWin = love.graphics.newImage("images/billywin.png")
	imgBillyLose = love.graphics.newImage("images/billylose.png")
	imgHoboWin = love.graphics.newImage("images/hobowin.png")
	imgHoboLose = love.graphics.newImage("images/hobolose.png")
	imgDirectorWin = love.graphics.newImage("images/directorwin.png")
	imgDirectorLose = love.graphics.newImage("images/directorlose.png")

	imgZoommeter = love.graphics.newImage("images/zoommeter.png")
	--actors
	imgManActor = love.graphics.newImage("images/walkman.png")
	quadManActor = {}
	for i = 1, 3 do
		quadManActor[i] = love.graphics.newQuad((i-1)*44, 0, 44, 76, 132, 76)
	end
	imgWomanActor = love.graphics.newImage("images/walkwoman.png")
	quadWomanActor = {}
	for i = 1, 3 do
		quadWomanActor[i] = love.graphics.newQuad((i-1)*44, 0, 44, 76, 132, 76)
	end
	imgCars = {
		love.graphics.newImage("images/cargreen.png"),
		love.graphics.newImage("images/carblue.png"),
		love.graphics.newImage("images/carblack.png"),
		love.graphics.newImage("images/carred.png")
	}

	--audio
	sndAudio = {
	love.audio.newSource("audio/cowboy.mp3","static"),
	love.audio.newSource("audio/joy.mp3","static"),
	love.audio.newSource("audio/hostage.mp3","static")
	}


	--font
	fntDirector = love.graphics.newFont("fonts/director.ttf",16)
	fntScore = love.graphics.newFont("fonts/director.ttf",40)
	love.graphics.setFont(fntDirector)



	score = 0

	Cam = gamera.new(-2000,-2000,4000,4000)
	Cam:setWindow(20,80,612,612)
	gamestate = "intro"

	intro_load()



end

function love.update(dt)
	dt = math.min(dt,0.0166666667)
	if (gamestate == "game") then
		mouseX,mouseY = love.mouse.getX(), love.mouse.getY()
	
		game_update(dt)
	else
		intro_update(dt)
	end

end

function love.draw()
	if (gamestate == "game") then
		game_draw()
	else
		intro_draw()
	end
	
end

function love.mousepressed(x,y,button)
	
	if (gamestate == "intro") then
		if (button == "l") then
			gamestate = "game"
			game_load(0)
			return
		end
	end
	if (review) then
		if (button == "l") then
			intro_load()
			gamestate = "intro"
			return
		end
	end
	if (movieScene == 0) then
		if (button == "l") then
			if (myCamera:getInside(myScene.frame)) then
				endMovie = true
				return
			end
		end
	end
	if (endMovie) then
		if (button == "l") then
			if (movieScene~=3) then
			game_load(movieScene+1)
			else
				review = true
			end
			return
		end
	end

	
	if (button == "wu") then
		if (Cam.scale<4) then
			Cam:setScale(Cam.scale + 0.1)
		end
	end
	if (button == "wd") then
		if (Cam.scale>0.7) then
			Cam:setScale(Cam.scale - 0.1)
		end
	end

end

function love.keypressed(k)
	if (gamestate == "intro") then
		if (k == " ") then
			gamestate = "game"
			game_load(0)
			return
		end
	end
	if (review) then
		if (k == " ") then
			intro_load()
			gamestate = "intro"
			return
		end
	end
	if (movieScene == 0) then
		if (k == " ") then
			if (myCamera:getInside(myScene.frame)) then
				endMovie = true
				return
			end
		end
	end
	if (endMovie) then
		if (k == " ") then
			if (movieScene~=3) then
			game_load(movieScene+1)
			else
				review = true
			end
			return
		end
	end
	if (k == "r") then
		gamestate = "intro"
		intro_load()
	end
	if (k == "f4") then
		love.graphics.toggleFullscreen()
	end
	if (k == "escape") then
		love.event.quit()
	end
end
scene = class:new()
function scene:init(n)
	self.number = n
	self.frame = 1
	self.timer = 0
	self.minitimer = 1
	self.framespeed = 0


	if (self.number == 0) then
		love.graphics.setBackgroundColor(201,201,201)
		self.insideRect = {
			{x = 620,y = 720, w = 30, h = 10}
		}

		self.outsideRect = {
			{x = 450,y = 600, w = 350, h = 200}
		}

		self.text = {
		"To begin the game: \n Zoom in on the PLAY board of the homeless, and left click.",
		"You can zoom in with your scroll-wheel \n F4 for fullscreen",
		"In game, make sure the people are good in the center of your camera.",
		"Read these descriptions carefully to know what to film.",
		"This game was made by Sheepolution ( Daniël Haazen ) for Ludum Dare 28 with LÖVE.",
		"www.sheepolution.com \nwww.ludumdare.com \nwww.love2d.org",
		"Special thanks to the\nLudum Dare community!"
		
		}

	end
	if (self.number == 1) then
		love.graphics.setBackgroundColor(235,201,143)
		self.insideRect = {
			{x = 470,y = 700, w = 340, h = 100},
			{x = 470,y = 700, w = 340, h = 100},
			{x = 755,y =700,w = 50,h =100},
			{x = 755,y =700,w = 50,h =100},
			{x = 470,y =700,w = 50,h =100},
			{x = 470,y =700,w = 50,h =100},
			{x = 470,y = 700, w = 340, h = 100}
		}

		self.outsideRect = {
			{x = 250,y = 300, w = 900, h = 900},
			{x = 250,y = 300, w = 900, h = 900},
			{x = 640,y = 600,w = 350,h = 300},
			{x = 640,y = 600,w = 350,h = 300},
			{x = 350,y = 600,w = 350,h = 300},
			{x = 350,y = 600,w = 350,h = 300},
			{x = 174, y = 24, w = 1000, h = 1000}
		}

		self.text = {
		"Put both cowboys in shot. I want to see the dead stare between these guys!",
		"Just a little longer..",
		"Zoom in on the bandit! Make sure he's good in screen.",
		"Beautiful acting Billy! You're getting an Oscar for this one!",
		"Wonderful! Now zoom in on the sheriff.",
		"Keep it on the sherrif. Say your line Dave!",
		"Okay now a complete zoom out!"
		}

		self.framespeed = 3
	end

	if (self.number == 2) then
		love.graphics.setBackgroundColor(201,201,201)
		self.insideRect = {
			{x = 1090,y = 500, w = 100, h = 100},
			{x = 400,y = 680, w = 50, h = 100},
			{x = 580,y =680,w = 130,h =100},
			{x = 670,y =690,w = 30,h =30},
			{x = 900,y =700,w = 100,h =100},
			{x = 1300,y = 680, w = 40, h = 100},
			{x = 1230,y = 670, w = 30, h = 60}
		}

		self.outsideRect = {
			{x = 1000,y = 430, w = 300, h = 250},
			{x = 290,y = 570, w = 400, h = 400},
			{x = 420,y = 600,w = 450,h = 300},
			{x = 620,y = 650,w = 130,h = 140},
			{x = 700,y = 500,w = 500,h = 400},
			{x = 1100,y = 570, w = 500, h = 300},
			{x = 1100,y = 570, w = 300, h = 250}
		}

		self.actors = {
			actor:new(-100,690,40,"daria"),
			actor:new(-100,700,40,"ludo"),
			actor:new(700,695,0,"static"),
			actor:new( 6000,740,-300,"car",3),
			actor:new( 12000,740,-300,"car",4),
			actor:new( 16000,740,-300,"car",4),
			actor:new(-4500,800,300,"car",1),
			actor:new(-8000,800,300,"car",2),
			actor:new(-12000,800,300,"car",1)
		}


		self.actors[2]:addStop(0.6)

		self.text = {
		"Start with the window washer. Zoom in!",
		"Daria and Ludo are entering, get them on screen",
		"Make sure they can also see the homeless man!",
		"Zoom in on the homeless man's eyes. People love this emotional stuff",
		"And zoom out, but not too far. Show only the zebra crossing.",
		"And zoom in Daria and Ludo again.",
		"Quick! Go back to the man in the alley!"
		}

		self.framespeed = 7

	end

	if (self.number == 3) then
		love.graphics.setBackgroundColor(11,60,27)
		self.insideRect = {
			{x = 470,y = 440, w = 500, h = 100},
			{x = 660,y = 450, w = 50, h = 80},
			{x = 950,y = 450, w = 50, h = 80},
			{x = 230,y =380,w = 190,h =120},
			{x = 380,y =420,w = 50,h =70},
			{x = 380,y =450,w = 310,h =70},
			{x = 950,y = 450, w = 50, h = 80},
		}

		self.outsideRect = {
			{x = 250,y = 50, w = 900, h = 900},
			{x = 550,y = 350, w = 250, h = 300},
			{x = 840,y = 350,w = 250,h = 300},
			{x = 110,y = 200,w = 400,h = 400},
			{x = 300,y = 350,w = 200,h = 200},
			{x = 290,y =150,w = 500,h = 600},
			{x = 840,y = 350,w = 250,h = 300}
		}

		self.text = {
			"Alright, listen up! Zoom out so I can see both the police at the door and Caity.",
			"Zoom in on the kidnapper! Let the public see he has no life in him whatsoever!",
			"Caity you're doing great! Focus the camera on Caity. Her fake crying is so realistic!",
			"Now the police comes in action! Show the entire police force.",
			"Okay now zoom in on the policeman at the door. Kick that door Frank!",
			"What a kick! Quick, show both the policeman and the kidnapper.",
			"Zoom in on the face! Wait, are we using real bullets?! Don't show this! Go to Caity! Quickly!"
		}

		self.framespeed = 5
	end

	self.correct = {
	false,false,false,false,false,false,false
	}
	
end

function scene:update(dt)
	if (self.number == 2) then
		for i=1,#self.actors do
			self.actors[i]:update(dt)
		end
	end

	
		self.timer = self.timer + 1 * dt
	if (movieScene~=0 and myTaker.take or movieScene == 2) then
		self.minitimer = self.minitimer + 1 * dt
	end


	if (self.framespeed == math.floor(self.minitimer)) then
		nextFrame()
		self.minitimer = 0
	end

	if (self.number == 2) then
		if (math.floor(self.timer) == 8) then
			self.actors[1]:addTalk(2)
		end
		if (math.floor(self.timer) == 11) then
			self.actors[2]:addTalk(1)
		end
		if (math.floor(self.timer) == 13) then
			self.actors[1]:addTalk(2)
		end
		if (math.floor(self.timer) == 16) then
			self.actors[1]:addStop(2)
			self.actors[2]:addStop(1.8)
			self.actors[3]:addTalk(3)
		end
		if (math.floor(self.timer) == 25) then
			self.actors[1]:addStop(1.3)
			self.actors[2]:addStop(1.5)
		end
		if (math.floor(self.timer) == 28) then
			self.actors[1]:addTalk(2)
		end
		if (math.floor(self.timer) == 30) then
			self.actors[2]:addTalk(1.8)
		end
		if (math.floor(self.timer) == 33) then
			self.actors[2]:addTalk(2)
		end
		if (math.floor(self.timer) == 35) then
			self.actors[1]:addTalk(1.8)
		end

	end


end

function scene:draw()

	love.graphics.setColor(255,255,255)
	if (self.number == 0) then
		love.graphics.draw(imgMenu,150,300)
	elseif (self.number == 1) then
		love.graphics.draw(imgCowboy[self.frame] or imgCowboy[7],150,300)
	elseif (self.number == 2) then
		love.graphics.draw(imgCity[1],150,300)
		for i=1,#self.actors do
			self.actors[i]:draw()
		end
	elseif (self.number == 3) then
		love.graphics.draw(imgHostage[self.frame] or imgHostage[7], 150, 300)
	end

	if (love.keyboard.isDown("lshift")) then
		love.graphics.rectangle("line", self.insideRect[self.frame].x, self.insideRect[self.frame].y, self.insideRect[self.frame].w, self.insideRect[self.frame].h)
		love.graphics.rectangle("line", self.outsideRect[self.frame].x, self.outsideRect[self.frame].y, self.outsideRect[self.frame].w, self.outsideRect[self.frame].h)
	end

end

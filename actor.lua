actor = class:new()
function actor:init(x,y,s,r,c)
 	--Every moving entity which is not the camera is an actor. Even moving objects is an actor.
	self.xPos = x
	self.yPos = y
	self.role = r
	self.speed = s
	self.talk = 0
	self.timer = 1
	self.stop = 0
	self.color = c

end

function actor:update(dt)
	if (self.stop <= 0) then
		self.xPos = self.xPos + self.speed * dt
	else
		self.timer = 2
	end

	self.timer = self.timer + 4 * dt
	if (self.timer > 4) then
		self.timer = 1
	end
	self.talk = self.talk - 1 * dt
	self.stop = self.stop - 1 * dt

end

function actor:draw()

	if (self.role == "ludo") then
		love.graphics.drawq(imgManActor,quadManActor[math.floor(self.timer)],self.xPos,self.yPos)
	elseif (self.role == "daria") then
		love.graphics.drawq(imgWomanActor,quadWomanActor[math.floor(self.timer)],self.xPos,self.yPos)
	elseif (self.role == "car") then
		love.graphics.draw(imgCars[self.color],self.xPos,self.yPos)
	end

	if (self.talk > 0) then
		love.graphics.draw(imgTalk,self.xPos+10,self.yPos-50)
	end

end

function actor:addTalk(length)
	self.talk = length
end

function actor:addStop(length)
	self.stop = length
end
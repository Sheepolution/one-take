taker = class:new()
function taker:init()
	self.xPos, self.yPos = 100,120
	self.take = false
	self.timer = 0
end

function taker:update(dt)

	self.timer = self.timer + 1 * dt
	if (self.timer > 3) then
		self.take = true
	end

	if (self.take) then
		self.xPos = self.xPos - 1000 * dt
		self.yPos = self.yPos + 20 * dt
	end

end

function taker:draw()
	if (movieScene == 1) then
		if (self.take) then
			love.graphics.draw(imgTakerCowboy2,self.xPos,self.yPos)
		else
			love.graphics.draw(imgTakerCowboy,self.xPos,self.yPos)
		end
	elseif (movieScene == 2) then
		if (self.take) then
			love.graphics.draw(imgTakerCity2,self.xPos,self.yPos)
		else
			love.graphics.draw(imgTakerCity,self.xPos,self.yPos)
		end
	elseif (movieScene == 3) then
		if (self.take) then
			love.graphics.draw(imgTakerHostage2,self.xPos,self.yPos)
		else
			love.graphics.draw(imgTakerHostage,self.xPos,self.yPos)
		end
	end
end
camera = class:new()
function camera:init()
	self.left, self.up, self.right, self.down = 120, 192, 532, 552
	self.timer = 0
	self.bieber = 100

end

function camera:update(dt)
	self.timer = self.timer + 1 * dt
	if (self.timer > 2.4) then
		self.timer = 0
		self.bieber = math.random(1000)
	end

end


function camera:draw()
	love.graphics.setColor(255,255,255)

	if (self.timer > 1.2) then
		if (self.bieber<5) then
			love.graphics.draw(imgCamera3,self.xPos,self.yPos,0,1,1,self.w,self.h)
		else
			love.graphics.draw(imgCamera,self.xPos,self.yPos,0,1,1,self.w,self.h)
		end
	else
		love.graphics.draw(imgCamera2,self.xPos,self.yPos,0,1,1,self.w,self.h)
	end
	love.graphics.setColor(255,255,255)
	love.graphics.draw(imgZoommeter,224 + 41 *Cam.scale, 664)
	
	for i=1,#myScene.text do
		if (myScene.frame == i or movieScene == 0) then
			love.graphics.setColor(0,0,0)
		elseif (i < myScene.frame or myScene.frame == 8 ) then
			if (myScene.correct[i]) then
				love.graphics.setColor(0,200,0)
			else
				love.graphics.setColor(255,0,0)
			end
		else
			love.graphics.setColor(180,180,180)
		end
		love.graphics.setFont(fntDirector)
		love.graphics.printf(myScene.text[i], 655, 90*i, 340, "left")
		love.graphics.setColor(0,0,0)
		love.graphics.line(655, 85+90*i, 1024,85+90*i)
	end
	love.graphics.setColor(255,255,255)
	if (movieScene == 0) then
		love.graphics.draw(imgLogo,0,0)
	end

end

function camera:getInside(f)
	local scn = myScene.outsideRect[f]
	local x, y = Cam:toScreen(scn.x,scn.y)
	local w, h = Cam:toScreen(scn.x+scn.w,scn.y+scn.h)
	if (self.left > x and self.up > y and self.right < w and self.down < h) then
		scn = myScene.insideRect[f]
		x, y = Cam:toScreen(scn.x,scn.y)
		w, h = Cam:toScreen(scn.x+scn.w,scn.y+scn.h)
		if (self.left < x and self.up < y and self.right > w and self.down > h) then
			return true
		else
			return false
		end
	end
end
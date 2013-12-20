function game_load(s)
	
	movieScene = s
	myScene = scene:new(s)
	myCamera = camera:new()
	myTaker = taker:new()
	endMovie = false
	timer = 0
	review= false
	Cam:setScale(1)
	if (s~=0) then
		love.audio.play(sndAudio[s])
	end

end

function game_update(dt)
	Cam:setPosition(mouseX*((mouseX-300)/200)+325,mouseY+300)
	myCamera:update(dt)
	myScene:update(dt)
	myTaker:update(dt)
end

function game_draw()
	if (not endMovie) then 
		Cam:draw(function(l,t,w,h)
			love.graphics.setColor(255,255,255)
			myScene:draw()

		end)
		love.graphics.setColor(255,255,255)
		myTaker:draw()
		myCamera:draw()
	else
		local good = 0
		for i=1,#myScene.correct do
			if (myScene.correct[i]) then
				if (myScene.correct[i]) then
					good = good + 1
				end
			end
		end
		love.graphics.setColor(255,255,255)
		love.graphics.setBackgroundColor(0,0,0)
		if (review) then
			love.graphics.draw(imgPaperReview, 280, 10)
			love.graphics.setColor(102,102,102)
			love.graphics.setFont(fntScore)
			love.graphics.print(score .. "/21 points!", 340, 620)
		elseif (movieScene == 0) then
			love.graphics.draw(imgPaperIntro,280,10)
		elseif (movieScene == 1) then
			if (good == 7) then
				love.graphics.draw(imgPaperCowboy[1], 280, 10)
			elseif (good == 6) then
				love.graphics.draw(imgPaperCowboy[2], 280, 10)
			elseif (good >= 4) then
				love.graphics.draw(imgPaperCowboy[3], 280, 10)
			elseif (good >= 1) then
				love.graphics.draw(imgPaperCowboy[4], 280, 10)
			elseif (good == 0) then
				love.graphics.draw(imgPaperCowboy[5], 280, 10)
			end
		elseif (movieScene == 2) then
			if (good == 7) then
				love.graphics.draw(imgPaperCity[1], 280, 10)
			elseif (good == 6) then
				love.graphics.draw(imgPaperCity[2], 280, 10)
			elseif (good >= 4) then
				love.graphics.draw(imgPaperCity[3], 280, 10)
			elseif (good >= 1) then
				love.graphics.draw(imgPaperCity[4], 280, 10)
			elseif (good == 0) then
				love.graphics.draw(imgPaperCity[5], 280, 10)
			end
		elseif (movieScene == 3) then
			if (good == 7) then
				love.graphics.draw(imgPaperHostage[1], 280, 10)
			elseif (good == 6) then
				love.graphics.draw(imgPaperHostage[2], 280, 10)
			elseif (good >= 4) then
				love.graphics.draw(imgPaperHostage[3], 280, 10)
			elseif (good >= 1) then
				love.graphics.draw(imgPaperHostage[4], 280, 10)
			elseif (good == 0) then
				love.graphics.draw(imgPaperHostage[5], 280, 10)
			end
		end
		if (not review) then
			if (movieScene == 1) then
				if (myScene.correct[3] and myScene.correct[4] and myScene.correct[5]) then
					love.graphics.draw(imgBillyWin, 290, 530)
				else 
					love.graphics.draw(imgBillyLose, 290, 530)
				end
			elseif (movieScene == 2) then
				if (myScene.correct[4]) then
					love.graphics.draw(imgHoboWin, 290, 530)
				else 
					love.graphics.draw(imgHoboLose, 290, 530)
				end
			elseif (movieScene == 3) then
				if (myScene.correct[7]) then
					love.graphics.draw(imgDirectorWin, 290, 530)
				else 
					love.graphics.draw(imgDirectorLose, 290, 530)
				end
			end
		end
	end
	love.graphics.setColor(255,255,255)

end

function nextFrame()
	if (myScene.frame<8) then
		myScene.correct[myScene.frame] = myCamera:getInside(myScene.frame)
		if (myCamera:getInside(myScene.frame)) then
			score = score + 1
		end
		myScene.frame = myScene.frame + 1
		
	else
		endMovie = true
	end

end
function game_load()
	gamestate = "game"
	fly = 1
	score = 0
	ready = 0
	if score > best then
		best = score
	end

	up = 0
	change = 0

	direct = 0
	posX = iniX
   	posY = iniY

   	first = 0
   	tbl = {}
   	for i=1,200 do
   		table.insert(tbl, math.random(0, 180))
   	end
   	
end

function game_mousepressed()
	if ready == 0 then
		ready = 1
	elseif ready == 1 then
		change = 1
		up = 25
	end
end

function game_draw()


	if ready == 1 then
		first = first + 10 -- move speed
		for i=1,200 do
			love.graphics.draw(image, quad_holdback2, gamewidth - first + (i-1) * 180, tbl[i] - 190, 0, 1, 1, 0, 0)
		  	love.graphics.draw(image, quad_holdback1, gamewidth - first + (i-1) * 180, tbl[i] + 200, 0, 1, 1, 0, 0)
		end
	end

	if posX > gamewidth - first + score * 180 then
		score = score + 1
		love.audio.play(passsound)
		print(score)
	end


	--!!!!!!!!!!!!!!!!!!!!!!! game over
	---- knock on ground
	if posY - up >= 455  then
		-- print(posY)
		-- print("gameover")
		end_load(0)
	end
	---- 
	nexthold = gamewidth - first + score * 180
	print("======")
	print("posY = " .. posY)
	print("tbl = " .. tbl[score + 1] )
	print("nexthold = " .. nexthold)
	-- print("posX = " .. posX)
	print("======")
	if nexthold == 130 then
		if posY < tbl[score+1] + 100 then
			end_load(1)
		end
		if posY > tbl[score+1] + 200 then
			end_load(1)
		end
	elseif nexthold < 130 and nexthold > 90 then
		if posY < tbl[score+1] + 100 then
			end_load(1)
		end
		if posY > tbl[score+1] + 200 then
			end_load(1)
		end
	end

	-- ready
	if ready == 0 then
		
		-- get ready
		love.graphics.draw(image,quadgetready,gamewidth/2-508/6,gameheight/3.5)
		-- click
		love.graphics.draw(image,quadclick,gamewidth/2-286/6,gameheight/2.5)

		if(fly == 0) then
			posY = iniY - 3
			love.graphics.draw(image,quadbird2, posX, posY)
		end
		if(fly == 1) then
			love.graphics.draw(image,quadbird1, posX, posY)
			
		end
		if(fly == 2) then
			posY = iniY + 3
			love.graphics.draw(image,quadbird3, posX, posY)
		end
		if(fly == 3) then
			love.graphics.draw(image,quadbird1, posX, posY)
		end
		love.timer.sleep( 0.1 )

	elseif ready == 1 then

		-- print(up)
		up = up - 4

		if up <= 0 then --down
			posY = posY - up
			-- direct = 0.7
		else 
			posY = posY - up
			-- direct = 6 
		end

		if(fly == 0) then
			love.graphics.draw(image,quadbird2, posX, posY, direct)
		end
		if(fly == 1) then
			love.graphics.draw(image,quadbird1, posX, posY, direct)
		end
		if(fly == 2) then
			love.graphics.draw(image,quadbird3, posX, posY, direct)
		end
		if(fly == 3) then
			love.graphics.draw(image,quadbird1, posX, posY, direct)
		end


		-- score
		local sc = score
		local len = 0
		while math.floor(sc/10) ~= 0 do
			sc = math.floor(sc/10)
			len = len + 1
		end

		-- print(len)
		sc = score
		if sc == 0 then
			love.graphics.draw(image,quad_num[0],gamewidth/2-55/6,gameheight/5)
		end
		while sc ~= 0 do
			love.graphics.draw(image,quad_num[sc % 10],gamewidth/2 + len * 68 / 3 - 55/6, gameheight/5)
			sc = math.floor(sc / 10)
			len = len - 1
		end
		

		love.timer.sleep( 0.08 )
	end

	

end
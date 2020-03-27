function end_load()
	gamestate = "end"
end

function end_mousepressed(moux,mouy)

	gamewidth = love.graphics.getWidth()
	gameheight = love.graphics.getHeight()
	-- if press start
	if( gamewidth/4-290/6 < moux and moux < gamewidth/4+290/6 and gameheight*3/4-100 - 176/6 < mouy and mouy < gameheight*3/4-100 + 178/6 ) then
		game_load()
	end

end

function end_draw(x)
	

	for i=1,200 do
		love.graphics.draw(image, quad_holdback2, gamewidth - first + (i-1) * 180, tbl[i] - 190, 0, 1, 1, 0, 0)
	  	love.graphics.draw(image, quad_holdback1, gamewidth - first + (i-1) * 180, tbl[i] + 200, 0, 1, 1, 0, 0)
	end

	-- bird
	if x == 0 then
		love.graphics.draw(image,quadbird2, posX, 470, 0.2)
	else 
		posY = posY + 40
		if posY <= 470 then
			love.graphics.draw(image,quadbird2, posX, posY, 0.2)
		else
			love.graphics.draw(image,quadbird2, posX, 470, 0.2)
		end
	end
	-- game over
	love.graphics.draw(image,quadgaov,gamewidth/2-508/6,gameheight/4)


	-- board
	love.graphics.draw(image,quadbase,gamewidth/2-590/6,gameheight/3)

	if score > best then
		-- best = score
		love.graphics.draw(image,quadnew, 250, gameheight/3 + 70)
	end

	-- score
	local sc = score
	local len = 0
	while math.floor(sc/10) ~= 0 do
		sc = math.floor(sc/10)
		len = len + 1
	end

	sc = score
	if sc == 0 then
		love.graphics.draw(image,quad_num[0], 230,gameheight/3 + 28, 0, 0.6, 0.6)
	end
	while sc ~= 0 do
		love.graphics.draw(image,quad_num[sc % 10], 230 + len * 12, gameheight/3 + 28, 0 , 0.6, 0.6)
		sc = math.floor(sc / 10)
		len = len - 1
	end

	-- best
	if score > best then
		sc = score
	else
		sc = best
	end

	local len = 0
	while math.floor(sc/10) ~= 0 do
		sc = math.floor(sc/10)
		len = len + 1
	end

	if score > best then
		sc = score
	else
		sc = best
	end

	if sc == 0 then
		love.graphics.draw(image,quad_num[0], 230,gameheight/3 + 64, 0, 0.6, 0.6)
	end
	while sc ~= 0 do
		love.graphics.draw(image,quad_num[sc % 10], 230 + len * 12, gameheight/3 + 64, 0 , 0.6, 0.6)
		sc = math.floor(sc / 10)
		len = len - 1
	end

	-- two button
	love.graphics.draw(image,quadstart,gamewidth/4-290/6,gameheight*3/4-100)
	love.graphics.draw(image,quadgrade,gamewidth*3/4-290/6,gameheight*3/4-100)



	love.timer.sleep( 0.1 )
end
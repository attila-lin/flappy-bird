function menu_load()
	gamestate = "menu"
end

function menu_mousepressed(moux,mouy)

	gamewidth = love.graphics.getWidth()
	gameheight = love.graphics.getHeight()
	-- if press start
	if( gamewidth/4-290/6 < moux and moux < gamewidth/4+290/6 and gameheight*3/4-100 - 176/6 < mouy and mouy < gameheight*3/4-100 + 178/6 ) then
		-- print(moux)
		-- print(mouy)
		game_load()
	end

end

function menu_draw()

	love.graphics.draw(image,quadtitle,gamewidth/2-508/6,gameheight/4)

	fly = fly % 4

	-- print(x)

	if(fly == 0) then
		love.graphics.draw(image,quadbird1,gamewidth/2-86/4,gameheight/2.5 - 3)
	end
	if(fly == 1) then
		love.graphics.draw(image,quadbird2,gamewidth/2-86/4,gameheight/2.5)
	end
	if(fly == 2) then
		love.graphics.draw(image,quadbird3,gamewidth/2-86/4,gameheight/2.5 + 3)
	end
	if(fly == 3) then
		love.graphics.draw(image,quadbird2,gamewidth/2-86/4,gameheight/2.5)
	end


	love.timer.sleep( 0.1 )

	-- two button
	love.graphics.draw(image,quadstart,gamewidth/4-290/6,gameheight*3/4-100)
	love.graphics.draw(image,quadgrade,gamewidth*3/4-290/6,gameheight*3/4-100)
end


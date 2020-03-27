-- function love.load() --资源加载回调函数，仅初始化时调用一次

-- end

-- function love.draw() --绘图回调函数，每周期调用

-- end

-- function love.update(dt) --更新回调函数，每周期调用

-- end

-- function love.keypressed(key) --键盘检测回调函数，当键盘事件触发是调用

-- end



function love.load()

	passsound = love.audio.newSource("sounds/pass.ogg", "static");love.audio.stop(passsound)
   pushsound = love.audio.newSource("sounds/shot.ogg", "static");love.audio.stop(pushsound)

	bgimg = love.graphics.newImage("graphics/bg.png")
	quad0 = love.graphics.newQuad(1,1,720/2,1280/2,720/2,1280/2)

   gdimg = love.graphics.newImage("graphics/ground.png")
   quad2 = love.graphics.newQuad(1,1,840/2,281/2,840/2, 281/2)

	image = love.graphics.newImage("graphics/flappy_packer.png")
	
   quadbase = love.graphics.newQuad(1,1,590/3-1,298/3,2048/3,2048/3)

   quadgaov = love.graphics.newQuad(1,300/3,508/3,158/3,2048/3,2048/3)

   quadblack = love.graphics.newQuad(592/3,1/3,80/3,81/3,2048/3,2048/3)
   quadwhite = love.graphics.newQuad(592/3,83/3,80/3,81/3,2048/3,2048/3)

   quadbird1 = love.graphics.newQuad(673/2,1,86/2,60/2,2048/2,2048/2) 
   quadbird2 = love.graphics.newQuad(673/2,62/2,86/2,60/2,2048/2,2048/2)
   quadbird3 = love.graphics.newQuad(673/2,123/2,86/2,60/2,2048/2,2048/2)

   quadclick = love.graphics.newQuad(760/3,1,286/3,246/3,2048/3,2048/3)

   quadtitle = love.graphics.newQuad(1047/3,1,508/3,158/3,2048/3,2048/3)

   quadgetready = love.graphics.newQuad(510/3,300/3,508/3,158/3,2048/3,2048/3)

   quadgrade = love.graphics.newQuad(1556/3,1,290/3,176/3,2048/3,2048/3)
   quadstart = love.graphics.newQuad(448/3,459/3,290/3,176/3,2048/3,2048/3)

   quad_num = {}
   quad_num[0] = love.graphics.newQuad(1020/3,300/3,68/3,100/3,2048/3,2048/3)
   quad_num[1] = love.graphics.newQuad(1084/3,300/3,55/3,100/3,2048/3,2048/3)
   quad_num[2] = love.graphics.newQuad(1136/3,300/3,68/3,100/3,2048/3,2048/3)
   quad_num[3] = love.graphics.newQuad(1203/3,300/3,68/3,100/3,2048/3,2048/3)
   quad_num[4] = love.graphics.newQuad(1272/3,300/3,68/3,100/3,2048/3,2048/3)
   quad_num[5] = love.graphics.newQuad(1342/3,300/3,68/3,100/3,2048/3,2048/3)
   quad_num[6] = love.graphics.newQuad(1412/3,300/3,68/3,100/3,2048/3,2048/3)
   quad_num[7] = love.graphics.newQuad(1482/3,300/3,68/3,100/3,2048/3,2048/3)
   quad_num[8] = love.graphics.newQuad(1552/3,300/3,68/3,100/3,2048/3,2048/3)
   quad_num[9] = love.graphics.newQuad(1622/3,300/3,68/3,100/3,2048/3,2048/3)

   quad_holdback1 = love.graphics.newQuad(1,459/3,148/3,830/3,2048/3,2048/3)
   quad_holdback2 = love.graphics.newQuad(150/3,459/3,148/3,830/3,2048/3,2048/3)

   quadnew = love.graphics.newQuad(673/3,184/3,81/3,36/3,2048/3,2048/3)

   require "menu"
   require "game"
   require "end"

   fly = 1
   score = 0
   ready = 0
   best = 0

   up = 0
   change = 0

   direct = 0

   gamewidth = love.graphics.getWidth()
   gameheight = love.graphics.getHeight()

   iniX = gamewidth/3-86/4
   iniY = gameheight/2.6

   posX = iniX
   posY = iniY

   first = 0
   tbl = {}

   menu_load()
end

function love.draw()

   -- background (necessary)
   love.graphics.draw(bgimg,quad0,0,0)
   

   if gamestate == "menu" or gamestate == "options" then
      menu_draw()
      fly = fly +1
      fly = fly % 4
   elseif gamestate == "game" then
      game_draw()
      fly = fly +1
      fly = fly % 4
   elseif gamestate == "end" then
      end_draw()
   end

   -- ground
   if fly == 0 then
      love.graphics.draw(gdimg,quad2,0,1280/2-140, 0, 1, 1, 0, 0)
   elseif fly == 1 then
      love.graphics.draw(gdimg,quad2,0,1280/2-140, 0, 1, 1, 5, 0)
   elseif fly == 2 then
      love.graphics.draw(gdimg,quad2,0,1280/2-140, 0, 1, 1, 10, 0)
   elseif fly == 3 then
      love.graphics.draw(gdimg,quad2,0,1280/2-140, 0, 1, 1, 15, 0)
   end

   

end

function love.mousepressed(x, y, button)
   if button == "l" then
   		love.audio.play(pushsound)
   end

   if gamestate == "menu" or gamestate == "options" then
      menu_mousepressed(x,y)
   elseif gamestate == "game" then
      game_mousepressed()
   elseif gamestate == "end" then
      end_mousepressed(x,y)
   end

end

function love.focus(f) gameIsPaused = not f end

function love.update(dt)
   if gameIsPaused then return end

    -- The rest of your love.update code goes here
end

function love.quit()
   print("Thanks for playing! Come back soon!")
end
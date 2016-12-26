function love.load()

	character = {}
	character.x = 50
	character.y = 50
	character.CD = 0
	character.image = love.graphics.newImage("Potato.png")

	bullets = {}

	function chrMove()

		if love.keyboard.isDown("w") then
			character.y = character.y - 2
		end
		if love.keyboard.isDown("a") then
			character.x = character.x - 2
		end
		if love.keyboard.isDown("s") then
			character.y = character.y + 2
		end
		if love.keyboard.isDown("d") then
			character.x = character.x + 2
		end

	end

	function chrShoot()
		if love.mouse.isDown(1) and character.CD <= 0 then
			tx2,ty2 = love.mouse.getPosition()
		    angle2 = math.atan2(ty2 - character.y, tx2 - character.x)
		    bullet = {}
		    bullet.x,bullet.y = character.x,character.y
		    bullet.vx, bullet.vy = math.cos(angle2)*5, math.sin(angle2)*5
		    character.CD = 60
		    table.insert(bullets,bullet)
		end
	end

	enemy = {}
	enemy.x = 300
	enemy.y = 300
	enemy.vx = 0
	enemy.vy = 0
	enemy.moveCD = 0
	enemy.image = love.graphics.newImage("Oven.png")

	function enemyMove(target)
		tx,ty = target.x,target.y
	    angle = math.atan2(ty - enemy.y, tx - enemy.x)
	    enemy.vx, enemy.vy = math.cos(angle), math.sin(angle)
	    enemy.moveCD = 40
	end
	function enemyMove2()
		enemy.x = enemy.x + enemy.vx
		enemy.y = enemy.y + enemy.vy
	end

end

function love.update()

	character.CD = character.CD - 1
	enemy.moveCD = enemy.moveCD - 1
	if enemy.moveCD <= 0 then
		enemyMove(character)
	end

	enemyMove2()
	chrMove()
	chrShoot()

	for i,e in ipairs(bullets) do 
		e.x, e.y = e.x + e.vx, e.y + e.vy
	end

end

function love.draw()

	love.graphics.draw(character.image,character.x,character.y,0,1,1,25,25)
	love.graphics.draw(enemy.image,enemy.x,enemy.y,angle,1,1,25,25)
	for i,e in ipairs(bullets) do
		love.graphics.circle("fill",e.x,e.y,2)
	end

end


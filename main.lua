function love.load()

	character = {}
	character.x = 50
	character.y = 50
	character.image = love.graphics.newImage("Potato.png")

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

	-- character shoot functino

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

	enemy.moveCD = enemy.moveCD - 1
	if enemy.moveCD <= 0 then
		enemyMove(character)
	end
	enemyMove2()
	chrMove()

end

function love.draw()

	love.graphics.draw(character.image,character.x,character.y)
	love.graphics.draw(enemy.image,enemy.x,enemy.y,angle,1,1,25,25)

end


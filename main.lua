function love.load()

	character = {}
	character.x = 50
	character.y = 50
	character.image = love.graphics.newImage("Potato.png")

	function chrMove()

		if love.keyboard.isDown("w") then
			character.y = character.y - 1
		end
		if love.keyboard.isDown("a") then
			character.x = character.x - 1
		end
		if love.keyboard.isDown("s") then
			character.y = character.y + 1
		end
		if love.keyboard.isDown("d") then
			character.x = character.x + 1
		end

	end

	-- character shoot functino

	enemy = {}
	enemy.x = 300
	enemy.y = 300
	enemy.image = love.graphics.newImage("Oven.png")

	-- enemy move function

	function enemyMove(target)
		tx,ty = target.x,target.y
	    angle = math.atan2(ty - enemy.y, tx - enemy.x)
	    enemy.vx, enemy.vy = math.cos(angle), math.sin(angle)
	end

end

function love.update()

	chrMove()

end

function love.draw()

	love.graphics.draw(character.image,character.x,character.y)
	love.graphics.draw(enemy.image,enemy.x,enemy.y)

end


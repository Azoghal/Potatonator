function love.load()
	character = {}
	character.x = 50
	character.y = 50
	character.image = love.graphics.newImage("Potato.png")
	-- everything we want to load into the game b4 it starts// runs only 1 time

end

function love.update()

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

	-- everything we want to do forever and ever, such as movement

end

function love.draw()

	love.graphics.draw(character.image,character.x,character.y)
	-- everything we want to see

end


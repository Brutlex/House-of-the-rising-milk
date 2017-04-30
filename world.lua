function update_world(dt)
end

function draw_world()
  love.graphics.rectangle("fill", 0, C.H - 100, C.W, 100)  
end

function borderL()
  local border = {}
  border.body = love.physics.newBody(world, 0, C.H/2)
  border.shape = love.physics.newRectangleShape(0, C.H*3)
  border.fixture = love.physics.newFixture(border.body, border.shape)
  border.fixture:setRestitution(1)
end

function borderR()
  local border = {}
  border.body = love.physics.newBody(world, C.W, C.H/2)
  border.shape = love.physics.newRectangleShape(0, C.H*3)
  border.fixture = love.physics.newFixture(border.body, border.shape)
  border.fixture:setRestitution(0.5)
  border.fixture:setRestitution(1)
end
function borderU()
  local border = {}
  border.body = love.physics.newBody(world, C.W/2, C.H-20)
  border.shape = love.physics.newRectangleShape(C.W*2, 50)
  border.fixture = love.physics.newFixture(border.body, border.shape)
  border.fixture:setRestitution(0.5)
  border.fixture:setUserData("end")
  
end
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
  border.fixture:setRestitution(1)
end

function borderU()
  local border = {}
  border.body = love.physics.newBody(world, C.W/2, C.H-10)
  border.shape = love.physics.newRectangleShape(C.W*7, 10)
  border.fixture = love.physics.newFixture(border.body, border.shape)
  border.fixture:setUserData("end")
end
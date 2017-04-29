-- cookie class and related functionality

function update_cookies(dt)

  if love.keyboard.isDown("right") then
    objects.cookie.body:applyLinearImpulse(1, 0)
  end
end

function draw_cookies()
  love.graphics.draw(cookie1, objects.cookie.body:getX(), objects.cookie.body:getY())
end
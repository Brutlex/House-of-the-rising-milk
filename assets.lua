
function load_assets()
  
  cloud1 = love.graphics.newImage("gfx/cloudMiddle1.png")
  cloud2 = love.graphics.newImage("gfx/cloudSmall.png")
  
  Cookie1 = {
  normal = love.graphics.newImage("gfx/CookieA_front.png"),
  left = love.graphics.newImage("gfx/CookieA_left.png"),
  right = love.graphics.newImage("gfx/CookieA_right.png"),
  jumpUp = love.graphics.newImage("gfx/CookieA_jumpUp.png"),
  jumpLand = love.graphics.newImage("gfx/CookieA_jumpLand.png"),
  }

  Cookie2 = {
  normal = love.graphics.newImage("gfx/CookieB_front.png"),
  left = love.graphics.newImage("gfx/CookieB_left1.png"),
  right = love.graphics.newImage("gfx/CookieB_right1.png"),
  jumpUp = love.graphics.newImage("gfx/CookieB_jumpUp.png"),
  jumpLand = love.graphics.newImage("gfx/CookieB_jumpLand.png"),
  }
end

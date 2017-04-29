
function load_assets()
  milch = love.graphics.newImage("gfx/Milch.png")
  
  cloud1 = love.graphics.newImage("gfx/cloudMiddle1.png")
  cloud2 = love.graphics.newImage("gfx/cloudSmall.png")
  cloud3 = love.graphics.newImage("gfx/cloudMiddle2.png")
  
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

  -- Menü Cookie A
cookieAmenu = love.graphics.newImage("gfx/cookie_right_bigger.png")
keyA = love.graphics.newImage("gfx/Keyboard_Black_A.png")
keyD = love.graphics.newImage("gfx/Keyboard_Black_D.png")
keyW = love.graphics.newImage("gfx/Keyboard_Black_W.png")

  -- buttons Cookie B
cookieBmenu = love.graphics.newImage("gfx/cookie_left_bigger.png")
keyLeft = love.graphics.newImage("gfx/Keyboard_Black_Arrow_Left.png")
keyRight = love.graphics.newImage("gfx/Keyboard_Black_Arrow_Right.png")
keyUp = love.graphics.newImage("gfx/Keyboard_Black_Arrow_Up.png")
  
  -- GUI
  buttonFont = love.graphics.newFont(30)
end

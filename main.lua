local storyboard = require "storyboard"
countPage = 1
countTextImage = 2
isTextView = true

--storyboard.removeAll()
--storyboard.purgeOnSceneChange = true

storyboard.isDebug = true
--print( Runtime:addEventListener( "enterFrame", storyboard.printMemUsage ))

--скрытие статус бара 
display.setStatusBar( display.HiddenStatusBar )

--переход на главную сцену
storyboard.gotoScene( "pages.homePage" )
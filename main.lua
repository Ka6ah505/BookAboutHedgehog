local storyboard = require "storyboard"

--скрытие статус бара 
display.setStatusBar( display.HiddenStatusBar )

--переход на главную сцену
storyboard.gotoScene( "pages.homePage" );
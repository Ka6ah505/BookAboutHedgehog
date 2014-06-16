local composer = require( "composer" )

countPage = 1
countTextImage = 2
isTextView = true

w = display.actualContentWidth
h = display.actualContentHeight
--print(display.actualContentWidth.." "..display.actualContentHeight)
--print(" k: "..display.actualContentHeight/display.actualContentWidth )
--typeFile, arrowWidth, arrowHeight, widthRightRect, widthLeftRect

if h/w > 1.34 then
	arrowHeight = 9
	arrowWidth = 15
	typeFile = "@2"
	widthRightRect = w + w/4
	widthLeftRect = h-w-w/4
else
	arrowHeight = 12
	arrowWidth = 15
	typeFile = ""
	widthRightRect = w
	widthLeftRect = h-w
end

--composer.removeAll()
--composer.purgeOnSceneChange = true

--composer.isDebug = true
--print( Runtime:addEventListener( "enterFrame", composer.printMemUsage ))

--скрытие статус бара 
display.setStatusBar( display.HiddenStatusBar )

--переход на главную сцену
composer.gotoScene( "pages.homePage" )
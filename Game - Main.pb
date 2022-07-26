; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Project Name : OpenGL 3D Game Tutorial
; File name : Game - Main.pb
; File Version : 1.0.0
; Programming : OK
; Programmed by : Guillaume Saumure
; AKA : StarBootics
; Email : gsaumure@cgocable.ca
; Date : May 21st, 2021
; Mise à jour : July 25th, 2022
; Coded for PureBasic : V6.00 LTS
; Platform : Windows, Linux, MacOS
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; The MIT License (MIT)
; 
; Copyright (c) 2022 Guillaume Saumure
; 
; Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
; associated documentation files (the "Software"), to deal in the Software without restriction, including 
; without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
; copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the 
; following conditions:
; 
; The above copyright notice and this permission notice shall be included in all copies or substantial 
; portions of the Software.
; 
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT 
; LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
; EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
; IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR 
; THE USE OR OTHER DEALINGS IN THE SOFTWARE.
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Programming Notes
;
; 1. You need to install some libraries such as GLFW and GLEW
;    
;    Under Debian 11 with root privilages :
;    apt install libglfw3-dev 
;    apt install libglew-dev
;    After that you should be ready to go !
;
;    Under Windows (You are on your own !) :
;    Go to https://www.glfw.org/download.html and choose between 64-bit or the 32-bit binaries
;    Use the most up to date version -> lib-vc2022/glfw3dll.lib
;    Then modify the constant "#LIB_GLFW_FILE_NAME" in the file "GLFW Import - Module.pbi" <-> Line 388
;
;    You have to download the glew binaries :
;    Go to http://glew.sourceforge.net/ and click on Windows 32-bit and 64-bit
;    The archive contain binaries for Win32 and x64 once again choose between x86 or x86_64 lib but make sure 
;    you take the "glew32s.lib" in both cases. (To be validated)
;    Then modifiy the constant "#LIB_GLEW_FILE_NAME" in the file "GLEW Import - Module.pbi" <-> Line 797
;
;    Under MacOS (You are on your own !) :
;    About GLFW : Go to https://www.glfw.org/download.html download and install the binaries
;    Then modify the constant "#LIB_GLFW_FILE_NAME" in the file "GLFW Import - Module.pbi" <-> Line 394
;    
;    About GLEW : ?????????
;    Then modifiy the constant "#LIB_GLEW_FILE_NAME" in the file "GLEW Import - Module.pbi" <-> Line 803
;
; 2. If everything goes as planned you should end up with a window with a RED screen. You can Toggle between
;    WindowedScreen mode and FullScreen mode by pressing "F1" key, Press "Esc" key to close the program.
;    
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

IncludeFile "Source/Import/GLFW Import - Module.pbi"
IncludeFile "Source/Import/GLEW Import - Module.pbi"

IncludeFile "Source/Utils/ErrorLog.pbi"
IncludeFile "Source/Utils/CustomPrefs.pbi"
IncludeFile "Source/Utils/Language.pbi"

IncludeFile "Source/CallBackSystem/CallBackSystem.pbi"
IncludeFile "Source/Game/GameFolderSystem.pbi"

IncludeFile "Source/Screen/Screen.pbi"

IncludeFile "Source/Game/Game.pbi"

MyGame.Game::Game = Game::New()

MyGame\Load()
MyGame\Run()
MyGame\Free()

; <<<<<<<<<<<<<<<<<<<<<<<
; <<<<< END OF FILE <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<
; IDE Options = PureBasic 6.00 LTS (Linux - x64)
; Optimizer
; EnableXP
; DisableDebugger
; CompileSourceDirectory
; Compiler = PureBasic 6.00 LTS - C Backend (Linux - x64)
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; AUTOMATICALLY GENERATED CODE, DO NOT MODIFY
; UNLESS YOU REALLY, REALLY, REALLY MEAN IT !!
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; Code generated by : Dev-Object - V2.0.0 Beta 7
; Project name : OpenGL 3D Game Tutorial
; File name : Screen.pbi
; File Version : 0.0.1
; Programmation : In progress
; Programmed by : Guillaume Saumure
; AKA : StarBootics
; E-mail : gsaumure@cgocable.ca
; Creation Date : July 20th, 2022
; Last update : July 23rd, 2022
; Coded for PureBasic : V6.00 LTS
; Platform : Windows, Linux, MacOS X
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

DeclareModule Screen
  
  Interface Screen
    
    GetTitle.s()
    GetPosX.l()
    GetPosY.l()
    GetWidth.l()
    GetHeight.l()
    GetCurrentMode.i()
    GetPreferedMonitor.l()
    GetWindow.i()
    GetRefreshRate.l()
    GetFrameTime.d()
    GetTime.d()
    SetPosX(PosX.l)
    SetPosY(PosY.l)
    SetWidth(Width.l)
    SetHeight(Height.l)
    SetCurrentMode(CurrentMode.i)
    SetPreferedMonitor(PreferedMonitor.l)
    WindowShouldClose.i()
    PollEvents()
    MakeContextCurrent()
    SwapBuffers()
    ToggleCurrentMode(MonitorIndex.l = 0)
    Free()
    
  EndInterface
  
  Declare.i New(Title.s, PosX.l, PosY.l, Width.l, Height.l, CurrentMode.i, PreferedMonitor.l, GLMajor.l, GLMinor.l, *Language.Language::Language)
  
EndDeclareModule

Module Screen

  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< Structure declaration <<<<<
 
  Structure Private_Members
    
    VirtualTable.i
    Title.s
    PosX.l
    PosY.l
    Width.l
    Height.l
    CurrentMode.i
    PreferedMonitor.l
    *Window
    RefreshRate.l
    FrameTime.d
    
  EndStructure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< Helper Macro <<<<<
  
  Macro IsBetween(Value, Lower, Upper)
    
    ((Value) >= (Lower) And (Value) <= (Upper))
    
  EndMacro
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The observators <<<<<

  Procedure.s GetTitle(*This.Private_Members)
    
    ProcedureReturn *This\Title
  EndProcedure
  
  Procedure.l GetPosX(*This.Private_Members)
    
    ProcedureReturn *This\PosX
  EndProcedure
  
  Procedure.l GetPosY(*This.Private_Members)
    
    ProcedureReturn *This\PosY
  EndProcedure
  
  Procedure.l GetWidth(*This.Private_Members)
    
    ProcedureReturn *This\Width
  EndProcedure
  
  Procedure.l GetHeight(*This.Private_Members)
    
    ProcedureReturn *This\Height
  EndProcedure
  
  Procedure.i GetCurrentMode(*This.Private_Members)
    
    ProcedureReturn *This\CurrentMode
  EndProcedure
  
  Procedure.l GetPreferedMonitor(*This.Private_Members)
    
    ProcedureReturn *This\PreferedMonitor
  EndProcedure
  
  Procedure.i GetWindow(*This.Private_Members)
    
    ProcedureReturn *This\Window
  EndProcedure
  
  Procedure.l GetRefreshRate(*This.Private_Members)
    
    ProcedureReturn *This\RefreshRate
  EndProcedure
  
  Procedure.d GetFrameTime(*This.Private_Members)
    
    ProcedureReturn *This\FrameTime
  EndProcedure
  
  Procedure.d GetTime(*This.Private_Members)
    
    ProcedureReturn GLFW::glfwGetTime()
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The mutators <<<<<

  Procedure SetPosX(*This.Private_Members, PosX.l)
    
    *This\PosX = PosX
    
  EndProcedure
  
  Procedure SetPosY(*This.Private_Members, PosY.l)
    
    *This\PosY = PosY
    
  EndProcedure
  
  Procedure SetWidth(*This.Private_Members, Width.l)
    
    *This\Width = Width
    
  EndProcedure
  
  Procedure SetHeight(*This.Private_Members, Height.l)
    
    *This\Height = Height
    
  EndProcedure
  
  Procedure SetCurrentMode(*This.Private_Members, CurrentMode.i)
    
    *This\CurrentMode = CurrentMode
    
    If *This\CurrentMode = 1
      
      *Monitors = GLFW::glfwGetMonitors(@Count.l)
      
      If IsBetween(*This\PreferedMonitor, 0, Count - 1)
        *Monitor = PeekI(*Monitors + (8 * *This\PreferedMonitor))
      Else
        *Monitor = PeekI(*Monitors)
      EndIf
      
      *VideoMode.GLFW::GLFWvidmode = GLFW::glfwGetVideoMode(*Monitor)
      
      GLFW::glfwSetWindowMonitor(*This\Window, *Monitor, 0, 0, *VideoMode\Width, *VideoMode\Height, *VideoMode\RefreshRate)
      
    Else
      
      GLFW::glfwSetWindowMonitor(*This\Window, #Null, *This\PosX, *This\PosY, *This\Width, *This\Height, 0)
      
    EndIf
    
  EndProcedure
  
  Procedure SetPreferedMonitor(*This.Private_Members, PreferedMonitor.l)
    
    *This\PreferedMonitor = PreferedMonitor
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The WindowShouldClose operator <<<<<
  
  Procedure.i WindowShouldClose(*This.Private_Members)
    
    ProcedureReturn GLFW::glfwWindowShouldClose(*This\Window)
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The PollEvents operator <<<<<
  
  Procedure PollEvents(*This.Private_Members)
    
    GLFW::glfwPollEvents()
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The MakeContextCurrent operator <<<<<
  
  Procedure MakeContextCurrent(*This.Private_Members)
    
    GLFW::glfwMakeContextCurrent(*This\Window)
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The SwapBuffers operator <<<<<
  
  Procedure SwapBuffers(*This.Private_Members)
   
    GLFW::glfwSwapBuffers(*This\Window)
    
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The GoFullScreen operator <<<<<
  
  Procedure ToggleCurrentMode(*This.Private_Members)
    
    *This\CurrentMode = *This\CurrentMode ! 1
    
    If *This\CurrentMode = 1
      
      *Monitors = GLFW::glfwGetMonitors(@Count.l)
      
      If IsBetween(*This\PreferedMonitor, 0, Count - 1)
        *Monitor = PeekI(*Monitors + (8 * *This\PreferedMonitor))
      Else
        *Monitor = PeekI(*Monitors)
      EndIf
      
      *VideoMode.GLFW::GLFWvidmode = GLFW::glfwGetVideoMode(*Monitor)
      
      GLFW::glfwSetWindowMonitor(*This\Window, *Monitor, 0, 0, *VideoMode\Width, *VideoMode\Height, *VideoMode\RefreshRate)
      
    Else
      
      GLFW::glfwSetWindowMonitor(*This\Window, #Null, *This\PosX, *This\PosY, *This\Width, *This\Height, 0)
      
    EndIf
    
  EndProcedure

  ; <<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Destructor <<<<<

  Procedure Free(*This.Private_Members)
    
    GLFW::glfwTerminate()
    FreeStructure(*This)
    
  EndProcedure

  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Constructor <<<<<

  Procedure.i New(Title.s, PosX.l, PosY.l, Width.l, Height.l, CurrentMode.i, PreferedMonitor.l, GLMajor.l, GLMinor.l, *Language.Language::Language)
    
    *This.Private_Members = AllocateStructure(Private_Members)
    *This\VirtualTable = ?START_METHODS
    
    *This\Title = *Language\Message(Title)
    
    *This\PosY = PosY
    *This\Width = Width
    *This\Height = Height
    *This\CurrentMode = CurrentMode
    *This\PreferedMonitor = PreferedMonitor
    
    If GLFW::glfwInit() <> GLFW::#GLFW_TRUE
      
      CompilerIf #PB_Compiler_Debugger
        DebuggerError("GLFW::glfwInit() Failure !")
      CompilerElse
        MessageRequester(*Language\Message("Fatal Error"), *Language\Message("GLFW::glfwInit() : Failure !"))
      CompilerEndIf
      
      End -1
      
    EndIf
    
    GLFW::glfwWindowHint(GLFW::#GLFW_CONTEXT_VERSION_MAJOR, GLMajor)
    GLFW::glfwWindowHint(GLFW::#GLFW_CONTEXT_VERSION_MINOR, GLMinor)
    GLFW::glfwWindowHint(GLFW::#GLFW_OPENGL_PROFILE, GLFW::#GLFW_OPENGL_CORE_PROFILE)
    GLFW::glfwWindowHint(GLFW::#GLFW_OPENGL_FORWARD_COMPAT, GLFW::#GLFW_TRUE)
    GLFW::glfwWindowHint(GLFW::#GLFW_RED_BITS, 8)
    GLFW::glfwWindowHint(GLFW::#GLFW_GREEN_BITS, 8)
    GLFW::glfwWindowHint(GLFW::#GLFW_BLUE_BITS, 8)
    GLFW::glfwWindowHint(GLFW::#GLFW_ALPHA_BITS, 8)
    GLFW::glfwWindowHint(GLFW::#GLFW_DEPTH_BITS, 24)
    
    GLFW::glfwWindowHint(GLFW::#GLFW_DOUBLEBUFFER, GLFW::#GLFW_TRUE)
    
    *Monitors = GLFW::glfwGetMonitors(@Count.l)

    If IsBetween(*This\PreferedMonitor, 0, Count - 1)
      *Monitor = PeekI(*Monitors + (8 * *This\PreferedMonitor))
    Else
      *Monitor = PeekI(*Monitors)
    EndIf
    
    GLFW::glfwGetMonitorWorkarea(*Monitor, @OffsetX.l, @PosY.l, @Width.l, @Height.l)
    
    *This\PosX = PosX + OffsetX
    
    *VideoMode.GLFW::GLFWvidmode = GLFW::glfwGetVideoMode(*Monitor)
    
    If *This\CurrentMode = 0
      *Monitor = #Null
    EndIf
    
    *This\Window = GLFW::glfwCreateWindow(*This\Width, *This\Height, *This\Title, *Monitor, #Null)
    
    If *This\Window = #Null
      
      CompilerIf #PB_Compiler_Debugger
        DebuggerError("GLFW::glfwCreateWindow() Failure !")
      CompilerElse
        MessageRequester(*Language\Message("Fatal Error"), *Language\Message("GLFW::glfwCreateWindow() : Failure !"))
      CompilerEndIf
      
      GLFW::glfwTerminate()
      End -1
      
    EndIf
    
    If *This\CurrentMode = 0
      GLFW::glfwSetWindowPos(*This\Window, *This\PosX, *This\PosY)
    EndIf
    
    GLFW::glfwMakeContextCurrent(*This\Window)
    
    If GLEW::glewInit() <> GLEW::#GLEW_OK
      
      CompilerIf #PB_Compiler_Debugger
        DebuggerError("GLEW::glewInit() Failure !")
      CompilerElse
        MessageRequester(*Language\Message("Fatal Error"), *Language\Message("GLEW::glewInit() : Failure !"))
      CompilerEndIf
      
      GLFW::glfwTerminate()
      End -1
      
    EndIf

    GLFW::glfwSwapInterval(1)
    
    *This\RefreshRate = *VideoMode\RefreshRate
    *This\FrameTime = 1.0 / *This\RefreshRate
    
    ProcedureReturn *This
  EndProcedure
  
  ; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ; <<<<< The Virtual Table Entries <<<<<

  DataSection
    START_METHODS:
    Data.i @GetTitle()
    Data.i @GetPosX()
    Data.i @GetPosY()
    Data.i @GetWidth()
    Data.i @GetHeight()
    Data.i @GetCurrentMode()
    Data.i @GetPreferedMonitor()
    Data.i @GetWindow()
    Data.i @GetRefreshRate()
    Data.i @GetFrameTime()
    Data.i @GetTime()
    Data.i @SetPosX()
    Data.i @SetPosY()
    Data.i @SetWidth()
    Data.i @SetHeight()
    Data.i @SetCurrentMode()
    Data.i @SetPreferedMonitor()
    Data.i @WindowShouldClose()
    Data.i @PollEvents()
    Data.i @MakeContextCurrent()
    Data.i @SwapBuffers()
    Data.i @ToggleCurrentMode()
    Data.i @Free()
    END_METHODS:
  EndDataSection
  
EndModule

; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; <<<<< Code generated in : 00.001 seconds (152000.00 lines/second) <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

; <<<<<<<<<<<<<<<<<<<<<<<
; <<<<< END OF FILE <<<<<
; <<<<<<<<<<<<<<<<<<<<<<<
; IDE Options = PureBasic 6.00 LTS (Linux - x64)
; Folding = ------
; EnableXP
; CompileSourceDirectory
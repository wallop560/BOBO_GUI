local OldNC OldNC = hookfunction(getrawmetatable(game).__namecall,function(self,...)
	local args = {...}
	
	local namecall = getnamecallmethod()

    if namecall == 'Kick' then
        return warn('Kick Attempted lol')
    end

    return OldNC(self,...)
end)

local ReplicatedStorage = game:GetService('ReplicatedStorage')

local DeleteFunction
local function FindRemote(RemoteName,Service) Service = Service or game for _,Remote in pairs(Service:GetDescendants()) do if Remote.Name == RemoteName and (Remote:IsA('RemoteEvent') or Remote:IsA('RemoteFunction')) then return Remote end end end
local function FindDecendant(Name,Parent,ClassName) Parent = Parent or workspace for _,Part in pairs(Parent:GetDescendants()) do if Part.Name == Name and Part:IsA(ClassName or Part.ClassName) then return Part end end end
local SelectedPlayers = {game.Players.LocalPlayer}

if game.PlaceId == 7720943627 or game.PlaceId == 6816975827 or game.PlaceId == 6865382813 then
	local DeleteCar = FindRemote('DeleteCar')
	DeleteFunction = function(Thing)
		DeleteCar:FireServer(Thing)
	end
end
if FindRemote('DestroySegway') then
    DeleteFunction = function(Thing)
        local Remote = FindRemote('DestroySegway')
        if not Remote then
            return warn('No Segway was found!')
        end
        Remote:FireServer(SelectedPlayers[1].Character,{Value = Thing})
    end
end



if not DeleteFunction then
    return warn('No Vun Detected. BOBO GUI will not run.')
end

local OldNC OldNC = hookfunction(getrawmetatable(game).__namecall,function(self,...)
	local args = {...}
	
	local namecall = getnamecallmethod()
	
	if namecall == 'Destroy' then
		if args[1] == true then
			return pcall(DeleteFunction,self)
		end
    elseif namecall == 'Kick' then
        return warn('Kick Attempted by'..d)
	end
	
	return OldNC(self,...)
end)

function Create(Class: string,Properties: {any},Children: {Instance}): Instance
	Class = Class or 'Frame'
	Properties = Properties or {}
	Children = Children or {}

	local instance = Instance.new(Class)

	for Property,value in next,Properties do
		instance[Property] = value
	end
	for _,Child in next,Children do
		Child.Parent = instance
	end
	return instance
end
--                         //  Created By I2L  \\
--                         ¦¦Plugin by consuary¦¦
--                         \\  le birdo#2221   //
local GUI = Create(
	"ScreenGui",{
		Name = "BOBOGUI",
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	},{
		Create(
			"Frame",{
				AnchorPoint = Vector2.new(.5,.5),
				BorderColor3 = Color3.new(0, 0, 0),
				Position = UDim2.new(.5,0,.5,0),
				Name = "Body",
				BorderColor = BrickColor.new('Really black'),
				Size = UDim2.new(0, 300, 0, 400),
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.new(1, 1, 1)
			},{
				Create(
					"UICorner",{
						CornerRadius = UDim.new(0, 10)
					}
				),
				Create(
					"UIStroke",{
						Thickness = 3,
						Transparency = 0.5
					}
				),
				Create(
					"TextLabel",{
						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal),
						BorderColor = BrickColor.new('Really black'),
						TextSize = 20,
						Size = UDim2.new(1, 0, 0, 50),
						TextColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						Text = "BOBO GUI",
						Name = "Title",
						FontSize = Enum.FontSize.Size24,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						BackgroundColor3 = Color3.new(1, 1, 1)
					}
				),
				Create(
					"UIGradient",{
						Color = ColorSequence.new{[1]=ColorSequenceKeypoint.new(0,Color3.new(0, 0, 0)),[2]=ColorSequenceKeypoint.new(0.10000000149011612,Color3.new(0.0784314, 0.0784314, 0.0784314)),[3]=ColorSequenceKeypoint.new(0.10999999940395355,Color3.new(1, 1, 1)),[4]=ColorSequenceKeypoint.new(0.11999999731779099,Color3.new(0.0784314, 0.0784314, 0.0784314)),[5]=ColorSequenceKeypoint.new(0.8299999833106995,Color3.new(0.176471, 0.176471, 0.176471)),[6]=ColorSequenceKeypoint.new(0.8399999737739563,Color3.new(1, 1, 1)),[7]=ColorSequenceKeypoint.new(0.8500000238418579,Color3.new(0.0784314, 0.0784314, 0.0784314)),[8]=ColorSequenceKeypoint.new(1,Color3.new(0.0784314, 0.0784314, 0.0784314))},
						Rotation = 90
					}
				),
				Create(
					"Frame",{
						BorderColor3 = Color3.new(0, 0, 0),
						Name = "Content",
						Size = UDim2.new(1, 0, 1, -50),
						AnchorPoint = Vector2.new(0, 1),
						BackgroundTransparency = 1,
						BorderColor = BrickColor.new('Really black'),
						Position = UDim2.new(0, 0, 1, 0),
						BorderSizePixel = 0,
						BackgroundColor3 = Color3.new(1, 1, 1)
					},{
						Create(
							"Frame",{
								BorderColor3 = Color3.new(0, 0, 0),
								Size = UDim2.new(0, 200, 0, 50),
								AnchorPoint = Vector2.new(0.5, 1),
								Name = "PlayerBoxFrame",
								BorderColor = BrickColor.new('Really black'),
								Position = UDim2.new(0.5, 0, 1, -5),
								BorderSizePixel = 0,
								BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
							},{
								Create(
									"UICorner",{
										CornerRadius = UDim.new(0, 10)
									}
								),
								Create(
									"TextBox",{
										FontSize = Enum.FontSize.Size24,
										AnchorPoint = Vector2.new(0.5, 0.5),
										PlaceholderColor3 = Color3.new(0.588235, 0.588235, 0.588235),
										PlaceholderText = "Player",
										TextSize = 20,
										Size = UDim2.new(1, -6, 1, -6),
										TextColor3 = Color3.new(0.901961, 0.901961, 0.901961),
										BorderColor3 = Color3.new(0, 0, 0),
										Text = "",
										FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal),
										BorderSizePixel = 0,
										Name = "PlayerBox",
										Position = UDim2.new(0.5, 0, 0.5, 0),
										BorderColor = BrickColor.new('Really black'),
										BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
									},{
										Create(
											"UICorner",{
												CornerRadius = UDim.new(0, 10)
											}
										)
									}
								)
							}
						),
						Create(
							"ScrollingFrame",{
								BorderColor3 = Color3.new(0, 0, 0),
								Name = "ButtonsContent",
								BackgroundTransparency = 1,
								BorderColor = BrickColor.new('Really black'),
								Size = UDim2.new(1, 0, 1, -70),
								BorderSizePixel = 0,
								BackgroundColor3 = Color3.new(1, 1, 1),
								CanvasSize = UDim2.new(0,0,0,0),
								AutomaticCanvasSize = Enum.AutomaticSize.Y,
								ScrollBarThickness = 1,
							},{
								Create(
									"UIGridLayout",{
										SortOrder = Enum.SortOrder.LayoutOrder,
										HorizontalAlignment = Enum.HorizontalAlignment.Center,
										CellSize = UDim2.new(0.5, -5, 0, 50)
									}
								)
							}
						)
					}
				)
			}
		)
	}
)
local function CreateButton(Name,Callback)
	local ButtonTemplate = Create(
		"TextButton",{
			Name = Name,
			FontSize = Enum.FontSize.Size24,
			BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647),
			TextColor3 = Color3.new(0.784314, 0.784314, 0.784314),
			BorderColor3 = Color3.new(0, 0, 0),
			Text = Name,
			Size = UDim2.new(0, 200, 0, 50),
			BorderSizePixel = 0,
			BorderColor = BrickColor.new('Really black'),
			FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal),
			TextSize = 20
		},{
			Create("UICorner"),
			Create(
				"UIStroke",{
					Color = Color3.new(0.0980392, 0.0980392, 0.0980392),
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Thickness = 2
				}
			)
		}
	)
	ButtonTemplate.Parent = GUI.Body.Content.ButtonsContent
	ButtonTemplate.MouseButton1Click:Connect(Callback or function()end)
	return ButtonTemplate
end
if game.CoreGui:FindFirstChild('BOBOGUI') then
	game.CoreGui.BOBOGUI:Destroy()
end
GUI.Parent = game.CoreGui

local Players = game:GetService('Players')

local UIS = game:GetService('UserInputService')
local TS = game:GetService('TweenService')
local function Dragify(Body,Handle)
	Handle = Handle or Body
	
	local Changed 
	
	Handle.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			local CurrentCamera = workspace.CurrentCamera
			local Position = UDim2.fromScale((Body.AbsolutePosition.X+Body.Size.X.Offset/2)/CurrentCamera.ViewportSize.X,(Body.AbsolutePosition.Y+Body.Size.Y.Offset/2)/(CurrentCamera.ViewportSize.Y-36))
			local MousePos = UDim2.fromScale(Input.Position.X/CurrentCamera.ViewportSize.X,(Input.Position.Y)/(CurrentCamera.ViewportSize.Y-36))
			
			local Grip = MousePos-Position
			Changed = UIS.InputChanged:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseMovement then
					MousePos = UDim2.fromScale(Input.Position.X/CurrentCamera.ViewportSize.X,Input.Position.Y/(CurrentCamera.ViewportSize.Y-36))
					
					TS:Create(Body,TweenInfo.new(.1,Enum.EasingStyle.Linear,Enum.EasingDirection.In),{Position = MousePos-Grip}):Play()
				end
			end)
		end
	end)
	Handle.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Changed:Disconnect()
		end
	end)
end
Dragify(GUI.Body,GUI.Body.Title,.1)

GUI.Body.Content.PlayerBoxFrame.PlayerBox.FocusLost:Connect(function()
	local Text = GUI.Body.Content.PlayerBoxFrame.PlayerBox.Text:lower()
	if Text == 'me' then
		SelectedPlayers = {Players.LocalPlayer}
		return 
	elseif Text == 'all' then
		SelectedPlayers =  Players:GetPlayers()
		return 
	elseif Text == 'others' then
		local PlayersTable = Players:GetPlayers()
		table.remove(PlayersTable,table.find(PlayersTable,Players.LocalPlayer))
		SelectedPlayers =  PlayersTable
		return 
	end
	
	for _,Player in pairs(Players:GetPlayers()) do
		if Player.Name:lower():sub(1,#Text) == Text then
			GUI.Body.Content.PlayerBoxFrame.PlayerBox.Text = Player.Name
			SelectedPlayers = {Player}
		end
	end
end)

local SpectateSpawnConnection
local SpectateLeaveConnection

local Banned = {}
Players.PlayerAdded:Connect(function(Player) 
	if table.find(Banned,Player.UserId) then
		Player:Destroy(true)
	end
end)

CreateButton('Spectate',function()
	local Player = SelectedPlayers[1]
	
	SpectateSpawnConnection = SpectateSpawnConnection and SpectateSpawnConnection:Disconnect() or Player.CharacterAdded:Connect(function(Character)
		local Humanoid = Character:WaitForChild('Humanoid',3)
		
		workspace.CurrentCamera.CameraSubject = Humanoid
	end)
	SpectateLeaveConnection = SpectateLeaveConnection and SpectateLeaveConnection:Disconnect() or Players.PlayerRemoving:Connect(function(LeavingPlayer)
		if LeavingPlayer == Player then
			workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild('Humanoid')
			SpectateSpawnConnection:Disconnect()
			SpectateSpawnConnection = nil
			SpectateLeaveConnection:Disconnect()
			SpectateLeaveConnection = nil
		end
	end)
	
	workspace.CurrentCamera.CameraSubject = Player.Character and Player.Character:FindFirstChild('Humanoid')
end)
CreateButton('UnSpectate',function()
	workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild('Humanoid')
	SpectateSpawnConnection:Disconnect()
	SpectateSpawnConnection = nil
	SpectateLeaveConnection:Disconnect()
	SpectateLeaveConnection = nil
end)
CreateButton('Kill',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character then
			local Neck = FindDecendant('Neck',Player.Character)
			if Neck then
				Neck:Destroy(true)
			end
		end
	end
end)
CreateButton('Ragdoll',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character then
			local HumanoidRootPart = FindDecendant('HumanoidRootPart',Player.Character)
			if HumanoidRootPart then
				HumanoidRootPart:Destroy(true)
			end
		end
	end
end)
CreateButton('DeleteHumanoid',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character then
			local Humanoid = FindDecendant('Humanoid',Player.Character)
			if Humanoid then
				Humanoid:Destroy(true)
			end
		end
	end
end)
CreateButton('StealTool',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character then
			local Tool = Player.Character:FindFirstChildOfClass('Tool')
			local Handle = Tool and Tool:FindFirstChild('Handle')
			local Humanoid = FindDecendant('Humanoid',Player.Character)
			local LocalHumanoid = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild('Humanoid',3)
			if Handle then
				Humanoid:Destroy(true)
				repeat wait() until Humanoid.Parent == nil
				LocalHumanoid:EquipTool(Tool)
				--repeat firetouchinterest(Handle,Players.LocalPlayer.Character.PrimaryPart,1) wait() firetouchinterest(Handle,Players.LocalPlayer.Character.PrimaryPart,0) wait() until Tool.Parent == Players.LocalPlayer.Character
			end
		end
	end
end)
CreateButton('Kick',function()
	for _,Player in pairs(SelectedPlayers) do
		Player:Destroy(true)
	end
end)
CreateButton('Ban',function()
	for _,Player in pairs(SelectedPlayers) do
		table.insert(Banned,Player.UserId)
		Player:Destroy(true)
	end
end)
CreateButton('Btools',function()
	local Tool = Instance.new('Tool',Players.LocalPlayer.Backpack)
	Tool.Name = 'Delete'
	Tool.TextureId = 'rbxassetid://29402763'
	local MouseMove
	local Highlight = Instance.new('Highlight',GUI)
	local Target
	local TargetPos
	
	Highlight.Enabled = true
	Highlight.OutlineColor = Color3.new(1,.1,.1)
	Highlight.FillColor = Color3.new(1,.3,.3)
	Highlight.FillTransparency = .7
	Highlight.OutlineTransparency = 0
	Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
	
	Tool.RequiresHandle = false
	
	Tool.Equipped:Connect(function(Mouse)
	    MouseMove = game:GetService('UserInputService').InputChanged:Connect(function()
	        if game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.LeftShift) then
	            Target = Mouse.Target and Mouse.Target.Parent
	            TargetPos = Mouse.Target.Position
	        else
	            Target = Mouse.Target
	            TargetPos = Target.Position
	        end
	        Highlight.Adornee = Target
	    end)
	end)
	Tool.Unequipped:Connect(function()
	    MouseMove:Disconnect()
	    Highlight.Adornee = nil
	end)
	Tool.Activated:Connect(function()
	    local Explosion = Instance.new('Explosion',workspace)
	    
	    Explosion.Position = TargetPos
	    Explosion.Visible = true
	    Explosion.BlastPressure = 0
	    Explosion.BlastRadius = 0
	    Explosion.DestroyJointRadiusPercent = 0 
	    Target:Destroy(true)
	end)
end)
local HasDex = false
CreateButton('Dex/Explorer',function()
	if HasDex then return end
	HasDex = true
	loadstring(game:HttpGet('https://raw.githubusercontent.com/wallop560/BOBO_GUI/main/dex.lua'))()
end)
CreateButton('BreakJoints',function()
	for _,Player in pairs(SelectedPlayers) do
		if not Player.Character then continue end
		for _,Joint in pairs(Player.Character:GetDescendants()) do
			if Joint:IsA('Motor6D') then
				Joint:Destroy(true)
			end
		end
	end
end)
CreateButton('Goto',function()
	local Player = SelectedPlayers[1] 
	
	if Player.Character then
		((Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart',2)).CFrame = Player.Character.PrimaryPart.CFrame
	end
end)
CreateButton('Naked',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character then
			for _,Clothing in pairs(Player.Character:GetChildren()) do
				if Clothing:IsA('Clothing') or Clothing:IsA('ShirtGraphic') then
					Clothing:Destroy(true)
				end
			end
		end
	end
end)
CreateButton('NoFace',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character and Player.Character:FindFirstChild('Head') then
			Player.Character.Head:FindFirstChildOfClass('Decal'):Destroy(true)
		end
	end
end)
CreateButton('BrickHead (R6)',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character and Player.Character:FindFirstChild('Head') then
			Player.Character.Head:FindFirstChildOfClass('SpecialMesh'):Destroy(true)
		end
	end
end)
CreateButton('No Hats',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character then
			for _,Hat in pairs(Player.Character:GetChildren()) do
				if Hat:IsA('Accessory') then
					Hat:Destroy(true)
				end
			end
		end
	end
end)
CreateButton('Creeper',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character then
			if Player.Character:FindFirstChild('LowerTorso') then
				Player.Character.LeftUpperArm:Destroy(true)
				Player.Character.RightUpperArm:Destroy(true)
				
				Player.Character.LeftLowerArm:Destroy(true)
				Player.Character.LeftHand:Destroy(true)
				Player.Character.RightLowerArm:Destroy(true)
				Player.Character.RightHand:Destroy(true)
			else
				Player.Character['Left Arm']:Destroy(true)
				Player.Character['Right Arm']:Destroy(true)
			end
		end
	end
end)
CreateButton('NoLimbs',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character then
			if Player.Character:FindFirstChild('LowerTorso') then
				Player.Character.LeftUpperArm:Destroy(true)
				Player.Character.RightUpperArm:Destroy(true)
				
				Player.Character.LeftUpperLeg:Destroy(true)
				Player.Character.RightUpperLeg:Destroy(true)
			else
				Player.Character['Left Arm']:Destroy(true)
				Player.Character['Right Arm']:Destroy(true)
				Player.Character['Left Leg']:Destroy(true)
				Player.Character['Right Leg']:Destroy(true)
			end
		end
	end
end)
CreateButton('Freeze Pose',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character then
			Player.Character.Humanoid:FindFirstChildOfClass("Animator"):Destroy(true)
		end
	end
end)
CreateButton('Punish',function()
	for _,Player in pairs(SelectedPlayers) do
		if Player.Character then
			Player.Character:Destroy(true)
		end
	end
end)

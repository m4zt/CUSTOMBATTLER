		local player = game:GetService("Players").LocalPlayer
		local character = player.Character

		local UserInputService = game:GetService("UserInputService")
		local Debris = game:GetService("Debris")

		
		local cam = workspace.CurrentCamera
		local camlookingat = character:FindFirstChild("SmoothCam")
		local parrydebounce = true

		local blacklistedparts = {"Sombrero", "StageProp", "Scarf01"}

		local characters = {
			["m4zt"] = function(char)
				local assetsettings = {
					charactersettings = {
						bodycolors = {
							["Left Arm"] = Color3.fromRGB(253, 234, 141),
							["Right Arm"] = Color3.fromRGB(253, 234, 141),
							["Head"] = Color3.fromRGB(253, 234, 141),
							["Torso"] = Color3.fromRGB(75, 109, 221),
							["Left Leg"] = Color3.fromRGB(27, 42, 53),
							["Right Leg"] = Color3.fromRGB(27, 42, 53)
						},
						accessories = {
							["DarkBlueLightHair"] = {"StripedHat", "rbxassetid://96677572", "rbxassetid://96677535"},
							hoodie = {"Hoodie", "rbxassetid://4179850886", "http://www.roblox.com/asset/?id=4186862308"},
						},				
						faceid = "http://www.roblox.com/asset/?id=7131857",
						shirtid = "http://www.roblox.com/asset/?id=14293626901",		
					},
					attacksettings = {
						attackcolors = {
							["skate"] = {
								["Trail"] = function(inst)
									local success = pcall(function() 
										inst.Lifetime = 0.3
										inst.LightEmission = 0
										inst.Transparency = NumberSequence.new(0)
									end)
									if success then                             
										inst.Lifetime = 0.3
										inst.LightEmission = 0
										inst.Transparency = NumberSequence.new(0)
									end	
									inst.Color = ColorSequence.new(Color3.fromRGB(27, 42, 53), Color3.fromRGB(27, 42, 53))
									inst.Texture = ""						                          						
								end,
								["Particles"] = function(inst)
									inst.Slash.LightEmission = 0
									inst.Slash.Color = ColorSequence.new(Color3.fromRGB(170, 255, 255), Color3.fromRGB(170, 255, 255))
									inst.Dash.Color = ColorSequence.new(Color3.fromRGB(200, 255, 255), Color3.fromRGB(200, 255, 255))
								end,
							},
							["swordmodel"] = {
								["Trail"] = function(inst)
									inst.Color = ColorSequence.new(Color3.fromRGB(0, 167, 216), Color3.fromRGB(0, 56, 168))
								end,
							},
							["Torso"] = {
								["Trail"] = function(inst)
									inst.Color = ColorSequence.new(Color3.fromRGB(75, 109, 221), Color3.fromRGB(75, 109, 221))
									inst.LightEmission = .2
								end,
								["FastTrail"] = function(inst)
									inst.Color = ColorSequence.new(Color3.fromRGB(75, 109, 221), Color3.fromRGB(75, 109, 221))
								end,
								
								["Particles"] = function(inst)		
									local particle1 = inst.ParryParticle
									local particle2 = inst.ParryParticle1
									local particle3 = inst.ParryParticle2
									
									local normblockparticle1 = inst.BlockParticle
									local normblockparticle2 = inst.BlockParticle1
									
									local blockbreakparticle1 = inst.BlockBreak
									local blockbreakparticle2 = inst.BlockBreak1
									local blockbreakparticle3 = inst.BlockBreak2							
									
									inst.LightHit.Color = ColorSequence.new(Color3.fromRGB(147,221,255), Color3.fromRGB(147,221,255))
									inst.LightHit1.Color = ColorSequence.new(Color3.fromRGB(200,255,255), Color3.fromRGB(200,255,255))
									inst.HeavyHit.Color = ColorSequence.new(Color3.fromRGB(0,170,255), Color3.fromRGB(0,170,255))
									inst.HeavyHit1.Color = ColorSequence.new(Color3.fromRGB(0,170,255), Color3.fromRGB(0,170,255))
									
									normblockparticle1.Texture = "rbxassetid://483229625"
									normblockparticle1.Color = ColorSequence.new(Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
									normblockparticle2.Texture = "rbxassetid://1141830599"
									normblockparticle2.Color = ColorSequence.new(Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
									normblockparticle2.Size = NumberSequence.new{
										NumberSequenceKeypoint.new(0,0),
										NumberSequenceKeypoint.new(.1,10),
										NumberSequenceKeypoint.new(.57,0),
										NumberSequenceKeypoint.new(1,0),
									} 	

									blockbreakparticle1.Texture = "rbxassetid://878492795"
									blockbreakparticle1.Color = ColorSequence.new(Color3.fromRGB(0,170,255), Color3.fromRGB(0,170,255))
									blockbreakparticle2.Texture = "rbxassetid://878492795"
									blockbreakparticle2.Color = ColorSequence.new(Color3.fromRGB(0,170,255), Color3.fromRGB(0,170,255))
									blockbreakparticle3.Texture = "rbxassetid://878492795"
									blockbreakparticle3.Color = ColorSequence.new(Color3.fromRGB(0,170,255), Color3.fromRGB(0,170,255))
									
									particle1.Brightness = 10
									particle1.Color = ColorSequence.new{
										ColorSequenceKeypoint.new(0,Color3.fromRGB(0,85,255)), 
										ColorSequenceKeypoint.new(.393,Color3.fromRGB(0,170,255)), 
										ColorSequenceKeypoint.new(.5,Color3.fromRGB(255,255,255)), 
										ColorSequenceKeypoint.new(.646,Color3.fromRGB(0,170,255)), 
										ColorSequenceKeypoint.new(1,Color3.fromRGB(0,85,255))
									}
									particle1.LightEmission = 2
									particle1.LightInfluence = 0
									particle1.Size = NumberSequence.new{
										NumberSequenceKeypoint.new(0,7,.251),
										NumberSequenceKeypoint.new(1,8.5,0),
									} 	
									particle1.Texture = "http://www.roblox.com/asset/?id=6246398215"
									particle1.Transparency = NumberSequence.new{
										NumberSequenceKeypoint.new(0,0),
										NumberSequenceKeypoint.new(0.5,1),
										NumberSequenceKeypoint.new(1,1),
									}							
									particle1.Enabled = true						
									particle1.Lifetime = NumberRange.new(.5)
									particle1.Rate = 0
									particle1.Rotation = NumberRange.new(0)
									particle1.RotSpeed = NumberRange.new(400)
									particle1.Speed = NumberRange.new(.5)
									particle1.SpreadAngle = Vector2.new(0,0)
									particle1.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
									particle1.VelocitySpread = 0
									particle1.ZOffset = 0
									particle1.LockedToPart = true  								

									particle2.Brightness = 1
									particle2.Color = ColorSequence.new(Color3.fromRGB(0,170,255), Color3.fromRGB(0,85,255))
									particle2.LightEmission = 1
									particle2.LightInfluence = 0
									particle2.Size = NumberSequence.new{
										NumberSequenceKeypoint.new(0,0),
										NumberSequenceKeypoint.new(0.4,0),
										NumberSequenceKeypoint.new(1,0),
									} 	
									particle2.Texture = "rbxassetid://214269134"
									particle2.Transparency = NumberSequence.new{
										NumberSequenceKeypoint.new(0,.9),
										NumberSequenceKeypoint.new(0.4,.8),
										NumberSequenceKeypoint.new(1,1),
									}							
									particle2.Enabled = true						
									particle2.Lifetime = NumberRange.new(.3)
									particle2.Rate = 0
									particle2.Rotation = NumberRange.new(0)
									particle2.RotSpeed = NumberRange.new(0)
									particle2.Speed = NumberRange.new(1)
									particle2.SpreadAngle = Vector2.new(0,360)
									particle2.ZOffset = 1
									particle2.LockedToPart = false 
		
									particle3.Brightness = normblockparticle2.Brightness 	
									particle3.Color = ColorSequence.new(Color3.fromRGB(0,170,255), Color3.fromRGB(0,85,255))
									particle3.LightEmission = normblockparticle2.LightEmission 	
									particle3.LightInfluence = normblockparticle2.LightInfluence 	
									particle3.Size = NumberSequence.new{
										NumberSequenceKeypoint.new(0,0),
										NumberSequenceKeypoint.new(.1,8),
										NumberSequenceKeypoint.new(.57,0),
										NumberSequenceKeypoint.new(1,0),
									} 	
									particle3.Texture = normblockparticle2.Texture
									particle3.Transparency = normblockparticle2.Transparency								
									particle3.Enabled = true						
									particle3.Lifetime = normblockparticle2.Lifetime 
									particle3.Rate = 0
									particle3.Rotation = normblockparticle2.Rotation 
									particle3.RotSpeed = normblockparticle2.RotSpeed 
									particle3.Speed = normblockparticle2.Speed 
									particle3.SpreadAngle = normblockparticle2.SpreadAngle 
									particle3.ZOffset = 2
									particle3.LockedToPart = true
								end,
							},
							["Left Arm"] = {
								["Flame"] = function(inst)
									inst.Color = ColorSequence.new(Color3.fromRGB(200, 50, 53), Color3.fromRGB(200, 50, 53))
									inst.LightEmission = .5
								end,
								["Glow"] = function(inst)
									inst.Color = ColorSequence.new(Color3.fromRGB(200, 50, 53), Color3.fromRGB(200, 50, 53))
									inst.LightEmission = .2
								end,
								["Punch"] = function(inst)
									inst.Swirl.Color = ColorSequence.new(Color3.fromRGB(200, 50, 53), Color3.fromRGB(200, 50, 53))
									inst.Swirl.LightEmission = .2
								end,
								["particle"] = function(inst)
									inst.flash.Color = ColorSequence.new(Color3.fromRGB(200, 50, 53), Color3.fromRGB(200, 50, 53))
									inst.flash.LightEmission = .8
								end,
								["Trail"] = function(inst)
									inst.Color = ColorSequence.new(Color3.fromRGB(200, 50, 53), Color3.fromRGB(200, 50, 53))
									inst.LightEmission = .2
								end,
							},
							["Left Leg"] = {
								["Punch"] = function(inst)
									inst.Swirl.Color = ColorSequence.new(Color3.fromRGB(200, 50, 53), Color3.fromRGB(200, 50, 53))
									inst.Swirl.LightEmission = .2
								end,
								["particle"] = function(inst)
									inst.flash.Color = ColorSequence.new(Color3.fromRGB(200, 50, 53), Color3.fromRGB(200, 50, 53))
									inst.flash.LightEmission = .8
								end,
							},
							["Head"] = {
								["ParryUI"] = function(inst)
									for i,part in pairs(inst.Parent.FaceCenterAttachment:GetChildren()) do
										if part:IsA("ParticleEmitter") then
											part:Destroy()
										end
									end

									inst.ImageLabel.Image = "rbxassetid://483229625"
									inst.ImageLabel.ImageColor3 = Color3.new(1,1,1)
									
									local function createCircleParticle()								
										local parrycircleparticle = Instance.new("ParticleEmitter")
										Debris:AddItem(parrycircleparticle, 1)
										parrycircleparticle.Parent = inst.Parent.FaceCenterAttachment
										parrycircleparticle.Enabled = true
										parrycircleparticle.Rate = 0
										parrycircleparticle.Lifetime = NumberRange.new(1)
										parrycircleparticle.Rotation = NumberRange.new(0)
										parrycircleparticle.RotSpeed = NumberRange.new(0)
										parrycircleparticle.Speed = NumberRange.new(0)
										parrycircleparticle.SpreadAngle = Vector2.new(0)
										parrycircleparticle.Texture = "rbxassetid://483229625"
										parrycircleparticle.Brightness = 1
										parrycircleparticle.Color = ColorSequence.new(Color3.fromRGB(255, 167, 168), Color3.fromRGB(68, 45, 45))
										parrycircleparticle.LightEmission = 0 --1
										parrycircleparticle.ZOffset = -3
										parrycircleparticle.LockedToPart = true 
										parrycircleparticle.Transparency = NumberSequence.new{
											NumberSequenceKeypoint.new(0,0.02),
											NumberSequenceKeypoint.new(0.3,1),
											NumberSequenceKeypoint.new(1,1),
										}
										parrycircleparticle.Size = NumberSequence.new{
											NumberSequenceKeypoint.new(0,((camlookingat.Position-cam.CFrame.Position).Magnitude)/9),
											NumberSequenceKeypoint.new(1,(((camlookingat.Position-cam.CFrame.Position).Magnitude)/9)+1),
										} 	
										parrycircleparticle:Emit(1)	
										return parrycircleparticle                                                         
									end

									inst:GetPropertyChangedSignal("Enabled"):Connect(function() 																
										if inst.Enabled == true then								                               						
											character.swordmodel.Transparency = 0							
										else  
											createCircleParticle()																										
											character.swordmodel.Transparency = 1
										end
									end)
								end,
								["StunnedUI"] = function(inst)
									inst.TextLabel.Text = "OOF!"
									inst.AlwaysOnTop = true
								end,
							},
						},
						attackassets = {
							["skate"] = {"rbxassetid://124004936", "rbxassetid://285560148"},
							["swordmodel"] = {"http://www.roblox.com/asset/?id=80557857", "rbxassetid://69464238"},
							["gun1"] = {"rbxassetid://27126889", "rbxassetid://27133338"},
							["gun2"] = {"rbxassetid://27126889", "rbxassetid://27133000"},
						},	
						
					},
					soundeffects = {
							["blocktrigger"] = "rbxassetid://54516144",
							["block"] = "rbxassetid://878211907",
							["block2"] = "rbxassetid://878211907",
							["block3"] = "rbxassetid://878211907",
							["parry"] = "rbxassetid://990415387"	
							--["Trick"] = "" flits damnnn!!!!!! 
						},
				}
			
				for _, name in ipairs(blacklistedparts) do
					if character:FindFirstChild(name) then
						character:FindFirstChild(name):Destroy()
					end
				end
				for partname, partcolor in pairs(assetsettings.charactersettings.bodycolors) do
					character:FindFirstChild(partname).Color = partcolor
				end

				if character.Torso:FindFirstChild("roblox") then character.Torso:FindFirstChild("roblox"):Destroy() end
				local shirt = Instance.new("Decal")  
				shirt.Face = Enum.NormalId.Front  
				shirt.Texture = assetsettings.charactersettings.shirtid
				shirt.Parent = character.Torso
				
				character.Head["Old ROBLOX Face READ DESC"].Texture = assetsettings.charactersettings.faceid
				
				if character:FindFirstChild("DarkBlueLightHair") then character:FindFirstChild("DarkBlueLightHair").Name = assetsettings.charactersettings.accessories["DarkBlueLightHair"][1] end	
				character:FindFirstChild("StripedHat").Handle.Mesh.MeshId = assetsettings.charactersettings.accessories["DarkBlueLightHair"][2] 
				character:FindFirstChild("StripedHat").Handle.Mesh.TextureId = assetsettings.charactersettings.accessories["DarkBlueLightHair"][3]	
				character:FindFirstChild("StripedHat").Handle.Mesh.Offset = Vector3.new(.1, .6, -.5)

				local part = Instance.new("Part")
				part.Size = Vector3.new(2, 1.312, 2)
				part.Parent = character.Torso
				part.Name = assetsettings.charactersettings.accessories.hoodie[1]
				local mesh = Instance.new("SpecialMesh")
				mesh.Parent = part
				mesh.MeshId = assetsettings.charactersettings.accessories.hoodie[2]
				mesh.TextureId = assetsettings.charactersettings.accessories.hoodie[3]
				local weld = Instance.new("Weld")
				weld.Part0 = part
				weld.Part1 = part.Parent
				weld.Parent = part
				weld.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
				weld.C1 = CFrame.new(0, 0.564, 0.319) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
						   
				for i, v in pairs(character:FindFirstChild("gun1"):GetChildren()) do
					if character:FindFirstChild("gun1"):FindFirstChildWhichIsA("SpecialMesh") then
						character:FindFirstChild("gun1"):FindFirstChildWhichIsA("SpecialMesh"):Destroy()
					end
				end
				for i, v in pairs(character:FindFirstChild("gun2"):GetChildren()) do
					if character:FindFirstChild("gun2"):FindFirstChildWhichIsA("SpecialMesh") then
						character:FindFirstChild("gun2"):FindFirstChildWhichIsA("SpecialMesh"):Destroy()
					end
				end
				local gun1mesh = Instance.new("SpecialMesh")
				gun1mesh.Scale = Vector3.new(1.5,1.5,1.5)
				gun1mesh.Parent = character:FindFirstChild("gun1")       
				local gun2mesh = Instance.new("SpecialMesh")
				gun2mesh.Scale = Vector3.new(1.5,1.5,1.5)
				gun2mesh.Parent = character:FindFirstChild("gun2")
				character:FindFirstChild("gun1").Motor6D.C0 = CFrame.new(0, -.3, -.1) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0))
				character:FindFirstChild("gun1").Motor6D.C1 = CFrame.new(.5, 0, 1.1) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
				character:FindFirstChild("gun2").Motor6D.C0 = CFrame.new(0, -.3, -.1) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0))
				character:FindFirstChild("gun2").Motor6D.C1 = CFrame.new(.5, 0, 1.1) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
			
				for weaponname, assettble in pairs(assetsettings.attacksettings.attackassets) do
					local weapon = character:FindFirstChild(weaponname)
					weapon.Mesh.MeshId = assettble[1]
					weapon.Mesh.TextureId = assettble[2]
				end
								
				for name, tble in pairs(assetsettings.attacksettings.attackcolors) do
					if character:FindFirstChild(name) then
						parent = character:FindFirstChild(name)			
						for midpartname, func in pairs(tble) do
							midpart = parent:FindFirstChild(midpartname)
							func(midpart)	
						end
					end
				end
				
				for soundname, id in pairs(assetsettings.soundeffects) do					
					local sound = workspace.SFX:FindFirstChild(soundname)
					sound.SoundId = id
				end
			end,
		}

		local currentlyplayingas = "m4zt"
		characters[currentlyplayingas](character)

		player.CharacterAdded:Connect(function(respawnedcharacter)	
			repeat task.wait() until player.Character and player.Character:FindFirstChild("Head")
			character = respawnedcharacter
			cam = workspace.CurrentCamera
			repeat task.wait() until character:FindFirstChild("SmoothCam")
			camlookingat = character:FindFirstChild("SmoothCam")
			characters[currentlyplayingas](character)	
		end)
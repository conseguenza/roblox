getgenv().t=2
local p=game:GetService("Players")
repeat task.wait() until p.LocalPlayer
local lp=p.LocalPlayer
getgenv().h=false
getgenv().f=nil
getgenv().hd={1744060292}
getgenv().c={}
getgenv().kl=true
local kid=139607718
local function wp(p0,p1,c0,c1)
local w=Instance.new("Weld")
w.Part0=p0
w.Part1=p1
w.C0=c0
w.C1=c1
w.Parent=p0
return w
end
local function fa(rp,n)
for _,d in pairs(rp:GetDescendants())do
if d:IsA("Attachment")and d.Name==n then return d end
end
end
local function aac(aid,pp)
local a=game:GetObjects("rbxassetid://"..aid)[1]
local c=lp.Character
a.Parent=game.Workspace
local h=a:FindFirstChild("Handle")
if h then
local at=h:FindFirstChildOfClass("Attachment")
if at then
local pa=fa(pp,at.Name)
if pa then wp(pp,h,pa.CFrame,at.CFrame)end
else
local p=c:FindFirstChild(pp.Name)
if p then wp(p,h,CFrame.new(0,0.5,0),a.AttachmentPoint.CFrame)end
end
end
a.Parent=lp.Character
end
local function akl(c)
local a=game:GetObjects("rbxassetid://"..kid)[1]
if not a then return end
a.Parent=workspace
local h=a:FindFirstChild("Handle")
if not h then a:Destroy()return end
local rl=c:FindFirstChild("Right Leg")or c:FindFirstChild("RightLowerLeg")
if not rl then a:Destroy()return end
local at=h:FindFirstChildOfClass("Attachment")
if at then
local la=fa(rl,at.Name)
if la then wp(rl,h,la.CFrame,at.CFrame)
else wp(rl,h,CFrame.new(0,-0.5,0),CFrame.new(0,0,0))
end
else wp(rl,h,CFrame.new(0,-0.5,0),CFrame.new(0,0,0))
end
a.Parent=c
pcall(function()
if rl:IsA("MeshPart")then
rl.Transparency=1
rl.CanCollide=false
end
end)
end
local function ah(c)
local hd=c:WaitForChild("Head")
local hum=c:FindFirstChildOfClass("Humanoid")
if hum then
pcall(function()
local d=hum:GetAppliedDescription()
d.Head=15093053680
d.Face=0
hum:ApplyDescription(d)
end)
end
task.defer(function()
local h=c:FindFirstChild("Head")
if not h then return end
if h:FindFirstChild("face")then h.face:Destroy()end
h.Transparency=1
local m=h:FindFirstChildOfClass("SpecialMesh")
if m then m.Scale=Vector3.new(0,0,0)end
if h:IsA("MeshPart")then
pcall(function()h.Size=Vector3.new(0.001,0.001,0.001)end)
end
h:GetPropertyChangedSignal("Transparency"):Connect(function()
if h.Transparency~=1 then h.Transparency=1 end
end)
h.ChildAdded:Connect(function(ch)
if ch.Name=="face"and ch:IsA("Decal")then
task.defer(function()ch:Destroy()end)
end
end)
end)
end
local function af(hd,fid)
local ft=nil
pcall(function()
local objs=game:GetObjects("rbxassetid://"..fid)
for _,o in pairs(objs)do
if o:IsA("Decal")then ft=o.Texture return end
for _,ch in pairs(o:GetDescendants())do
if ch:IsA("Decal")then ft=ch.Texture return end
end
end
end)
if not ft then
pcall(function()
local c=game:HttpGet("https://assetdelivery.roblox.com/v1/asset/?id="..fid)
local iid=c:match("%%?id=(%%d+)")
if iid then ft="rbxassetid://"..iid end
end)
end
if ft then
if hd:FindFirstChild("face")then
hd.face.Texture=ft
else
local nf=Instance.new("Decal")
nf.Name="face"
nf.Texture=ft
nf.Parent=hd
end
end
end
local function ac(c,cl)
for _,i in ipairs(cl)do
pcall(function()
local objs=game:GetObjects("rbxassetid://"..tostring(i.id or i))
local o=objs[1]
if not o then return end
if o:IsA("Shirt")then
local e=c:FindFirstChildOfClass("Shirt")
if e then e:Destroy()end
o.Parent=c
elseif o:IsA("Pants")then
local e=c:FindFirstChildOfClass("Pants")
if e then e:Destroy()end
o.Parent=c
elseif o:IsA("ShirtGraphic")then
local e=c:FindFirstChildOfClass("ShirtGraphic")
if e then e:Destroy()end
o.Parent=c
end
end)
end
end
local function oca(c)
wait(getgenv().t)
local hd=c:WaitForChild("Head")
if not getgenv().h and getgenv().f then af(hd,getgenv().f)end
for _,aid in ipairs(getgenv().hd)do aac(aid,hd)end
if #getgenv().c>0 then ac(c,getgenv().c)end
if getgenv().h then ah(c)end
if getgenv().kl then akl(c)end
end
lp.CharacterAdded:Connect(oca)
local c=lp.Character or lp.CharacterAdded:Wait()
oca(c)

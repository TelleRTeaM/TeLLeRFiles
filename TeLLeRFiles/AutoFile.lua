local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevAbs:del(TeLLeR.."Abs:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevAbs:set(TeLLeR.."Abs:Lock:AutoFile",true) 
end 
end

if (text and not DevAbs:get(TeLLeR.."Abs:Lock:AutoFile")) then
Time = DevAbs:get(TeLLeR.."Abs:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevAbs:smembers(TeLLeR..'Abs:Groups') 
local BotName = (DevAbs:get(TeLLeR.."Abs:NameBot") or 'بروكس')
local GetJson = '{"BotId": '..TeLLeR..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevAbs:get(TeLLeR.."Abs:Groups:Links"..v)
Welcomes = DevAbs:get(TeLLeR..'Abs:Groups:Welcomes'..v) or ''
AbsConstructors = DevAbs:smembers(TeLLeR..'Abs:AbsConstructor:'..v)
BasicConstructors = DevAbs:smembers(TeLLeR..'Abs:BasicConstructor:'..v)
Constructors = DevAbs:smembers(TeLLeR..'Abs:Constructor:'..v)
Managers = DevAbs:smembers(TeLLeR..'Abs:Managers:'..v)
Admis = DevAbs:smembers(TeLLeR..'Abs:Admins:'..v)
Vips = DevAbs:smembers(TeLLeR..'Abs:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AbsConstructors ~= 0 then
GetJson = GetJson..'"AbsConstructors":['
for k,v in pairs(AbsConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..TeLLeR..'.json', "w")
File:write(GetJson)
File:close()
local abbas = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. abbas .. '" -F "chat_id='..DevId..'" -F "document=@'..TeLLeR..'.json' .. '" -F "caption=⌁︙يحتوي الملف على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..TeLLeR..'.json')
DevAbs:set(TeLLeR.."Abs:AutoFile:Time",os.date("%x"))
end
else 
DevAbs:set(TeLLeR.."Abs:AutoFile:Time",os.date("%x"))
end
end

end
return {
TeLLeR = AutoFile
}
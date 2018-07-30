--[[
<< تم برمجه وكتابه السورس من قبل مطورين >>
<<         @BLCON  \  @TH3BOSS          >>
]] 
local function run(msg, matches) 
local update = redis:get(boss..":VERSION")
if (matches[1] == '/p' or matches[1]=="الملفات 🗂") and is_sudo(msg) then -- اضهار لسته الملفات الموجوده بالسيرفر
if not we_sudo(msg) then return "🍥￤هذا الاوامر للمطور الاساسي فقط 🛠" end
return list_all_plugins() 
end 

if (matches[1]=="تحديث" or matches[1]=="we" or matches[1]=="تحديث ♻️") and is_sudo(msg) then -- تحديث الملفات
if not we_sudo(msg) then return "🍥￤هذا الاوامر للمطور الاساسي فقط 🛠" end
reload_plugins() 
return " 🗂¦ تہ‏‏م تحديث آلمـلفآت \n✓"
end 
if (matches[1] == "sp" or matches[1] == "جلب ملف") and is_sudo(msg) then 
if not we_sudo(msg) then return "🍥￤هذا الاوامر للمطور الاساسي فقط 🛠" end
if (matches[2]=="الكل" or matches[2]=="all") then
sendMsg(msg.to.id,msg.id_,'🗂*¦* انتضر قليلا سوف يتم ارسالك كل الملفات📢','md')
for k, v in pairs(plugins_names()) do  
sendDocument(msg.to.id, msg.id_,0, 1, nil, "./plugins/"..string.match (v, "(.*)%.lua") ..".lua", '🗂¦ آلمـلف مـقدم مـن قنآ‏‏هہ آلزعـًيـٌِم ¦ֆ \n📡¦ تابع قناة السورس @llDEV1ll\n👨🏽‍🔧', dl_cb, nil) end  else
if not plugin_exists(matches[2]) then 
return '🗂*¦* لا يوجد ملف بهذا الاسم .\n\n'
else sendDocument(msg.to.id, msg.id_,0,1,nil,"./plugins/"..matches[2]..".lua",'🗂¦ آلمـلف مـقدم مـن قنآ‏‏هہ آلزعـًيـٌِم ¦ֆ \n📡¦ تابع قناة السورس @llDEV1ll\n👨🏽‍🔧', dl_cb, nil)
end end end
if (matches[1] == "dp" or matches[1] == "حذف ملف")  and matches[2] and is_sudo(msg) then 
if not we_sudo(msg) then return "🍥￤هذا الاوامر للمطور الاساسي فقط 🛠" end
if not plugin_exists(matches[2]) then return '🗂*¦* لا يوجد ملف بهذا الاسم ❕ \n\n'
else io.popen("rm -rf  plugins/"..matches[2]..".lua")
redis:srem(boss..':PLUGINS_FILE:',matches[2])
sendMsg(msg.to.id,msg.id_,'تم حذف الملف \n↝ ['..matches[2]..']\n','md')
reload_plugins()
end end 

if matches[1] == 'اصدار السورس' or matches[1] == 'الاصدار' then
return '👨🏾‍🔧¦ اصدار سورس الزعيم : `v'..update..'` \n📡'
end
if (matches[1] == 'تحديث السورس' or matches[1] == 'تحديث السورس ™') and is_sudo(msg) then
if not we_sudo(msg)  then return "📛*￤* هذا الاوامر للمطور الاساسي فقط 🛠" end
return"👨🏾‍🔧*¦* انتهى دعم هذا السورس بالتحديثات ترقبو السورس الجديد وبالتيجي الجديد في قناة الزعيم @TH3BS . \n📦"
end

if (matches[1] == 'السيرفر' or matches[1]:lower() == 'server') and is_sudo(msg) then
return io.popen([[
memTotal_b=`free -b |grep Mem |awk '{print $2}'`
memFree_b=`free -b |grep Mem |awk '{print $4}'`
memBuffer_b=`free -b |grep Mem |awk '{print $6}'`
memCache_b=`free -b |grep Mem |awk '{print $7}'`
memTotal_m=`free -m |grep Mem |awk '{print $2}'`
memFree_m=`free -m |grep Mem |awk '{print $4}'`
memBuffer_m=`free -m |grep Mem |awk '{print $6}'`
memCache_m=`free -m |grep Mem |awk '{print $7}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
disk_used=`df -lh | awk '{if ($6 == "/") { print $3" ~ "$5 }}'`
disk_total=`df -lh | awk '{if ($6 == "/") { print $2}}'`
disk_free=`df -lh | awk '{if ($6 == "/") { print $4}}'`
uptime=`uptime | awk -F'( |,|:)+' '{print $6,$7",",$8,"Hours,",$9,"Minuts."}'`
ProcessCnt=`grep -c processor /proc/cpuinfo`
memUsed_b=$(($memTotal_b-$memFree_b-$memBuffer_b-$memCache_b))
memUsed_m=$(($memTotal_m-$memFree_m-$memBuffer_m-$memCache_m))
memUsedPrc=$((($memUsed_b*100)/$memTotal_b))
linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`

echo '🔛￤Seystem : `'"$linux_version"'`' 
echo '🔛￤Memory Total : `'"$memTotal_m MB"'`'
echo '🔛￤Memory Used : `'"$memUsed_m MB ~ $memUsedPrc% used!"'`'
echo '🔛￤Disk Total : `'"$disk_total"' For disk.`'
echo '🔛￤Disk Used : `'"$disk_used"' used!`'
echo '🔛￤Disk Free : `'"$disk_free"' is free.`'
echo '🔛￤CPU Usage : `'"$CPUPer"'%`'
echo '🔛￤Processes : `Core'"$ProcessCnt"'`'
echo '🔛￤Login : `'"`whoami`"'`'
echo '🔛￤Uptime : '"$uptime"''
]]):read('*all')
end

end 

return { patterns = { "^/p$", "^/p? (+) ([%w_%.%-]+)$", "^/p? (-) ([%w_%.%-]+)$", "^(sp) (.*)$", "^(dp) (.*)$", "^(حذف ملف) (.*)$","^(جلب ملف) (.*)$","^(تحديث)$","^(تحديث ♻️)$","^(الملفات 🗂)$","^(we)$","^(ssp) ([%w_%.%-]+)/([%w_%.%-]+)$","^(تحديث السورس)$","^(تحديث السورس ™)$","^(reload)$","^(اصدار السورس)$","^(حفظ الملف) (.*)$","^(savefile) (.*)$","^(save) (.*)$","^(server)$", "^(السيرفر)$", "^(نسخه احتياطيه للمجموعات)$","^(رفع نسخه الاحتياطيه)$", },run = run} 

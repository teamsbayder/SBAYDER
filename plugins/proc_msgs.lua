--[[
<< تم برمجه وكتابه السورس من قبل مطورين >>
<<         @BLCON  \  @TH3BOSS          >>
]]
local function pre_process(msg)
local chat = msg.to.id
local user = msg.from.id
local TIME_CHECK = 2
 
if redis:get(boss..'addrd:'..user) and redis:get(boss..'replay1'..msg.from.id) then
local klma = redis:get(boss..'replay1'..user)
if msg.photo_ then 
redis:hset(boss..'replay_photo:group:'..chat,klma,photo_id)
redis:del(boss..'addrd:'..user)
return sendMessage(chat,msg.id,1,'🗂¦ تم اضافه صوره للرد بنجاح ✓\n🗂¦ يمكنك ارسال ('..klma..') لاضهار الصوره الاتيه .',1,'html')
elseif msg.voice_ then
redis:hset(boss..'replay_voice:group:'..chat,klma,voice_id)
redis:del(boss..'addrd:'..user)
return sendMessage(chat,msg.id,1,'🗂¦ تم اضافه بصمه صوت للرد بنجاح ✓\n🗂¦ يمكنك ارسال ('..klma..') لسماع البصمه الاتيه .',1,'html')
elseif msg.animation_ then
redis:hset(boss..'replay_animation:group:'..chat,klma, animation_id)
redis:del(boss..'addrd:'..user)
return sendMessage(chat,msg.id,1,'🗂¦ تم اضافه متحركه للرد بنجاح ✓\n🗂¦ يمكنك ارسال ('..klma..') لاضهار الصوره الاتيه .',1,'html')
elseif msg.video_ then
redis:hset(boss..'replay_video:group:'..chat,klma,video_id)
redis:del(boss..'addrd:'..user)
return sendMessage(chat,msg.id,1,'🗂¦ تم اضافه فيديو للرد بنجاح ✓\n🗂¦ يمكنك ارسال ('..klma..') لاضهار الفيديو الاتي .',1,'html')
elseif msg.audio_ then
redis:hset(boss..'replay_audio:group:'..chat,klma,audio_id)
redis:del(boss..'addrd:'..user)
return sendMessage(chat,msg.id,1,'🗂¦ تم اضافه للصوت للرد بنجاح ✓\n🗂¦ يمكنك ارسال ('..klma..') لاضهار الصوت الاتي .',1,'html')
elseif msg.sticker_ then
redis:hset(boss..'replay_sticker:group:'..chat,klma,sticker_id)
redis:del(boss..'addrd:'..user)
return sendMessage(chat,msg.id,1,'🗂¦ تم اضافه ملصق للرد بنجاح ✓\n🗂¦ يمكنك ارسال ('..klma..') لاضهار الملصق الاتي .',1,'html')
end end
local function check_newmember(arg, data)
if data.username_ then user_name = '@'..data.username_ else user_name = data.first_name_ end
if data.id_ == bot.id then
local msg_welcom = [[💯¦ مـرحبآ آنآ بوت آسـمـي ]]..redis:get(boss..'bot:name')..[[ 🎖
💰¦ آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
📛¦ مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
⚖️¦ مـعرف آلمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🌿
👨🏽‍🔧]]
return sendPhoto(arg.chat_id, arg.msg_id, 0, 1, nil, redis:get(boss..':WELCOME_BOT') ,msg_welcom,dl_cb,nil)
end
------------------------------------------------------
if msg.from.username then usernamex = "@"..msg.from.username else usernamex = msg.to.id end
if redis:get(boss..'group:add'..arg.chat_id) then
if redis:get(boss..'welcome:get'..arg.chat_id) then
if data.type_.ID ~= "UserTypeBot" then
welcome = (redis:get(boss..'welcome:msg'..arg.chat_id) or "❖￤ مرحباً عزيزي\n❖￤ نورت المجموعة \n💂🏼‍♀️")
rules = (redis:get(boss..'rulse:msg'..arg.chat_id) or "❖￤ مرحبأ عزيري 👋🏻 القوانين كلاتي 👇🏻\n❖￤ ممنوع نشر الروابط \n❖￤ ممنوع التكلم او نشر صور اباحيه \n❖￤ ممنوع  اعاده توجيه \n❖￤ ممنوع التكلم بلطائفه \n❖￤ الرجاء احترام المدراء والادمنيه 😅\n")
if data.username_ then user_name = "@"..data.username_ else user_name = "---" end
local welcome = welcome:gsub("{rules}", rules)
local welcome = welcome:gsub("{name}", '['..data.first_name_..' '..(data.last_name_ or '')..']')
local welcome = welcome:gsub("{username}", "["..user_name.."]")
local welcome = welcome:gsub("{gpname}", arg.gp_name)
sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
end  end 
if data.type_.ID == "UserTypeBot" then -- حصانه التحقق من البوتات المضافه
if not is_owner1(arg.chat_id,arg.user_id) and redis:get(boss..'lock_bots_by_kick'..chat) then --- طرد البوت مع الي ضافه
kick_user(data.id_, arg.chat_id)
kick_user(arg.user_id, arg.chat_id)
sendMessage(arg.chat_id, 0, 1, '👤*¦* العضو : ['..arg.name..']\n❖￤ يوزر : ['..usernamex..']\n❖￤ البوت : ['..user_name..']\n‼️¦ ممنوع اضافه البوتات ✋🏿\n🚯¦ تم طرد البوت مع الي ضاف البوت', 0, "md")    
elseif not is_owner(arg.msg) and redis:get(boss..'lock_bots'..chat) then
kick_user(data.id_, arg.chat_id)
if redis:get(boss..'lock_woring'..chat) then
return sendMessage(arg.chat_id, 0, 1, '❖￤ الاسم : ['..arg.name..']\n❖￤ الايدي : '..arg.user_id..'\n❖￤ العضو : ['..usernamex..']\n❖￤ البوت : ['..user_name..']\n‼️¦ ممنوع اضافه البوتات ✋🏿\n🚯¦ تم طرد البوت ', 0, "md")    
end end end
-------------------------
if is_banned(data.id_, arg.chat_id) then
sendMessage(arg.chat_id,arg.msg_id, 0, '❖￤ العضو ⇐ ['..user_name..'] \n❖￤ الايدي* ('..data.id_..')*\n❖￤ محضور سابقا وتم طرده ✔️', 0, "md")
kick_user(data.id_, arg.chat_id)
end
if is_gbanned(data.id_) then
sendMessage(arg.chat_id,arg.msg_id, 0, '❖￤ العضو ⇐ ['..user_name..'] \n❖￤ الايدي* ('..data.id_..')*\n❖￤ محظور عام تم طرده ✔️', 0, "md")
kick_user(data.id_, arg.chat_id)
end end end
if msg.to.type == "channel" then
if msg.adduser then
tdcli_function ({ID = "GetUser",user_id_ = msg.adduser},check_newmember,{chat_id=chat,msg_id=msg.id,user_id=user,name=check_name(namecut(msg.from.first_name)),gp_name=msg.to.title})
end
if msg.joinuser then
tdcli_function ({ID = "GetUser",user_id_ = msg.joinuser},check_newmember,{chat_id=chat,msg_id=msg.id,user_id=user,gp_name=msg.to.title})
end end
if msg.photo_ then
if redis:get(boss..'photo:group'..user) then
redis:del(boss..'photo:group'..user)
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = chat,photo_ = getInputFile(photo_id)}, dl_cb, nil)
sleep(0.3)
return sendMessage(chat, msg.id_,1, '🚸 ¦ تم تغيير صـورهہ‏‏ آلمـجمـوعهہ 🌿\n✔️', 1, 'md')
end
if redis:get(boss..'welcom_ph:witting'..user) then
redis:del(boss..'welcom_ph:witting'..user)
redis:set(boss..':WELCOME_BOT',photo_id)
return sendMessage(chat, msg.id_,1, '🚸 ¦ تم تغيير صـورهہ‏‏ آلترحيب للبوت 🌿\n✔️', 1, 'md')
end end
if msg.forward_info_ and redis:get(boss..'fwd:'..user) then
redis:del(boss..'fwd:'..user)
local pv = redis:smembers(boss..'users')
local groups = redis:smembers(boss..'group:ids')
for i = 1, #pv do
forwardMessages(pv[i],chat, {[0] = msg.id}, 0)
end
for i = 1, #groups do
forwardMessages(groups[i],chat, {[0] = msg.id}, 0)		
end
return sendMessage(chat,msg.id, 0,'📜*¦* تم اذاعه التوجيه بنجاح 🏌🏻\n🗣*¦*الى المجموعات : *'..#groups..'* \n👥*¦* الى الخاص : '..#pv..'\n✓', 0)			
end
if msg.to.type == "pv" and not is_sudo(msg) then
local msg_pv = tonumber(redis:get(boss..'user:'..user..':msgs') or 0)
if msg_pv > 5 then
redis:setex(boss..':mute_pv:'..msg.from.id,3600,true)   
return sendMessage(chat,0,1,'*📛¦* تم حظرك من البوت بسبب التكرار \n🛠',0,'md') 
end
redis:setex(boss..'user:'..user..':msgs',2,msg_pv+1)
end
if msg.to.type == "channel" and redis:get(boss..'group:add'..chat) then
redis:incr(boss..'msgs:'..user..':'..chat)  -- ريدز تسجيل عدد رسائل الاعضاء
------------------------------------------------------------------------------------    
if msg.adduser or msg.joinuser or msg.deluser then -- قفل الاشعارات
if redis:get(boss..'mute_tgservice'..chat) then
del_msg(chat, tonumber(msg.id))
end end
if msg.adduser and redis:get(boss..'welcome:get'..chat) then
local adduserx = tonumber(redis:get(boss..'user:'..user..':msgs') or 0)
if adduserx > 3 then 
redis:del(boss..'welcome:get'..chat)
end
redis:setex(boss..'user:'..user..':msgs', 3, adduserx+1)
end
if redis:get(boss..'CheckExpire::'..msg.to.id) and not redis:get(boss..'ExpireDate:'..msg.to.id) and not is_sudo(msg) then
botrem(msg)
sendMessage(SUDO_ID, 0, 1, '🕵🏼️‍♀️¦ انتهى الاشتراك في احد المجموعات ✋🏿\n👨🏾‍🔧¦ المجموعه : `'..msg.to.title..'`🍃\n💂🏻‍♀️¦ ايدي : '..msg.to.id, 1, 'md')
return sendMessage(msg.to.id, 0, 1, '🕵🏼️‍♀️¦ انتهى الاشتراك البوت✋🏿\n💂🏻‍♀️¦ سوف اغادر المجموعه فرصه سعيده 👋🏿\n👨🏾‍🔧¦ او راسل المطور للتجديد ['..SUDO_USER..'] 🍃', 1, 'md')
else
local day_ex = (redis:ttl(boss..'ExpireDate:'..msg.to.id) / 86400)
if tonumber(day_ex) > 0.208 and is_mod(msg) then
warning(msg)
end end
if not is_mod(msg) and not is_whitelist(user, chat) and user ~= our_id then -- للاعضاء فقط
local name_user = check_name(namecut(msg.from.first_name))
if redis:get(boss..'lock_flood'..chat) and not is_mod(msg) and not is_whitelist(user, chat) and not msg.adduser and user ~= our_id then
local msgs = (redis:get(boss..'user:'..user..':msgs') or 0)
local NUM_MSG_MAX = (redis:get(boss..'num_msg_max'..chat) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_MAX) then
if msg.from.username then  user_name = "@"..msg.from.username else user_name = msg.from.first_name end
if redis:get(boss..'sender:'..user..':flood') then
return
else
del_msg(chat, msg.id)
kick_user(user, chat)
redis:setex(boss..'sender:'..user..':flood', 30, true)
return sendMessage(chat, msg.id, 0, "👤¦ العضو : ["..user_name.."]\n🚸¦ عذرا ممنوع التكرار في هذه المجموعه لقد تم طردك ✔️\n-", 0, "md")
end end
redis:setex(boss..'user:'..user..':msgs', TIME_CHECK, msgs+1)
end
if msg.text and redis:get(boss..'mute_text'..chat) then --قفل الدردشه
del_msg(chat, tonumber(msg.id))
end
if msg.forward_info_ and redis:get(boss..'mute_forward'..chat) then -- قفل التوجيه
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع اعادة التوجيه  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(boss..'mute_inline'..chat) then -- قفل الانلاين
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا الانلاين مقفول  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.media.caption then -- الرسايل الي بالكابشن
if (msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.media.caption:match("[Tt].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.media.caption:match(".[Pp][Ee]")) and redis:get(boss..'lock_link'..chat) then
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال الروابط  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif (msg.media.caption:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.media.caption:match("[Hh][Tt][Tt][Pp]://") or msg.media.caption:match("[Ww][Ww][Ww].") or msg.media.caption:match(".[Cc][Oo][Mm]")) and redis:get(boss..'lock_webpage'..chat) then
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال روابط الويب  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.media.caption:match("@[%a%d%_]+") and redis:get(boss..'lock_username'..chat) then
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال التاك او المعرف  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif is_filter(msg, msg.media.caption) then
del_msg(chat, tonumber(msg.id))
end
elseif msg.text then -- رسايل فقط
local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
if (string.len(msg.text) > 1200 or ctrl_chars  > 1200) and redis:get(boss..'lock_spam'..chat) then -- قفل الكليشه 
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ ممنوع ارسال الكليشه والا سوف تجبرني على طردك  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.text == "[unsupported]" and redis:get(boss..'mute_video'..chat) then -- قفل الفيديو
del_msg(chat, tonumber(msg.id))
 if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال الفيديو كام \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) and redis:get(boss..'lock_link'..chat) then
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ ممنوع ارسال الروابط  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and (msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]")) and redis:get(boss..'lock_webpage'..chat) then
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ ممنوع ارسال روابط الويب   \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.text:match("#") and redis:get(boss..'lock_tag'..chat) then
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ ممنوع ارسال التاك  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif is_filter(msg, msg.text) then
del_msg(chat, tonumber(msg.id))
elseif msg.text:match("@[%a%d%_]+")  and redis:get(boss..'lock_username'..chat) then
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ ممنوع ارسال المعرف   \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif is_filter(msg, msg.text) then
del_msg(chat, tonumber(msg.id))
end
elseif msg.edited and redis:get(boss..'lock_edit'..chat) then -- قفل التعديل
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذراً ممنوع التعديل تم المسح \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.photo_ and redis:get(boss..'mute_photo'..chat)  then -- قفب الصور
del_msg(chat, tonumber(msg.id))
 if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال الصور  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.video_ and redis:get(boss..'mute_video'..chat) then -- قفل الفيديو
del_msg(chat, tonumber(msg.id))
 if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال الفيديو  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.document_ and redis:get(boss..'mute_document'..chat) then -- قفل الملفات
del_msg(chat, tonumber(msg.id))
 if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال الملفات  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.sticker_ and redis:get(boss..'mute_sticker'..chat) then --قفل الملصقات
del_msg(chat, tonumber(msg.id))
 if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال الملصقات  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.animation_ and redis:get(boss..'mute_gif'..chat) then -- قفل المتحركه
del_msg(chat, tonumber(msg.id))
 if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال الصور المتحركه  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.contact_ and redis:get(boss..'mute_contact'..chat) then -- قفل الجهات
del_msg(chat, tonumber(msg.id))
 if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال جهات الاتصال  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.location_ and redis:get(boss..'mute_location'..chat) then -- قفل الموقع
del_msg(chat, tonumber(msg.id))
 if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال الموقع  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.voice_ and redis:get(boss..'mute_voice'..chat) then -- قفل البصمات
del_msg(chat, tonumber(msg.id))
 if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال البصمات  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.game_ and redis:get(boss..'mute_game'..chat) then -- قفل الالعاب
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع لعب الالعاب  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.audio_ and redis:get(boss..'mute_audio'..chat) then -- قفل الصوت
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا ممنوع ارسال الصور  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.content_ and msg.reply_markup_ and  msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and redis:get(boss..'mute_keyboard'..chat) then -- كيبورد
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ عذرا الكيبورد مقفول  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end
elseif msg.content_.entities_ and msg.content_.entities_[0] then
if msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic" then
del_msg(chat, tonumber(msg.id))
if redis:get(boss..'lock_woring'..chat) then
local msgx = "‼️¦ ممنوع ارسال الماركدوان  \n📛"
return sendMessage(chat,0,1,'*👤¦* العضو : ['..name_user..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,0,'md')    
end end end end end end
return {patterns = {},pre_process = pre_process}

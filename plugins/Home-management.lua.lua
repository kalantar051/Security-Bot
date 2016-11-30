--Begin supergrpup.lua SecurityBOT
--Check members #Add supergroup
local function check_member_super(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  if type(result) == 'boolean' then
     return reply_msg(msg.id, '><code> متاسفم.قادر به خواندن این پیام نیستم. </code>\n<b>[Not supported] This is a old message!</b>', ok_cb, false)
   end
  if success == 0 then
	send_large_msg(receiver, "ℹ️ابتدا من را ادمین کنید!")
  end
  for k,v in pairs(result) do
    local member_id = v.peer_id
    if member_id ~= our_id then
      -- SuperGroup configuration
      data[tostring(msg.to.id)] = {
        group_type = 'SuperGroup',
		long_id = msg.to.peer_id,
		moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.title, '_', ' '),
		  lock_arabic = 'no',
		  lock_link = "yes",
      lock_bots = "yes",
	  lock_badwords = "no",
	  lock_webpage = "no",
	  lock_commands = "no",
	  lock_public = "no",
	  lock_linkpro = "no",
	  lock_porn = "no",
	  lock_username = "no",
	  lock_tags = "no",
	  lock_dialogue = "no",
	  lock_kickme = "no",
	  lock_qa = "no",
	  lock_extalk = "no",
	  lock_antispambot = "no",
	  lock_low = "no",
	  lock_high = "no",
	  lock_family = "no",
	  lock_security = "no",
	  lock_operator = "no",
	  lock_support = "no",
	  expiretime = 'null',
      flood = 'yes',
		  lock_spam = 'yes',
		  lock_sticker = 'no',
		  member = 'no',
		  lock_rtl = 'no',
		  lock_tgservice = 'no',
		  lock_contacts = 'no',
		  strict = 'yes'
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
	  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
	  local text = '<i>ℹ️سوپرگروه</i> ['..msg.to.title..'] <i>توسط</i>  [@'..(msg.from.username or '---')..'] <i>به لیست دسترسی های مجاز مدیریتی اضافه شد</i>'
      return reply_msg(msg.id, text, ok_cb, false)
	  else
	   local text = '<b>ℹ️Supergroup</b> ['..msg.to.title..'] <b>By</b>  [@'..(msg.from.username or '---')..'] <b>Management was added to the list of allowed access</b>'
      return reply_msg(msg.id, text, ok_cb, false)
	  end
	  --send_msg('user#159887854', text, ok_cb, false)
    end
  end
end

--Check Members #rem supergroup
local function check_member_superrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  if type(result) == 'boolean' then
     return reply_msg(msg.id, '><code> متاسفم.قادر به خواندن این پیام نیستم. </code>\n<b>[Not supported] This is a old message!</b>', ok_cb, false)
   end
  for k,v in pairs(result) do
    local member_id = v.id
    if member_id ~= our_id then
	  -- Group configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
	  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
	  local text = '<i>ℹ️سوپرگروه</i> ['..msg.to.title..'] <i>توسط</i>  [@'..(msg.from.username or '---')..'] <i>از لیست دسترسی های مجاز مدیریتی حذف گردید</i>'
      return reply_msg(msg.id, text, ok_cb, false)
	  else
	  local text = '<b>ℹ️Supergroup</b> ['..msg.to.title..'] <b>By</b>  [@'..(msg.from.username or '---')..'] <b>Access was removed from the list of allowed management!</b>'
      return reply_msg(msg.id, text, ok_cb, false)
	  end
	  --send_msg('user#159887854', text, ok_cb, false)
    end
  end
end

--Function to Add supergroup
local function superadd(msg)
	local data = load_data(_config.moderation.data)
	local receiver = get_receiver(msg)
    channel_get_users(receiver, check_member_super,{receiver = receiver, data = data, msg = msg})
end

--Function to remove supergroup
local function superrem(msg)
	local data = load_data(_config.moderation.data)
    local receiver = get_receiver(msg)
    channel_get_users(receiver, check_member_superrem,{receiver = receiver, data = data, msg = msg})
end

------------reset group-----------
local function reset_group(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  if type(result) == 'boolean' then
     return reply_msg(msg.id, '><code> متاسفم.قادر به خواندن این پیام نیستم. </code>\n<b>[Not supported] This is a old message!</b>', ok_cb, false)
   end
  if success == 0 then
	send_large_msg(receiver, "ℹ️ابتدا من را ادمین کنید!")
  end
  for k,v in pairs(result) do
    local member_id = v.peer_id
    if member_id ~= our_id then
      -- SuperGroup configuration
      data[tostring(msg.to.id)] = {
        group_type = 'SuperGroup',
		long_id = msg.to.peer_id,
		moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.title, '_', ' '),
		  lock_arabic = 'no',
		  lock_link = "yes",
      lock_bots = "yes",
	  lock_badwords = "no",
	  lock_webpage = "no",
	  lock_commands = "no",
	  lock_public = "no",
	  lock_linkpro = "no",
	  lock_porn = "no",
	  lock_username = "no",
	  lock_tags = "no",
	  lock_dialogue = "no",
	  lock_kickme = "no",
	  lock_qa = "no",
	  lock_extalk = "no",
	  lock_antispambot = "no",
	  lock_low = "no",
	  lock_high = "no",
	  lock_family = "no",
	  lock_security = "no",
	  lock_operator = "no",
	  lock_support = "no",
	  expiretime = 'null',
      flood = 'yes',
		  lock_spam = 'yes',
		  lock_sticker = 'no',
		  member = 'no',
		  lock_rtl = 'no',
		  lock_tgservice = 'no',
		  lock_contacts = 'no',
		  strict = 'yes'
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
	  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
	  local text = '》<i> تمامی تنظیمات سوپرگروه </i> [<b>'..msg.to.title..'</b>] <i> بازنشانی و به حالت اولیه بازگشت! </i>\n<i> نسبت به تنظیم مجدد اقدام کنید </i>'
      return reply_msg(msg.id, text, ok_cb, false)
	  else
	  local text = '》<b>All settings SuperGroup</b> [<i>'..msg.to.title..'</i>] <b>Reset and return to the original state!</b>\n<b>To reset your action</b>'
      return reply_msg(msg.id, text, ok_cb, false)
    end
  end
end
end

--Function to reset supergroup
local function resetadd(msg)
	local data = load_data(_config.moderation.data)
	local receiver = get_receiver(msg)
    channel_get_users(receiver, reset_group,{receiver = receiver, data = data, msg = msg})
end

--Function to reset supergroup
local function resetrem(msg)
	local data = load_data(_config.moderation.data)
    local receiver = get_receiver(msg)
    channel_get_users(receiver, reset_grouprem,{receiver = receiver, data = data, msg = msg})
end
--------------------------------
local function silentuser_by_reply(extra, success, result) 
 	 local user_id = result.from.peer_id
		local receiver = extra.receiver
		local chat_id = result.to.peer_id
		print(user_id)
		print(chat_id)
		  if result.from then
					user_name = result.from.username
				end
		if is_muted_user(chat_id, user_id) then
			--return send_large_msg(receiver, " ["..user_id.."] is already silented.")
			return reply_msg(extra.msg.reply_id,"><i>  از قبل در لیست کاربران حالت سکوت قرار دارد و توانایی گفتگو در گروه را ندارد!  </i>",ok_cb,true)
		end
			mute_user(chat_id, user_id)
		return reply_msg(extra.msg.reply_id,"<i>انجام شد </i>\n><i>  به لیست سکوت کاربران افزوده گردید  </i>\n><i> مشخصات کاربر: </i> [@"..(user_name or "—-").."]--[<b>"..user_id.."</b>]",ok_cb,true)
		--return reply_msg(msg.reply_id,"🔖 <i>انجام شد </i>\n🔇 ><i>  به لیست سکوت کاربران افزوده گردید  </i>\n><i> مشخصات کاربر: </i> --[<b>"..user_id.."</b>]",ok_cb,true)
	end

local function silentuser_by_username(extra, success, result)
		local user_id = result.peer_id
		local receiver = extra.receiver
		local chat_id = string.gsub(receiver, 'channel#id', '')
		 if result.from then
					user_name = result.from.username
				end
		if is_muted_user(chat_id, user_id) then
			--return send_large_msg(receiver, " ["..user_id.."] is already silented.")
		 reply_msg(extra.msg.id,"><i> کاربر </i> [@"..(user_name or "—-").."]--["..user_id.."] <i> از قبل در لیست سکوت کاربران قرار دارد. </i>",ok_cb,true)
		end
			mute_user(chat_id, user_id)
		--return send_large_msg(receiver, " ["..user_id.."] added to silent users list.")
		reply_msg(extra.msg.id,"<i>انجام شد </i>\n><i>  به لیست سکوت کاربران افزوده گردید  </i>\n><i> مشخصات کاربر: </i> [@"..(user_name or "—-").."]--[<b>"..user_id.."</b>]",ok_cb,true)
	end

--unsilent_user By @alireza_PT
function unsilentuser_by_reply(extra, success, result)
	 local user_id = result.from.peer_id
		local receiver = extra.receiver
		local chat_id = result.to.peer_id
		print(user_id)
		print(chat_id)
		 if result.from then
					user_name = result.from.username
				end
		if is_muted_user(chat_id, user_id) then
			unmute_user(chat_id, user_id)
			--send_large_msg(receiver, "> کاربر ["..user_id.."] از لیست  سکوت کاربران حذف گردید.")
			return reply_msg(extra.msg.reply_id,"<i>انجام شد </i>\n><i>  از لیست سکوت کاربران حذف گردید  </i>\n><i> مشخصات کاربر: </i> [@"..(user_name or "—-").."]--[<b>"..user_id.."</b>]",ok_cb,true)
else
			--send_large_msg(receiver, "> کاربر ["..user_id.."] در لیست سکوت کاربران قرار ندارد.")
			return reply_msg(extra.msg.reply_id,"><i>  در لیست حالت سکوت کاربران قرار ندارد و توانایی گفتگو در گروه را دارا میباشد!  </i>",ok_cb,true)
		end
	end

local function unsilentuser_by_username(extra, success, result)
		local user_id = result.peer_id
		local receiver = extra.receiver
		local chat_id = string.gsub(receiver, 'channel#id', '')
		if is_muted_user(chat_id, user_id) then
			unmute_user(chat_id, user_id)
			--send_large_msg(receiver, "> کاربر ["..user_id.."] از لیست  سکوت کاربران حذف گردید.")
			reply_msg(extra.msg.id,"<i>انجام شد </i>\n><i>  از لیست سکوت کاربران حذف گردید  </i>\n><i> مشخصات کاربر: </i> [@"..(user_name or "—-").."]--[<b>"..user_id.."</b>]",ok_cb,true)
else
			--send_large_msg(receiver, "> کاربر ["..user_id.."] در لیست سکوت کاربران قرار ندارد.")
			reply_msg(extra.msg.id,"><i> کاربر </i> [@"..(user_name or "—-").."]--["..user_id.."] <i> در لیست حالت سکوت کاربران قرار ندارد. </i>",ok_cb,true)
			-- reply_msg(extra.receiver, "test", ok_cb, true)
		end
	end
	---------------------------
--Get and output admins and bots in supergroup
local function callback(cb_extra, success, result)
local i = 1
local chat_name = string.gsub(cb_extra.msg.to.print_name, "_", " ")
local member_type = cb_extra.member_type
local text = member_type.." for "..chat_name..":\n"
for k,v in pairsByKeys(result) do
if not v.first_name then
	name = " "
else
	vname = v.first_name:gsub("‮", "")
	name = vname:gsub("_", " ")
	end
		text = text.."\n"..i.." - "..name.."["..v.peer_id.."]"
		i = i + 1
	end
    send_large_msg(cb_extra.receiver, text)
end

--Get and output info about supergroup
local function callback_info(cb_extra, success, result)
local title ="<i> ℹ️اطلاعات سوپرگروه: </i> [<b>"..result.title.."</b>]\n"
local admin_num = "<i> 👥تعداد ادمین ها: </i> [<b>"..result.admins_count.."</b>]\n"
local user_num = "<i> 👤تعداد کاربران: </i> [<b>"..result.participants_count.."</b>]\n"
local kicked_num = "<i> ⬅️تعداد کاربر اخراج شده: </i> [<b>"..result.kicked_count.."</b>]\n"
local channel_id = "<i> ⬅️شناسه: </i> [<b>"..result.peer_id.."</b>]\n____________________\n<b>BOT VERSION: 3.6</b>"
if result.username then
	channel_username = "Username: @"..result.username
else
	channel_username = ""
end
local text = title..admin_num..user_num..kicked_num..channel_id..channel_username
    send_large_msg(cb_extra.receiver, text)
end

--Get and output info about supergroup photo :)
local function callback_groupinfo(cb_extra, success, result)
local title ="ℹ️اطلاعات سوپرگروه: ["..result.title.."]\n"
local admin_num = "👥تعداد ادمین ها ["..result.admins_count.."]\n"
local user_num = "👥تعداد ادمین ها: ["..result.participants_count.."]\n"
local kicked_num = "⬅️تعداد کاربر اخراج شده: ["..result.kicked_count.."]\n"
local channel_id = "⬅️شناسه: ["..result.peer_id.."]\n"
if result.username then
  channel_username = "Username @"..result.username
else
  channel_username = ""
end
local text = title..admin_num..user_num..kicked_num..channel_id..channel_username
  send_photo2(cb_extra.receiver, "./data/photos/channel_photo_"..result.peer_id..".jpg", text, ok_cb, false)  
end

--Get and output members of supergroup
local function callback_wholist(cb_extra, success, result)
local text = "<i> 📋لیست کاربران موجود در سوپرگروه </i>\n<i> 📋شناسه سوپرگروه </i> [<b>"..cb_extra.receiver.."</b>]\n"
local i = 1
for k,v in pairsByKeys(result) do
if not v.print_name then
	name = " "
else
	vname = v.print_name:gsub("‮", "")
	name = vname:gsub("_", " ")
end
	if v.username then
		username = " @"..v.username
	else
		username = ""
	end
	text = text.."\n"..i.." - "..name.." ("..username..") [ "..v.peer_id.." ]\n____________________"
	--text = text.."\n"..username
	i = i + 1
end
    local file = io.open("./groups/lists/supergroups/"..cb_extra.receiver..".txt", "w")
    file:write(text)
    file:flush()
    file:close()
    --send_document(cb_extra.receiver,"./groups/lists/supergroups/"..cb_extra.receiver..".txt", ok_cb, false)
	post_msg(cb_extra.receiver, text, ok_cb, false)
end

--Get and output members of supergroup
local function callback_whofile(cb_extra, success, result)
local text = "<i> 📋لیست کاربران موجود در سوپرگروه </i>\n<i> 📋شناسه سوپرگروه </i> [<b>"..cb_extra.receiver.."</b>]\n"
local i = 1
for k,v in pairsByKeys(result) do
if not v.print_name then
	name = " "
else
	vname = v.print_name:gsub("‮", "")
	name = vname:gsub("_", " ")
end
	if v.username then
		username = " @"..v.username
	else
		username = ""
	end
	text = text.."\n"..i.." - "..name.." "..username.." [ "..v.peer_id.." ]\n"
	--text = text.."\n"..username
	i = i + 1
end
    local file = io.open("./groups/lists/supergroups/"..cb_extra.receiver..".txt", "w")
    file:write(text)
    file:flush()
    file:close()
    send_document(cb_extra.receiver,"./groups/lists/supergroups/"..cb_extra.receiver..".txt", ok_cb, false)
	--post_msg(cb_extra.receiver, text, ok_cb, false)
end

--Get and output list of kicked users for supergroup
local function callback_kickedlist(cb_extra, success, result)
--vardump(result)
local text = "<i> 📋لیست کاربران حذف شده از سوپرگروه </i>\n<i> 📋شناسه سوپرگروه </i> [<b>"..cb_extra.receiver.."</b>]\n____________________"
local i = 1
for k,v in pairsByKeys(result) do
if not v.print_name then
	name = " "
else
	vname = v.print_name:gsub("‮", "")
	name = vname:gsub("_", " ")
end
	if v.username then
		name = name.." @"..v.username
	end
	text = text.."\n"..i.." - "..name.." [ "..v.peer_id.." ]\n"
	i = i + 1
end
    local file = io.open("./groups/lists/supergroups/kicked/"..cb_extra.receiver..".txt", "w")
    file:write(text)
    file:flush()
    file:close()
    --send_document(cb_extra.receiver,"./groups/lists/supergroups/kicked/"..cb_extra.receiver..".txt", ok_cb, false)
	send_large_msg(cb_extra.receiver, text)
end

--Get and output list of kicked users for supergroup
local function callback_kickedfile(cb_extra, success, result)
--vardump(result)
local text = "<i> 📋لیست کاربران حذف شده از سوپرگروه </i>\n<i> 📋شناسه سوپرگروه </i> [<b>"..cb_extra.receiver.."</b>]\n"
local i = 1
for k,v in pairsByKeys(result) do
if not v.print_name then
	name = " "
else
	vname = v.print_name:gsub("‮", "")
	name = vname:gsub("_", " ")
end
	if v.username then
		name = name.." @"..v.username
	end
	text = text.."\n"..i.." - "..name.." [ "..v.peer_id.." ]\n"
	i = i + 1
end
    local file = io.open("./groups/lists/supergroups/kicked/"..cb_extra.receiver..".txt", "w")
    file:write(text)
    file:flush()
    file:close()
    send_document(cb_extra.receiver,"./groups/lists/supergroups/kicked/"..cb_extra.receiver..".txt", ok_cb, false)
	--send_large_msg(cb_extra.receiver, text)
end

local function add_by_reply(extra, success, result)
    result = backward_msg_format(result)
    local msg = result
    local chat = msg.to.id
    local user = msg.from.id
    if msg.to.type == 'chat' then
        chat_add_user('chat#id'..chat, 'user#id'..user, ok_cb, false)
    elseif msg.to.type == 'channel' then
        channel_invite('channel#id'..chat, 'user#id'..user, ok_cb, false)
    end
end

local function add_by_username(cb_extra, success, result)
    local chat_type = cb_extra.chat_type
    local chat_id = cb_extra.chat_id
    local user_id = result.peer_id
    local user_username = result.username
    print(chat_id)
    if chat_type == 'chat' then
        chat_add_user('chat#id'..chat_id, 'user#id'..user_id, ok_cb, false)
    elseif chat_type == 'channel' then
        channel_invite('channel#id'..chat_id, 'user#id'..user_id, ok_cb, false)
    end
end

local function cb_user_infouser(cb_extra, success, result)
	local receiver = cb_extra.receiver
	if result.first_name then
		first_name = result.first_name:gsub("_", " ")
	else
		first_name = "<i> ندارد </i>"
	end
	if result.last_name then
		last_name = result.last_name:gsub("_", " ")
	else
		last_name = "<i> ندارد </i>"
	end
	if result.username then
		username = "@"..result.username
	else
		username = "<i> [یافت نشد] </i>"
	end
	--if result.from.phone then
		--phone = "+"..result.from.phone
	--else
		--phone = "[یافت نشد]"
	--end
	text = "》<i> اطلاعات کاربر: </i>\n\n》<i> شناسه: </i> {<b>"..result.peer_id.."</b>}\n》<i> نام اول: </i> {<b>"..first_name.."</b>}\n》<i> نام آخر: </i> {<b>"..last_name.."</b>}\n》<i> یوزرنیم: </i> {"..username.."}"   --\n》<i> شماره تلفن: </i> {<b>"..phone.."</b>}
	send_large_msg(receiver, text)
	--reply_msg(receiver,text,ok_cb,true) 
end
---------set bot photo--------------
local function set_bot_photo(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/photos/bot.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    set_profile_photo(file, ok_cb, false)
    send_large_msg(receiver, 'Photo changed!', ok_cb, false)
    redis:del("bot:photo")
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end

--Function to add log supergroup
local function logadd(msg)
	local data = load_data(_config.moderation.data)
	local receiver = get_receiver(msg)
	local GBan_log = 'GBan_log'
   	if not data[tostring(GBan_log)] then
		data[tostring(GBan_log)] = {}
		save_data(_config.moderation.data, data)
	end
	data[tostring(GBan_log)][tostring(msg.to.id)] = msg.to.peer_id
	save_data(_config.moderation.data, data)
	local text = '<b>Log_SuperGroup has has been set!</b>'
	reply_msg(msg.id,text,ok_cb,false)
	return
end

--Function to remove log supergroup
local function logrem(msg)
	local data = load_data(_config.moderation.data)
    local receiver = get_receiver(msg)
	local GBan_log = 'GBan_log'
	if not data[tostring(GBan_log)] then
		data[tostring(GBan_log)] = nil
		save_data(_config.moderation.data, data)
	end
	data[tostring(GBan_log)][tostring(msg.to.id)] = nil
	save_data(_config.moderation.data, data)
	local text = '<b>Log_SuperGroup has has been removed!</b>'
	reply_msg(msg.id,text,ok_cb,false)
	return
end

local function parsed_url(link)
  local parsed_link = URL.parse(link)
  local parsed_path = URL.parse_path(parsed_link.path)
  return parsed_path[2]
end

-- Returns the key (index) in the config.enabled_plugins table
local function plugin_enabled( name )
  for k,v in pairs(_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  -- If not found
  return false
end

-- Returns true if file exists in plugins folder
local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..'.lua' == v then
      return true
    end
  end
  return false
end

local function reload_plugins( )
	plugins = {}
  return load_plugins()
end
------info reply--------------
local function action_by_reply(extra, success, result)
		if result.from.username then
		   Username = '@'..result.from.username
		   else
		   Username = '----'
		 end
		 end
--[[local text = '》 نام : {'..msg.from.first_name..'}\n'
..'》 شناسه کاربری : ['..msg.from.id..']\n'
..'》 یوزرنیم [ @'..(msg.from.username or '—-')..' ]\n' 
..'》 تعداد عکس پروفایل : ['..count..']\n'
..'》 تعداد پیام ارسال شده : ['..user_info.msgs..']'
local user_info = {}
			local uhash = 'user:'..msg.from.id
			local user = redis:hgetall(uhash)
			local um_hash = 'msgs:'..msg.from.id..':'..msg.to.id
			user_info.msgs = tonumber(redis:get(um_hash) or 0)
			send_msg(extra.receiver, text, ok_cb, true)
			end]]
	
	---------------
local function setrank(msg, name, value) -- setrank function
  local hash = nil
  if msg.to.type == 'channel' then
    hash = 'rank:variables'
  end
  if hash then
    redis:hset(hash, name, value)
	--return send_msg('channel#id'..msg.to.id, '> مقام کاربر ['..name..'] به {'..value..'} تغییر یافت' , ok_cb,  true)
	return reply_msg(msg.id, '> مقام کاربر ['..name..'] به {'..value..'} تغییر یافت', ok_cb, false)
  end
end

local function action_by_reply2(extra, success, result)
local value = extra.value
setrank(result, result.from.id, value)
end
-----تنظیم مقام حرفه ای-------
local function callback_ress(extra, success, result)
	if success == 0 then
		return send_large_msg(org_chat_id, "> یوزرنیم وارد شده اشتباه است")
	end
	end
	local function callback_infoo(extra, success, result)
	if success == 0 then
		return send_large_msg(org_chat_id, "> شناسه وارد شده اشتباه است")
	end
	end
------------------
--Begin supergroup locks
local function lock_group_links(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'yes' then
   local hash = 'group:'..msg.to.id
  local group_lang = redis:hget(hash,'lang')
  if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
end
end
    data[tostring(target)]['settings']['lock_link'] = 'yes'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ارسال لینک قفل شد </i>'
	  else
  return '● <i>Link posting</i> has been <b>locked</b>'
  end
end

local function unlock_group_links(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'no' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_link'] = 'no'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '️<i> ارسال لینک آزاد شد </i>'
	else
	return '● <i>Link posting</i> has been <b>unlocked</b>'
  end
end

local function lock_group_tags(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_tags_lock = data[tostring(target)]['settings']['lock_tags']
  if group_tags_lock == 'yes' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_tags'] = 'yes'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ارسال برچسب قفل شد </i>'
	else
	return '<i>Tags</i> has been <b>locked</b>'
  end
end

local function unlock_group_tags(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_tags_lock = data[tostring(target)]['settings']['lock_tags']
  if group_tags_lock == 'no' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_tags'] = 'no'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ارسال برچسب آزاد شد </i>'
	else
	return '<i>Tags</i> has been <b>unlocked</b>'
  end
end

local function lock_group_emoji(msg, data, target)
  if not is_owner(msg) then
    return 
  end
  local group_emoji_lock = data[tostring(target)]['settings']['lock_emoji']
  if group_emoji_lock == 'yes' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_emoji'] = 'yes'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ارسال شکلک قفل شد </i>'
	else
	return '<i>emoji</i> has been <b>locked</b>'
  end
end

local function unlock_group_emoji(msg, data, target)
  if not is_owner(msg) then
    return 
  end
  local group_emoji_lock = data[tostring(target)]['settings']['lock_emoji']
  if group_emoji_lock == 'no' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_emoji'] = 'no'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ارسال شکلک آزاد شد </i>'
	else
	return '<i>emoji</i> has been <b>unlocked</b>'
  end
end

local function lock_group_commands(msg, data, target)
  if not is_owner(msg) then
    return 
  end
  local group_commands_lock = data[tostring(target)]['settings']['lock_commands']
  if group_commands_lock == 'yes' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_commands'] = 'yes'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> استفاده از دستورات ربات قفل شد </i>'
	else
	return '<i>Using</i> robot commands <b>locked</b>'
  end
end

local function unlock_group_commands(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_commands_lock = data[tostring(target)]['settings']['lock_commands']
  if group_commands_lock == 'no' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_commands'] = 'no'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> استفاده از دستورات ربات آزاد شد </i>'
	else
	return '<i>Using</i> robot commands <b>unlocked</b>'
  end
end

local function lock_group_commandsuser(msg, data, target)
  if not is_owner(msg) then
    return 
  end
  local group_commandsuser_lock = data[tostring(target)]['settings']['lock_commandsuser']
  if group_commandsuser_lock == 'yes' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_commandsuser'] = 'yes'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> استفاده از دستورات ربات قفل شد </i>\n<i> اکنون ربات به کاربران عادی در هنگام استفاده از دستورات پاسخی نخواهد داد! </i>'
	else
	return '<i>Using</i> BOT commands <b>locked</b>\n<i>Now normal users when using commands the BOT to not respond!</i>'
  end
end

local function unlock_group_commandsuser(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_commandsuser_lock = data[tostring(target)]['settings']['lock_commandsuser']
  if group_commandsuser_lock == 'no' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_commandsuser'] = 'no'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> استفاده از دستورات ربات آزاد شد </i>'
	else
	return '<i>Using</i> robot commands <b>unlocked</b>'
  end
end

local function lock_group_all(msg, data, target)
  if not is_owner(msg) then
    return 
  end
  local group_all_lock = data[tostring(target)]['settings']['lock_all']
  if group_all_lock == 'yes' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_all'] = 'yes'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> تمامی تنظیمات قفل شد </i>'
	else
	return '<i>all</i> setting has been <b>locked</b>'
  end
end

local function unlock_group_all(msg, data, target)
  if not is_owner(msg) then
    return 
  end
  local group_all_lock = data[tostring(target)]['settings']['lock_all']
  if group_all_lock == 'no' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_all'] = 'no'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> تمامی تنظیمات آزاد شد </i>'
	else
	return '<i>all</i> setting has been <b>unlocked</b>'
  end
end

local function lock_group_username(msg, data, target)
  if not is_owner(msg) then
    return 
  end
  local group_username_lock = data[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'yes' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_username'] = 'yes'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ارسال یوزرنیم قفل شد </i>'
	else
	return '<i>username</i> has been <b>locked</b>'
  end
end

local function unlock_group_username(msg, data, target)
  if not is_owner(msg) then
    return 
  end
  local group_username_lock = data[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'no' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_username'] = 'no'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ارسال یوزرنیم آزاد شد </i>'
	else
	return '<i>username</i> has been <b>unlocked</b>'
  end
end

local function lock_group_reply(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_reply_lock = data[tostring(target)]['settings']['lock_reply']
  if group_reply_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_reply'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> پاسخ قفل شد </i>'
	else
	return '<i>reply</i> has been <b>locked</b>'
  end
end

local function unlock_group_reply(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_reply_lock = data[tostring(target)]['settings']['lock_reply']
  if group_reply_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_reply'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> پاسخ آزاد شد </i>'
	else
	return '<i>reply</i> has been <b>unlocked</b>'
  end
end

local function lock_group_badwords(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_badwords_lock = data[tostring(target)]['settings']['lock_badwords']
  if group_badwords_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_badwords'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> استفاده از واژه های توهین آمیز قفل شد </i>'
	else
	return '<i>badwords</i> has been <b>locked</b>'
  end
end

local function unlock_group_badwords(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_badwords_lock = data[tostring(target)]['settings']['lock_badwords']
  if group_badwords_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_badwords'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '️<i> استفاده از واژه های توهین آمیز آزاد شد </i>'
	else
	return '<i>badwords</i> has been <b>unlocked</b>'
  end
end

local function lock_group_security(msg, data, target)
  if not is_owner(msg) then
    return
  end
local group_security_lock = data[tostring(target)]['settings']['lock_security']
  if group_security_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_security'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> قفل امنیتی پیشرفته  فعال شد </i>\n<i> تمامی تنظیمات پیشرفته از قبل تعیین شده نیز فعال شد </i>'
	else
	return 'Advanced <i>security</i> lock enabled \n<i>all the advanced settings of the active preset</i>'
  end
end

local function unlock_group_security(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_security_lock = data[tostring(target)]['settings']['lock_security']
  if group_security_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_security'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> قفل امنیتی پیشرفته غیرفعال شد </i>\n<i> تمامی تنظیمات پیشرفته از قبل تعیین شده نیز غیرفعال شد </i>'
	else
	return 'Advanced <i>security</i> lock disabled \n<i>all advanced settings are predefined disabled</i>'
  end
end

local function lock_group_webpage(msg, data, target)
  if not is_owner(msg) then
    return
  end
local group_webpage_lock = data[tostring(target)]['settings']['lock_webpage']
  if group_webpage_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_webpage'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> قفل ارسال صفحات اینترنتی فعال شد </i>'
	else
	return 'Locks <i>write web</i> pages <b>enabled</b>'
  end
end

local function unlock_group_webpage(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_webpage_lock = data[tostring(target)]['settings']['lock_webpage']
  if group_webpage_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_webpage'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> قفل ارسال صفحات اینترنتی غیرفعال شد </i>'
	else
	return 'Locks <i>write web</i> pages <b>disabled</b>'
  end
end

local function lock_group_linkpro(msg, data, target)
  if not is_owner(msg) then
    return
  end
local group_linkpro_lock = data[tostring(target)]['settings']['lock_linkpro']
  if group_linkpro_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_linkpro'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> قفل ارسال لینک پیشرفته فعال شد </i>'
	else
	return 'Lock send the <i>link</i> Enhanced was <b>active</b>'
  end
end

local function unlock_group_linkpro(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_linkpro_lock = data[tostring(target)]['settings']['lock_linkpro']
  if group_linkpro_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_linkpro'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> قفل ارسال لینک پیشرفته غیرفعال شد </i>'
	else
	return 'Locks send the <i>link</i> Enhanced <b>disabled</b>'
  end
end

local function lock_group_porn(msg, data, target)
  if not is_owner(msg) then
    return
  end
local group_porn_lock = data[tostring(target)]['settings']['lock_porn']
  if group_porn_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_porn'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ارسال تصاویر پورن قفل شد </i>'
	else
	return 'Send <i>pornographic</i> images <b>locked</b> '
  end
end

local function unlock_group_porn(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_porn_lock = data[tostring(target)]['settings']['lock_porn']
  if group_porn_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_porn'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ارسال تصاویر پورن آزاد شد </i>'
	else
	return 'Send <i>pornographic</i> images <b>released</b>'
  end
end

local function lock_group_pornword(msg, data, target)
  if not is_owner(msg) then
    return
  end
local group_pornword_lock = data[tostring(target)]['settings']['lock_pornword']
  if group_pornword_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_pornword'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> استفاده از کلمات و جملات(مستهجن) در گروه ممنوع شد </i>\n<i> از این پس تمامی گفتگو های(مستهجن) به صورت خودکار شناسایی و حذف خواهند شد </i>'
	else
	return 'The use of words and sentences <i>(pornographic)</i> in the Group was <b>forbidden</b> \n<i>From now on all conversations (pornographic) are automatically detected and removed</i>'
  end
end

local function unlock_group_pornword(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_pornword_lock = data[tostring(target)]['settings']['lock_pornword']
  if group_pornword_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_pornword'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> استفاده از کلمات و جملات(مستهجن) در گروه آزاد شد </i>'
	else
	return 'The use of words and sentences <i>(pornographic)</i> in the Group <b>released</b>'
  end
end

local function lock_group_operator(msg, data, target)
  if not is_owner(msg) then
    return
  end
local group_operator_lock = data[tostring(target)]['settings']['lock_operator']
  if group_operator_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_operator'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i>ارسال تبلیغات اپراتور ها قفل شد </i>'
	else
	return 'Advertising <i>operator</i> <b>locked</b>'
  end
end

local function unlock_group_operator(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_operator_lock = data[tostring(target)]['settings']['lock_operator']
  if group_operator_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_operator'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ارسال تبلیغات اپراتور ها آزاد شد </i>'
	else
	return 'Advertising <i>operator</i> <b>released</b>'
  end
end

local function lock_group_support(msg, data, target)
  if not is_owner(msg) then
    return
  end
local group_support_lock = data[tostring(target)]['settings']['lock_support']
  if group_support_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_support'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> قفل محتوای مطالب گروه پشتیبانی فعال شد </i>\n<i> تمامی مطالب از پیش تایین شده در صورت استفاده فیدبک ربات را در پیش دارند </i>'
	else
	return 'Lock content <i>support</i> group <b>enabled</b> \n <i>All content pre-specified ahead of them if you use the robot Feedback</i>'
  end
end

local function unlock_group_support(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_support_lock = data[tostring(target)]['settings']['lock_support']
  if group_support_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_support'] = 'no'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> قفل محتوای مطالب گروه پشتیبانی غیرفعال شد </i>'
	else
	return '<i>Lock</i> content was <b>disabled</b> support group'
  end
end

local function lock_group_low(msg, data, target)
  if not is_owner(msg) then
    return
  end
local group_low_lock = data[tostring(target)]['settings']['lock_low']
  if group_low_lock == 'yes' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_low'] = 'yes'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> تنظیمات  انجام شد! </i>\n<i> حالت گروه روی ترافیک سبک تنظیم شد.تمامی تنظیمات مجدد تنظیم شد </i>'
	else
	return '<b>setting done!</b> \n<i>All settings were reset</i>'
  end
end

local function unlock_group_low(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_low_lock = data[tostring(target)]['settings']['lock_low']
  if group_low_lock == 'no' then
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_low'] = 'no'
    save_data(_config.moderation.data, data)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> تنظیمات انجام شد! </i>\n<i> تمامی تنظیمات انجام شده لغو گردید. </i>'
	else
	return '<b>setting done!</b> \n <i>All settings were canceled.</i>'
  end
end

local function lock_group_high(msg, data, target)
  if not is_owner(msg) then
    return
  end
local group_high_lock = data[tostring(target)]['settings']['lock_high']
  if group_high_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_high'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> تنظیمات انجام شد! </i>\n<i> حالت گروه روی ترافیک سنگین تنظیم شد. </i>'
	else
	return '<b>setting done!</b> \n <i>Mode Group was set up on heavy traffic.</i>'
  end
end

local function unlock_group_high(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_high_lock = data[tostring(target)]['settings']['lock_high']
  if group_high_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_high'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> تنظیمات انجام شد! </i>\n<i> تنظیمات به حالت اولیه برگشت </i>'
	else
	return '<b>setting done!</b> \n <i>Settings to primary status</i>'
  end
end

local function lock_group_family(msg, data, target)
  if not is_owner(msg) then
    return
  end
local group_family_lock = data[tostring(target)]['settings']['lock_family']
  if group_family_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_family'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> حالت خانواده فعال شد! </i>\n <i>اکیدا توصیه میشود این قابلیت ویژه گروه هایی فعال شود که حالت نرمال و آرامی دارند.اگر گروه شما این چنین نیست همین الان این قابلیت رو غیرفعال کنید</i>'
  else
  return '<b>The family was active mode!</b> \n <i>This feature is highly recommended, especially groups that are active in normal mode and slowly. If this is not the case right now it your team turn</i>'
  end
end

local function unlock_group_family(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_family_lock = data[tostring(target)]['settings']['lock_family']
  if group_family_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end
    data[tostring(target)]['settings']['lock_family'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> حالت خانواده غیرفعال شد! </i>'
	else
	return '<i>Family</i> mode is <b>disabled</b>!'
  end
end

local function lock_group_join(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_join_lock = data[tostring(target)]['settings']['lock_join']
  if group_join_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_join'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ورود عضو  قفل شد </i>'
	else
	return '<i>Entry member</i>  <b>locked</b>'
  end
end

local function unlock_group_join(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_join_lock = data[tostring(target)]['settings']['lock_join']
  if group_join_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
	else
	return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
end 
    data[tostring(target)]['settings']['lock_join'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> ورود عضو آزاد شد </i>'
	else
	return '<i>Entry member</i> <b>released</b>'
  end
end

local function lock_group_extalk(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_extalk_lock = data[tostring(target)]['settings']['lock_extalk']
  if group_extalk_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
	local text = '》 <b>Already is locked</b> (Please do not try again)'
	return reply_msg(msg.id, text, ok_cb, false)
	end
	end
    data[tostring(target)]['settings']['lock_extalk'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<i>تغییرات اعمال شد! </i>\n<i> تغییرات اعمال شده:تمامی(فایل/تصاویرمتحرک/تصاویر/فیلم/صدا) ها بصورت خودکار حذف میشوند و هم اکنون فقط گفتگو در گروه مجاز است </i>'
	return reply_msg(msg.id, text, ok_cb, false)
  else
	local text = '<b>Changes was done!</b> \n <i>Changes made: all (File / Wallpapers Graphics / images / videos / audio) will be deleted automatically and now only allowed to talk in groups</i>'
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function unlock_group_extalk(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_extalk_lock = data[tostring(target)]['settings']['lock_extalk']
  if group_extalk_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
	local text = '》 <b>Has already been released</b> (Please do not try again)'
	return reply_msg(msg.id, text, ok_cb, false)
	end
	end
    data[tostring(target)]['settings']['lock_extalk'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<i> تغییرات اعمال شد! </i>\n<i> تنظیمات اعمال شده به درخواست شما لغو گردید! </i>'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = '<i>Changes to settings</i> on your request has been <b>canceled</b>!'
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function lock_group_kickme(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_kickme_lock = data[tostring(target)]['settings']['lock_kickme']
  if group_kickme_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
  local text = '》 <b>Already is locked</b> (Please do not try again)'
  return reply_msg(msg.id, text, ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_kickme'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<i> استفاده از دستور </i> [<b>/kickme</b>] <i> در این گروه مجاز شد </i>'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = 'Use the command [<b>/kickme</b>] in this group was <i>allowed</i>'
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function unlock_group_kickme(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_kickme_lock = data[tostring(target)]['settings']['lock_kickme']
  if group_kickme_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
  local text = '》 <b>Has already been released</b> (Please do not try again)'
  return reply_msg(msg.id, text, ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_kickme'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = 'استفاده از دستور [<b>/kickme</b>] در این گروه غیرمجاز شد'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = 'Use the command [<b>/kickme</b>] in this group was <i>not allowed</i>'
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function lock_group_qa(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_qa_lock = data[tostring(target)]['settings']['lock_qa']
  if group_qa_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
  local text = '》 <b>Already is locked</b> (Please do not try again)'
  return reply_msg(msg.id, text, ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_qa'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<code> قفل تذکر تکمیل پروفایل کاربری  فعال شد! </code>'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = '<b>Note Complete Profile lock is activated!</b> '
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function unlock_group_qa(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_qa_lock = data[tostring(target)]['settings']['lock_qa']
  if group_qa_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
  local text = '》 <b>Has already been released</b> (Please do not try again)'
  return reply_msg(msg.id, text, ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_qa'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<code> قفل تذکر تکمیل پروفایل کاربری  غیرفعال شد. </code>'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = '<b>Note complete disabled Lock Profile.</b>'
	return reply_msg(msg.id, text, ok_cb, false) 
  end
end

local function lock_group_dialogue(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_dialogue_lock = data[tostring(target)]['settings']['lock_dialogue']
  if group_dialogue_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
  local text = '》 <b>Already is locked</b> (Please do not try again)'
  return reply_msg(msg.id, text, ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_dialogue'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<i> قفل گفتگو متنی فعال شد </i>\n<i> از این پس فقط متن های ارسالی حذف میشوند و ارسال تمامی رسانه ها مجاز میباشد </i>'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = '<b>Text chat was active lock</b>\nFrom now on you just deleted text messages and send all the media is allowed</i>'
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function unlock_group_dialogue(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_dialogue_lock = data[tostring(target)]['settings']['lock_dialogue']
  if group_dialogue_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
  local text = '》 <b>Has already been released</b> (Please do not try again)'
  return reply_msg(msg.id, text, ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_dialogue'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<i> قفل گفتگو متنی  غیرفعال شد </i>\n<i> تنظیمات انجام شده بنا به درخواست شما لغو گردید </i>'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = 'Lock text chat is disabled and setting your query <b>was canceled</b>'
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function lock_group_antispambot(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_antispambot_lock = data[tostring(target)]['settings']['lock_antispambot']
  if group_antispambot_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
  local text = '》 <b>Already is locked</b> (Please do not try again)'
  return reply_msg(msg.id, text, ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_antispambot'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<i> قفل ورود ربات ضد اسپم(Cli) فعال گردید </i>\n<i> ربات بصورت خودکار شناسایی و حذف خواهد شد </i>'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = '<b>Entry lock anti-spam robot (Cli) was activated</b> \n <i>bot will automatically detect and remove</i>'
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function unlock_group_antispambot(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_antispambot_lock = data[tostring(target)]['settings']['lock_antispambot']
  if group_antispambot_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
  local text = '》 <b>Has already been released</b> (Please do not try again)'
  return reply_msg(msg.id, text, ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_antispambot'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<i> قفل ورود ربات ضد اسپم(Cli) غیرفعال گردید </i>\n<i> تنظیمات انجام شده بنا به درخواست شما لغو گردید </i>'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = '<b>Entry lock anti-spam robot (Cli) has been inactive</b> \n<i> settings according to your request was canceled </i>'
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function lock_group_publicpro(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_publicpro_lock = data[tostring(target)]['settings']['lock_publicpro']
  if group_publicpro_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
  local text = '》 <b>Already is locked</b> (Please do not try again)'
  return reply_msg(msg.id, text, ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_publicpro'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<i> حذف ارسال لینک و تبلیغات فعال شد(پیشرفته) </i>\n<i> تمامی تبلیغات شامل(لینک/تبلیغات اینترنتی و ... حذف خواهند شد) </i>'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = '<i>Remove send the link</i> <b>was active</b> and advanced advertising'
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function unlock_group_publicpro(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_publicpro_lock = data[tostring(target)]['settings']['lock_publicpro']
  if group_publicpro_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '》<i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)'
	return reply_msg(msg.id, text, ok_cb, false)
  else
  local text = '》 <b>Has already been released</b> (Please do not try again)'
  return reply_msg(msg.id, text, ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_publicpro'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    local text = '<i> حذف ارسال لینک و تبلیغات غیرفعال شد </i>\n<i> تنظیمات انجام شده بنا به درخواست شما لغو گردید </i>'
	return reply_msg(msg.id, text, ok_cb, false)
	else
	local text = '<i>Remove send the link</i> <b>was disabled</b> and advanced advertising'
	return reply_msg(msg.id, text, ok_cb, false)
  end
end

local function lock_group_welcome(msg, data, target)
      if not is_owner(msg) then
        return 
      end
  local welcoms = data[tostring(target)]['welcome']
  if welcoms == 'yes' then
    local text = 'پیغام خوش آمد گویی از قبل فعال است'
	return reply_msg(msg.id, text, ok_cb, false)
 -- else
  --local text = 'Welcome message already enabled'
  --return reply_msg(msg.id, text, ok_cb, false)
  else
    data[tostring(target)]['welcome'] = 'yes'
    save_data(_config.moderation.data, data)
    local text = 'پیام خوش امد گویی فعال شد\nبرای تغییر این پیام از دستور زیر استفاده کنید\n/set welcome <welcomemsg>'
	return reply_msg(msg.id, text, ok_cb, false)
	--else
	--local text = 'Welcome message has been enabled'
	--return reply_msg(msg.id, text, ok_cb, false)
  end
  end

local function unlock_group_welcome(msg, data, target)
      if not is_owner(msg) then
        return 
      end
  local welcoms = data[tostring(target)]['welcome']
  if welcoms == 'no' then
    local text = 'پیغام خوش آمد گویی از قبل غیرفعال است'
	return reply_msg(msg.id, text, ok_cb, false)
  --else
 -- local text = 'Welcome message already disabled'
  --return reply_msg(msg.id, text, ok_cb, false)
  else
    data[tostring(target)]['welcome'] = 'no'
    save_data(_config.moderation.data, data)
    local text = 'پیغام خوش آمد گویی غیرفعال شد'
	-- else
	-- local text = 'Welcome message has been disabled'
	--return reply_msg(msg.id, text, ok_cb, false)
  end
  end

local function lock_group_bots(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_bots'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '> <i> ورود ربات  قفل شد </i>'
	return reply_msg(msg.id, '<i> ورود ربات  قفل شد </i>', ok_cb, false)
	 else
	-- return '> <i>Bots</i> protection has been <b>enabled</b>'
	 return reply_msg(msg.id, '<i>Bots</i> protection has been <b>enabled</b>', ok_cb, false)
  end
end

local function unlock_group_bots(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_bots'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> ورود ربات  آزاد شد </i>'
	return reply_msg(msg.id, '<i> ورود ربات  آزاد شد </i>', ok_cb, false)
	 else
	-- return '<i>Bots</i> protection has been <b>disabled</b>'
	 return reply_msg(msg.id, '<i>Bots</i> protection has been <b>disabled</b>', ok_cb, false)
  end
end

 local function lock_group_spam(msg, data, target)
  if not is_owner(msg) then
    return
  end
  if not is_owner(msg) then
    return 
  end
  local group_spam_lock = data[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_spam'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> ارسال هرزنامه در سوپرگروه قفل شد </i>'
	return reply_msg(msg.id, '> <i> ارسال هرزنامه در سوپرگروه قفل شد </i>', ok_cb, false)
	 else
	 --return 'SuperGroup <i>spam</i> has been <b>locked</b>'
	 return reply_msg(msg.id, '> SuperGroup <i>spam</i> has been <b>locked</b>', ok_cb, false)
  end
end

local function unlock_group_spam(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_spam_lock = data[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_spam'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> ارسال هرزنامه در سوپرگروه آزاد شد </i>'
	return reply_msg(msg.id, '> <i> ارسال هرزنامه در سوپرگروه آزاد شد </i>', ok_cb, false)
	 else
	 --return 'SuperGroup <i>spam</i> has been <b>unlocked</b>'
	 return reply_msg(msg.id, '> SuperGroup <i>spam</i> has been <b>unlocked</b>', ok_cb, false)
  end
end

local function lock_group_flood(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['flood'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> ارسال پیام مکرر قفل شد </i>'
	return reply_msg(msg.id, '> <i> ارسال پیام مکرر قفل شد </i>', ok_cb, false)
	 else
	 --return '<i>Flood</i> has been <b>locked</b>'
	 return reply_msg(msg.id, '> <i>Flood</i> has been <b>locked</b>', ok_cb, false)
  end
end

local function unlock_group_flood(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['flood'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> ارسال پیام مکرر آزاد شد </i>'
	return reply_msg(msg.id, '> <i> ارسال پیام مکرر آزاد شد </i>', ok_cb, false)
	 else
	-- return '<i>Flood</i> has been <b>unlocked</b>'
	 return reply_msg(msg.id, '> <i>Flood</i> has been <b>unlocked</b>', ok_cb, false)
  end
end

local function lock_group_arabic(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_arabic'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   -- return '<i> گفتگو به زبان فارسی در گروه قفل شد </i>'
	return reply_msg(msg.id, '> <i> گفتگو به زبان فارسی در گروه قفل شد </i>', ok_cb, false)
	 else
	 --return '<i>Arabic/Persian</i> has been <b>locked</b>'
	 return reply_msg(msg.id, '> <i>Arabic/Persian</i> has been <b>locked</b>', ok_cb, false)
  end
end

local function unlock_group_arabic(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_arabic'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   -- return '<i> گفتگو به زبان فارسی در گروه آزاد شد </i>'
	return reply_msg(msg.id, '> <i> گفتگو به زبان فارسی در گروه آزاد شد </i>', ok_cb, false)
	 else
	-- return '<i>Arabic/Persian</i> has been <b>unlocked</b>'
	 return reply_msg(msg.id, '> <i>Arabic/Persian</i> has been <b>unlocked</b>', ok_cb, false)
  end
end

local function lock_group_membermod(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_member'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  --return '<i> ورود عضو به سوپرگروه قفل شد </i>'
  return reply_msg(msg.id, '> <i> ورود عضو به سوپرگروه قفل شد </i>', ok_cb, false)
   else
	-- return 'SuperGroup <i>members</i> has been <b>locked</b>'
	 return reply_msg(msg.id, '> SuperGroup <i>members</i> has been <b>locked</b>', ok_cb, false)
end
end

local function unlock_group_membermod(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_member'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   -- return '<i> ورود عضو به سوپرگروه آزاد شد </i>'
	return reply_msg(msg.id, '> <i> ورود عضو به سوپرگروه آزاد شد </i>', ok_cb, false)
	 else
	 --return 'SuperGroup <i>members</i> has been <b>unlocked</b>'
	 return reply_msg(msg.id, '> SuperGroup <i>members</i> has been <b>unlocked</b>', ok_cb, false)
  end
end

local function lock_group_rtl(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['lock_rtl']
  if group_rtl_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_rtl'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   -- return '<i> RTL قفل شد </i>'
	return reply_msg(msg.id, '> <i> RTL قفل شد </i>', ok_cb, false)
	 else
	-- return '<i>RTL</i> has been <b>locked</b>'
	 return reply_msg(msg.id, '> <i>RTL</i> has been <b>locked</b>', ok_cb, false)
  end
end

local function unlock_group_rtl(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_rtl_lock = data[tostring(target)]['settings']['lock_rtl']
  if group_rtl_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_rtl'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   -- return '<i> RTL آزاد شد </i>'
	return reply_msg(msg.id, '> <i> RTL آزاد شد </i>', ok_cb, false)
	 else
	 --return '<i>RTL</i> has been <b>unlocked</b>'
	 return reply_msg(msg.id, '> <i>RTL</i> has been <b>unlocked</b>', ok_cb, false)
  end
end

local function lock_group_tgservice(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_tgservice_lock = data[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_tgservice'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   -- return '<i> حذف خودکار پیغام ورود و خروج افراد از گروه فعال شد </i>'
	return reply_msg(msg.id, '> <i> حذف خودکار پیغام ورود و خروج افراد از گروه فعال شد </i>', ok_cb, false)
	 else
	 --return '<i>Tgservice</i> has been <b>locked</b>'
	 return reply_msg(msg.id, '> <i>Tgservice</i> has been <b>locked</b>', ok_cb, false)
  end
end

local function unlock_group_tgservice(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_tgservice_lock = data[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_tgservice'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> حذف خودکار پیغام ورود و خروج افراد از گروه غیرفعال شد </i>'
	return reply_msg(msg.id, '> <i> حذف خودکار پیغام ورود و خروج افراد از گروه غیرفعال شد </i>', ok_cb, false)
	 else
	-- return '<i>Tgservice</i> has been <b>unlocked</b>'
	 return reply_msg(msg.id, '> <i>Tgservice</i> has been <b>unlocked</b>', ok_cb, false)
  end
end

local function lock_group_sticker(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_sticker_lock = data[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_sticker'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> ارسال استیکر قفل شد </i>'
	return reply_msg(msg.id, '> <i> ارسال استیکر قفل شد </i>', ok_cb, false)
	 else
	 --return '<i>Sticker</i> posting has been <b>locked</b>'
	 return reply_msg(msg.id, '> <i>Sticker</i> posting has been <b>locked</b>', ok_cb, false)
  end
end

local function unlock_group_sticker(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_sticker_lock = data[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_sticker'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   -- return '<i> ارسال استیکر آزاد شد </i>'
	return reply_msg(msg.id, '> <i> ارسال استیکر آزاد شد </i>', ok_cb, false)
	 else
	-- return '<i>Sticker</i> posting has been <b>unlocked</b>'
	 return reply_msg(msg.id, '> <i>Sticker</i> posting has been <b>unlocked</b>', ok_cb, false)
  end
end

local function lock_group_contacts(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_contacts_lock = data[tostring(target)]['settings']['lock_contacts']
  if group_contacts_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_contacts'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> ارسال شماره تلفن قفل شد </i>'
	return reply_msg(msg.id, '> <i> ارسال شماره تلفن قفل شد </i>', ok_cb, false)
	 else
	-- return '<i>Contact</i> posting has been <b>locked</b>'
	 return reply_msg(msg.id, '> <i>Contact</i> posting has been <b>locked</b>', ok_cb, false)
  end
end

local function unlock_group_contacts(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_contacts_lock = data[tostring(target)]['settings']['lock_contacts']
  if group_contacts_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return reply_msg(msg.id, '> <i> از قبل آزاد است </i>(لطفا مجدد سعی نکنید)', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['lock_contacts'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> ارسال شماره تلفن آزاد شد </i>'
	return reply_msg(msg.id, '> <i> ارسال شماره تلفن آزاد شد </i>', ok_cb, false)
	 else
	 --return '<i>Contact</i> posting has been <b>unlocked</b>'
	 return reply_msg(msg.id, '> <i>Contact</i> posting has been <b>unlocked</b>', ok_cb, false)
  end
end

local function enable_strict_rules(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_strict_lock = data[tostring(target)]['settings']['strict']
  if group_strict_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['strict'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> تنظیمات سخت گیرانه فعال شد </i>'
	return reply_msg(msg.id, '> <i> فعال سازی حالت اخراج کاربران فعال شد </i>\n<i> اکنون پس از ارسال موارد ممنوعه از گروه اخراج میشوند </i>', ok_cb, false)
	 else
	-- return '<b>Settings will be strictly enforced</b>'
	 return reply_msg(msg.id, '> <i>Activation mode users were fired</i>\n<b>Now, after sending the Forbidden fired</b>', ok_cb, false)
  end
end

local function disable_strict_rules(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_strict_lock = data[tostring(target)]['settings']['strict']
  if group_strict_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> 》از قبل آزاد است </i>(لطفا مجدد سعی نکنید)'
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['strict'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
     --return '<i> تنظیمات سخت گیرانه غیرفعال شد </i>'
	 return reply_msg(msg.id, '> <i> تغییرات اعمال شده لغو گردید </i>', ok_cb, false)
	 else
	 --return '<b>Settings will not be strictly enforced</b>'
	 return reply_msg(msg.id, '> <b>Changes made was canceled!</b>', ok_cb, false)
  end
end
------------strict ban----------------
local function enable_strictban_rules(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_strict_lock = data[tostring(target)]['settings']['strictban']
  if group_strict_lock == 'yes' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
   return reply_msg(msg.id, '> <i> از قبل قفل است </i>(لطفا مجدد سعی نکنید)تغییر یافت', ok_cb, false)
  else
  return reply_msg(msg.id, '> <b>Already is locked</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['strictban'] = 'yes'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    --return '<i> تنظیمات سخت گیرانه فعال شد </i>'
	return reply_msg(msg.id, '> <i> فعال سازی حالت مسدود سازی کاربران فعال شد </i>\n<i> اکنون پس از ارسال موارد ممنوعه از گروه مسدود میشوند </i>', ok_cb, false)
	 else
	-- return '<b>Settings will be strictly enforced</b>'
	 return reply_msg(msg.id, '> <i>Activation mode users were fired</i>\n<b>Now, after sending the Forbidden fired</b>', ok_cb, false)
  end
end

local function disable_strictban_rules(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local group_strict_lock = data[tostring(target)]['settings']['strictban']
  if group_strict_lock == 'no' then
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
    return '<i> 》از قبل آزاد است </i>(لطفا مجدد سعی نکنید)'
  else
  return reply_msg(msg.id, '> <b>Has already been released</b> <i>(Please do not try again)</i>', ok_cb, false)
  end
  end
    data[tostring(target)]['settings']['strictban'] = 'no'
    save_data(_config.moderation.data, data)
	local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
     --return '<i> تنظیمات سخت گیرانه غیرفعال شد </i>'
	return reply_msg(msg.id, '> <i> تغییرات اعمال شده لغو گردید </i>', ok_cb, false)
	 else
	 --return '<b>Settings will not be strictly enforced</b>'
	 return reply_msg(msg.id, '> <b>Changes made was canceled!</b>', ok_cb, false)
  end
end
--End supergroup locks

--'Set supergroup rules' function
local function set_lawsmod(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local data_cat = 'laws'
  data[tostring(target)][data_cat] = laws
  save_data(_config.moderation.data, data)
  local text = '<i> قوانین سوپرگروه تنظیم شد </i>'
  return reply_msg(msg.id, text, ok_cb, false)
end

--'Get supergroup rules' function
local function get_laws(msg, data)
  local data_cat = 'laws'
  if not data[tostring(msg.to.id)][data_cat] then
    local text = '> <i> قوانین برای گروه تنظیم نشده است </i> \n📜 <i> قوانین پیشفرض به این صورت است:</i> \n <b>1-</b> <i>No Flood.</i>\n <b>2-</b> <i>No Spam.</i>\n <b>3-</b> <i>Try to stay on topic.</i>'
	return reply_msg(msg.id, text, ok_cb, false)
  end
  local laws = data[tostring(msg.to.id)][data_cat]
  local group_name = data[tostring(msg.to.id)]['settings']['set_name']
   local hour = os.date("%M") * 15
 local laws_hash = 'laws:'..hour..':'..msg.from.id
 local is_laws = redis:get(laws_hash)
if is_laws then
    return reply_msg(msg.id, "🔖User (@"..msg.from.username..") You attempted too much! A few minutes to get the laws work", ok_cb, false)
     elseif not is_laws then
     redis:set(laws_hash, true)
  local laws = ' 🖋نام گروه: <b>'..group_name..'</b>\n 📜 قوانین گروه:\n\n'..laws:gsub("/n", " ")
 --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/laws.webp", ok_cb, false)
  reply_msg(msg.id, laws, ok_cb, false)
end
end

local function get_lawspv(msg, data)
  local data_cat = 'laws'
  if not data[tostring(msg.to.id)][data_cat] then
    local text = '> <i> قوانین برای گروه تنظیم نشده است </i> \n📜 <i> قوانین پیشفرض به این صورت است:</i> \n <b>1-</b> <i>No Flood.</i>\n <b>2-</b> <i>No Spam.</i>\n <b>3-</b> <i>Try to stay on topic.</i>'
	return reply_msg(msg.id, text, ok_cb, false)
  end
  local laws = data[tostring(msg.to.id)][data_cat]
  local group_name = data[tostring(msg.to.id)]['settings']['set_name']
  local text = group_name..' 🔹قوانین:\n\n'..laws:gsub("/n", " ")
  send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
  --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return reply_msg(msg.id,  "قوانین این گروه به خصوصی شما ارسال شد", ok_cb, false)
end

--'Set supergroup more' function
local function set_moremod(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local data_cat = 'more'
  data[tostring(target)][data_cat] = more
  save_data(_config.moderation.data, data)
  local text = 'اطلاعات جدید با موفقیت ذخیره شد'
  return reply_msg(msg.id, text, ok_cb, false)
end

--'Get supergroup more' function
local function get_more(msg, data)
  local data_cat = 'more'
  if not data[tostring(msg.to.id)][data_cat] then
    local text = 'اطلاعاتی در این بخش ذخیره نشده است'
	return reply_msg(msg.id, text, ok_cb, false)
  end
  local more = data[tostring(msg.to.id)][data_cat]
  local group_name = data[tostring(msg.to.id)]['settings']['set_name']
  local hour = os.date("%M") * 15
 local more_hash = 'more:'..hour..':'..msg.from.id
 local is_more = redis:get(more_hash)
if is_more then
    return "🔖#User (@"..msg.from.username..") You attempted too much! A few minutes later try again"
     elseif not is_more then
     redis:set(more_hash, true)
  local more = ' 🖋نام گروه: '..msg.to.title..'\n 🏷مطالب ذخیره شده :\n\n'..more:gsub("/n", " ")
  reply_msg(msg.id, more, ok_cb, false)
end
end

local function get_morepv(msg, data)
  local data_cat = 'more'
  if not data[tostring(msg.to.id)][data_cat] then
    local text = 'اطلاعاتی در این بخش ذخیره نشده است'
	return reply_msg(msg.id, text, ok_cb, false)
  end
  local more = data[tostring(msg.to.id)][data_cat]
  local group_name = data[tostring(msg.to.id)]['settings']['set_name']
  local text = ' 🏷مطالب ذخیره شده :\n\n'..more:gsub("/n", " ")
  send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
  --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "اطلاعات ذخیره شده در این بخش به خصوصی شما ارسال شد"
end

--'Set supergroup nerkh' function
local function set_nerkhmod(msg, data, target)
  if not is_owner(msg) then
    return
  end
  local data_cat = 'nerkh'
  data[tostring(target)][data_cat] = nerkh
  save_data(_config.moderation.data, data)
  local text = '💳نرخ فروش گروه با ربات با موفقیت ذخیره و تغییر یافت'
  return reply_msg(msg.id, text, ok_cb, false)
end

--'Get supergroup nerkh' function
local function get_nerkh(msg, data)
  local data_cat = 'nerkh'
  if not data[tostring(msg.to.id)][data_cat] then
    local text = '💰نرخ فروش گروه با این ربات ثبت نشده است\n با ادمین ارتباط برقرار کنید'
	--return reply_msg(msg.id, text, ok_cb, false)
  end
  local nerkh = data[tostring(msg.to.id)][data_cat]
  local group_name = data[tostring(msg.to.id)]['settings']['set_name']
  local hour = os.date("%M") * 10
 local nerkh_hash = 'nerkh:'..hour..':'..msg.from.id
 local is_nerkh = redis:get(nerkh_hash)
if is_nerkh then
    local text = "🔖#کاربر (@"..msg.from.username..") نیازی به ارسال دستور مجدد نیست! درخواست شما در پیام قبلی ارسال شده است :)"
	return reply_msg(msg.id, text, ok_cb, false)
     elseif not is_nerkh then
     redis:set(nerkh_hash, true)
  local nerkh = ' 💵نرخ فروش گروه با ربات Security BOT :\n\n'..nerkh:gsub("/n", " ")
  reply_msg(msg.id, nerkh, ok_cb, false)
end
end

local function get_nerkhpv(msg, data)
  local data_cat = 'nerkh'
  if not data[tostring(msg.to.id)][data_cat] then
    local text = '💰نرخ فروش گروه با این ربات ثبت نشده است\n با ادمین ارتباط برقرار کنید'
	return reply_msg(msg.id, text, ok_cb, false)
  end
  local nerkh = data[tostring(msg.to.id)][data_cat]
  local group_name = data[tostring(msg.to.id)]['settings']['set_name']
  local text = ' 💵نرخ فروش گروه با ربات Security BOT :\n\n'..nerkh:gsub("/n", " ")
  send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
  --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "نرخ فروش گروه با ربات Security BOT به خصوصی شما ارسال شد"
end

--Set supergroup to public or not public function
---------not found ! -----------
--Show supergroup settings; function
function show_supergroup_settingsmod(msg, target)
 	if not is_owner(msg) then
    	return
  	end
	local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	local bots_protection = "yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
     bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_rtl'] then
			data[tostring(target)]['settings']['lock_rtl'] = 'no'
		end
end
      if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tgservice'] then
			data[tostring(target)]['settings']['lock_tgservice'] = 'no'
		end
	end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_badwords'] then
			data[tostring(target)]['settings']['lock_badwords'] = 'no'
		end
end
--[[if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_hashtag'] then
			data[tostring(target)]['settings']['lock_hashtag'] = 'no'
		end
end]]
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_security'] then
			data[tostring(target)]['settings']['lock_security'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_public'] then
			data[tostring(target)]['settings']['lock_public'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_webpage'] then
			data[tostring(target)]['settings']['lock_webpage'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_linkpro'] then
			data[tostring(target)]['settings']['lock_linkpro'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
			data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_operator'] then
			data[tostring(target)]['settings']['lock_operator'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_support'] then
			data[tostring(target)]['settings']['lock_support'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_low'] then
			data[tostring(target)]['settings']['lock_low'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_high'] then
			data[tostring(target)]['settings']['lock_high'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_family'] then
			data[tostring(target)]['settings']['lock_family'] = 'no'
		end
end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_extalk'] then
			data[tostring(target)]['settings']['lock_extalk'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_speechfa'] then
			data[tostring(target)]['settings']['lock_speechfa'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_speechen'] then
			data[tostring(target)]['settings']['lock_speechen'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_kickme'] then
			data[tostring(target)]['settings']['lock_kickme'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_qa'] then
			data[tostring(target)]['settings']['lock_qa'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_dialogue'] then
			data[tostring(target)]['settings']['lock_dialogue'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_antispambot'] then
			data[tostring(target)]['settings']['lock_antispambot'] = 'no'
		end
	end
	   if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_commands'] then
			data[tostring(target)]['settings']['lock_commands'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_commandsuser'] then
			data[tostring(target)]['settings']['lock_commandsuser'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tags'] then
			data[tostring(target)]['settings']['lock_tags'] = 'no'
		end
end
  if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_all'] then
			data[tostring(target)]['settings']['lock_all'] = 'no'
		end
	end	
      if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_reply'] then
			data[tostring(target)]['settings']['lock_reply'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_member'] then
			data[tostring(target)]['settings']['lock_member'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['strict'] then
			data[tostring(target)]['settings']['strict'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['strictban'] then
			data[tostring(target)]['settings']['strictban'] = 'no'
		end
	end
	local Welcome = "yes"
    if  data[tostring(msg.to.id)]['welcome'] then
    Welcome = data[tostring(msg.to.id)]['welcome']
    end

    local expiretime = redis:hget('expiretime', get_receiver(msg))
    local expire = ''
  if not expiretime then
  expire = expire..'نامحدود!'
  else
   local now = tonumber(os.time())
   expire =  expire..math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
 end
	
	local gp_type = data[tostring(msg.to.id)]['group_type']
	
	local alirezapt = "links"..msg.from.id
  local cliapi = redis:get(alirezapt)
  
  local settings = data[tostring(target)]['settings']
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  local text = "<i> ⚙تنظیمات سوپرگروه </i> [<b>"..msg.to.title.."</b>] <i> (قفل ها) </i>:\n____________________\n》#قفل <i> کلمات توهین آمیز </i>: "..settings.lock_badwords.."\n》#قفل <i> ورود اعضا </i>: "..settings.lock_member.."\n》#قفل <i> عربی/فارسی </i>: "..settings.lock_arabic.."\n》#قفل <i> برچسب </i>: "..settings.lock_sticker.."\n》#قفل <i> امنیتی پیشرفته </i>: "..settings.lock_security.."\n》#تنظیمات <i> اخراج کاربر </i>: "..settings.strict.."\n》#تنظیمات <i> مسدود سازی کاربر </i>: "..settings.strictban.."\n》#قفل <i> هرزنامه </i>: "..settings.lock_spam.."\n》#قفل <i> ورود ربات </i>: "..bots_protection.."\n》#قفل <i> پیشرفته تبلیغات </i>: "..settings.lock_public.."\n#قفل <i> لینک </i> : "..settings.lock_link.."\n》#قفل <i> تگ </i>: "..settings.lock_tags.."\n》#قفل <i> دستورات </i>: "..settings.lock_commands.."\n》#قفل <i> دستورات کاربران </i>: "..settings.lock_commandsuser.."\n》#قفل <i> صفحات اینترنتی </i> : "..settings.lock_webpage.."\n》#قفل <i> ارسال لینک پیشرفته </i>: "..settings.lock_linkpro.."\n》#قفل <i> تبلیغات اپراتور </i>: "..settings.lock_operator.."\n》#قفل <i> ورود ربات(Cli) </i>: "..settings.lock_antispambot.."\n____________________\nBOT VERSION: 3.6"
   local text = string.gsub(text,'yes','|<code>فعال</code>|') --》#قفل <i> راست به چپ </i>: "..settings.lock_rtl.."|\n》#Lock <b> RTL </b>: "..settings.lock_rtl.."|\n》#قفل <i> خدمات تلگرام </i> : "..settings.lock_tgservice.."|\n》#Lock <b> TGservice </b>: "..settings.lock_tgservice.."
  local text = string.gsub(text,'no','|<code>غیرفعال</code>|')
  return reply_msg(msg.id, text, ok_cb, false)
else
local text = "<i> ⚙Settings SuperGroup </i> [<b>"..msg.to.title.."</b>] <i> (Lock) </i>:\n____________________\n》#Lock <b> Badwords </b>: "..settings.lock_badwords.."\n》#Lock <b> Join Members </b>: "..settings.lock_member.."\n》#Lock <b> Arabic/Persian </b>: "..settings.lock_arabic.."\n》#Lock <b> Stickers </b>: "..settings.lock_sticker.."\n》#Lock <b> Security Pro </b>: "..settings.lock_security.."\n》#Lock <b> User Kick </b>: "..settings.strict.."\n》#Lock <b> User Ban </b>: "..settings.strictban.."\n》#Lock <b> Spam </b>: "..settings.lock_spam.."\n》#Lock <b> join BOTs(API) </b>: "..bots_protection.."\n》#Lock <b> publicy </b>: "..settings.lock_public.."\n》#Lock <b> links </b>: "..settings.lock_link.."\n》#Lock <b> Tags </b>: "..settings.lock_tags.."\n》#Lock <b> Commands </b>: "..settings.lock_commands.."\n》#Lock <b> Commandsuser </b>: "..settings.lock_commandsuser.."\n》#Lock <b> Webpage </b>: "..settings.lock_webpage.."\n》#Lock <b> links Pro </b>: "..settings.lock_linkpro.."\n》#Lock <b> Operator </b>: "..settings.lock_operator.."\n》#Lock <b> entry robot(Cli) </b>: "..settings.lock_antispambot.."\n____________________\nBOT VERSION: 3.6"
  --reply_msg(msg.id,"<code>⚙Settings SuperGroup ["..msg.to.title.."] (Lock):\n____________________\n》#Lock RTL: "..settings.lock_rtl.."\n》#Lock TGservice : "..settings.lock_tgservice.."\n》#Lock Badwords: "..settings.lock_badwords.."\n》#Lock Join Members: "..settings.lock_member.."\n》#Lock Arabic/Persian: "..settings.lock_arabic.."\n》#Lock Stickers: "..settings.lock_sticker.."\n》#Lock Security Pro: "..settings.lock_security.."\n》#Lock Strict: "..settings.strict.."\n》#Lock Spam: "..settings.lock_spam.."\n》#Lock join BOTs(API): "..bots_protection.."\n》#Lock publicy: "..settings.lock_public.."\n》#Lock links : "..settings.lock_link.."\n》#Lock Tags: "..settings.lock_tags.."\n》#Lock Commands: "..settings.lock_commands.."\n》#Lock Webpage : "..settings.lock_webpage.."\n》#Lock links Pro: "..settings.lock_linkpro.."\n》#Lock Operator: "..settings.lock_operator.."\n》#Lock entry robot(Cli): "..settings.lock_antispambot.."\n____________________\nBOT VERSION: 3.6</code>",ok_cb,true)
  --local text = string.gsub(text,'yes','[Yes | 🔐]')
  --local text = string.gsub(text,'no','[No | 🔓]')
  local text = string.gsub(text,'yes','|<code>Enable</code>|')
  local text = string.gsub(text,'no','|<code>Disable</code>|')
  return reply_msg(msg.id, text, ok_cb, false)
end
end

function show_supergroup_settingsmodar(msg, target)
 	if not is_owner(msg) then
    	return
  	end
	local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	local bots_protection = "yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
     bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_rtl'] then
			data[tostring(target)]['settings']['lock_rtl'] = 'no'
		end
end
      if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tgservice'] then
			data[tostring(target)]['settings']['lock_tgservice'] = 'no'
		end
	end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_badwords'] then
			data[tostring(target)]['settings']['lock_badwords'] = 'no'
		end
end
--[[if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_hashtag'] then
			data[tostring(target)]['settings']['lock_hashtag'] = 'no'
		end
end]]
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_security'] then
			data[tostring(target)]['settings']['lock_security'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_webpage'] then
			data[tostring(target)]['settings']['lock_webpage'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_linkpro'] then
			data[tostring(target)]['settings']['lock_linkpro'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
			data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_operator'] then
			data[tostring(target)]['settings']['lock_operator'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_support'] then
			data[tostring(target)]['settings']['lock_support'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_low'] then
			data[tostring(target)]['settings']['lock_low'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_high'] then
			data[tostring(target)]['settings']['lock_high'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_family'] then
			data[tostring(target)]['settings']['lock_family'] = 'no'
		end
end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_extalk'] then
			data[tostring(target)]['settings']['lock_extalk'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_kickme'] then
			data[tostring(target)]['settings']['lock_kickme'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_qa'] then
			data[tostring(target)]['settings']['lock_qa'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_dialogue'] then
			data[tostring(target)]['settings']['lock_dialogue'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_antispambot'] then
			data[tostring(target)]['settings']['lock_antispambot'] = 'no'
		end
	end
	   if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_commands'] then
			data[tostring(target)]['settings']['lock_commands'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_commandsuser'] then
			data[tostring(target)]['settings']['lock_commandsuser'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tags'] then
			data[tostring(target)]['settings']['lock_tags'] = 'no'
		end
end
  if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_all'] then
			data[tostring(target)]['settings']['lock_all'] = 'no'
		end
	end	
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_member'] then
			data[tostring(target)]['settings']['lock_member'] = 'no'
		end
	end
	local Welcome = "yes"
    if  data[tostring(msg.to.id)]['welcome'] then
    Welcome = data[tostring(msg.to.id)]['welcome']
    end

    local expiretime = redis:hget('expiretime', get_receiver(msg))
    local expire = ''
  if not expiretime then
  expire = expire..'لم يتم تعيين تاريخ انتهاء الصلاحية'
  else
   local now = tonumber(os.time())
   expire =  expire..math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
 end
	
	local gp_type = data[tostring(msg.to.id)]['group_type']
	
  local settings = data[tostring(target)]['settings']
  local text = "⚙إعدادات الذائع الصيت (قفل):\n____________________\n》#منع سوء الكلمات: "..settings.lock_badwords.."\n》#قفل تاريخ الأعضاء: "..settings.lock_member.."\n》#قفل العربية: "..settings.lock_arabic.."\n》#ملصقات قفل: "..settings.lock_sticker.."\n》#الأمن قفل برو: "..settings.lock_security.."\n》#قفل صارمة: "..settings.strict.."\n》#كتلة البريد المزعج: "..settings.lock_spam.."\n》#قفل انضمام السير: "..bots_protection.."\n》#وصلات قفل : "..settings.lock_link.."\n》#علامات القفل: "..settings.lock_tags.."\n》#قفل أوامر: "..settings.lock_commands.."\n》#قفل أوامر الأعضاء: "..settings.lock_commandsuser.."\n》#صفحة ويب قفل : "..settings.lock_webpage.."\n》#وصلات قفل برو: "..settings.lock_linkpro.."\n》#مشغل القفل: "..settings.lock_operator.."\n》#قفل دخول الروبوت (CLI): "..settings.lock_antispambot.."\n____________________\nالأمناء صيغة: 3.6\nسودو : @AliReza_PT"
  local text = string.gsub(text,'yes','[القفل | 🔐]')
  local text = string.gsub(text,'no','[مفتوح | 🔓]')
  return reply_msg(msg.id, text, ok_cb, false)
end

function show_supergroup_settingsmodpv(msg, target)
 	if not is_owner(msg) then
    	return
  	end
	local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	local bots_protection = "yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
     bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_rtl'] then
			data[tostring(target)]['settings']['lock_rtl'] = 'no'
		end
end
      if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tgservice'] then
			data[tostring(target)]['settings']['lock_tgservice'] = 'no'
		end
	end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_badwords'] then
			data[tostring(target)]['settings']['lock_badwords'] = 'no'
		end
end
--[[if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_hashtag'] then
			data[tostring(target)]['settings']['lock_hashtag'] = 'no'
		end
end]]
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_security'] then
			data[tostring(target)]['settings']['lock_security'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_webpage'] then
			data[tostring(target)]['settings']['lock_webpage'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_linkpro'] then
			data[tostring(target)]['settings']['lock_linkpro'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
			data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_operator'] then
			data[tostring(target)]['settings']['lock_operator'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_support'] then
			data[tostring(target)]['settings']['lock_support'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_low'] then
			data[tostring(target)]['settings']['lock_low'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_high'] then
			data[tostring(target)]['settings']['lock_high'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_family'] then
			data[tostring(target)]['settings']['lock_family'] = 'no'
		end
end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_extalk'] then
			data[tostring(target)]['settings']['lock_extalk'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_kickme'] then
			data[tostring(target)]['settings']['lock_kickme'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_qa'] then
			data[tostring(target)]['settings']['lock_qa'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_dialogue'] then
			data[tostring(target)]['settings']['lock_dialogue'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_antispambot'] then
			data[tostring(target)]['settings']['lock_antispambot'] = 'no'
		end
	end
	   if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_commands'] then
			data[tostring(target)]['settings']['lock_commands'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_commandsuser'] then
			data[tostring(target)]['settings']['lock_commandsuser'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tags'] then
			data[tostring(target)]['settings']['lock_tags'] = 'no'
		end
end
  if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_all'] then
			data[tostring(target)]['settings']['lock_all'] = 'no'
		end
	end	
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_member'] then
			data[tostring(target)]['settings']['lock_member'] = 'no'
		end
	end
	local Welcome = "yes"
    if  data[tostring(msg.to.id)]['welcome'] then
    Welcome = data[tostring(msg.to.id)]['welcome']
    end

    local expiretime = redis:hget('expiretime', get_receiver(msg))
    local expire = ''
  if not expiretime then
  expire = expire..'نامحدود!'
  else
   local now = tonumber(os.time())
   expire =  expire..math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
 end
	
	local gp_type = data[tostring(msg.to.id)]['group_type']
	
  local settings = data[tostring(target)]['settings']
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  local text = "⚙تنظیمات سوپرگروه ["..msg.to.title.."] (قفل ها):\n____________________\nℹ️#قفل راست به چپ: "..settings.lock_rtl.."\nℹ️#قفل خدمات تلگرام : "..settings.lock_tgservice.."\nℹ️#قفل کلمات توهین آمیز: "..settings.lock_badwords.."\nℹ️#قفل ورود اعضا: "..settings.lock_member.."\nℹ️#قفل عربی/فارسی: "..settings.lock_arabic.."\nℹ️#قفل برچسب: "..settings.lock_sticker.."\nℹ️#قفل امنیتی پیشرفته: "..settings.lock_security.."\nℹ️#تنظیمات سخت گیرانه: "..settings.strict.."\nℹ️#قفل هرزنامه: "..settings.lock_spam.."\nℹ️#قفل ورود ربات: "..bots_protection.."\nℹ️#قفل پیشرفته تبلیغات: "..settings.lock_public.."\nℹ️#قفل لینک : "..settings.lock_link.."\nℹ️#قفل تگ: "..settings.lock_tags.."\nℹ️#قفل دستورات: "..settings.lock_commands.."\nℹ️#قفل دستورات کاربران: "..settings.lock_commandsuser.."\nℹ️#قفل صفحات اینترنتی : "..settings.lock_webpage.."\nℹ️#قفل ارسال لینک پیشرفته: "..settings.lock_linkpro.."\nℹ️#قفل تبلیغات اپراتور: "..settings.lock_operator.."\nℹ️#قفل ورود ربات(Cli): "..settings.lock_antispambot.."\n____________________\nBOT VERSION: 3.6"
   local text = string.gsub(text,'yes','[قفل | 🔐]')
  local text = string.gsub(text,'no','[آزاد | 🔓]')
  send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
  --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "ℹ️تنظیمات مربوط به قفل این سوپرگروه در خصوصی ارسال شد(Fa)"
else
local text = "⚙Settings SuperGroup ["..msg.to.title.."]  (Lock):\n____________________\n》#Lock RTL: "..settings.lock_rtl.."\n》#Lock TGservice : "..settings.lock_tgservice.."\n》#Lock Badwords: "..settings.lock_badwords.."\n》#Lock Join Members: "..settings.lock_member.."\n》#Lock Arabic/Persian: "..settings.lock_arabic.."\n》#Lock Stickers: "..settings.lock_sticker.."\n》#Lock Security Pro: "..settings.lock_security.."\n》#Lock Strict: "..settings.strict.."\n》#Lock Spam: "..settings.lock_spam.."\n》#Lock join BOTs(API): "..bots_protection.."\n》#Lock publicy: "..settings.lock_public.."\n》#Lock links : "..settings.lock_link.."\n》#Lock Tags: "..settings.lock_tags.."\n》#Lock Commands: "..settings.lock_commands.."\n》#Lock Commandsuser: "..settings.lock_commandsuser.."\n》#Lock Webpage : "..settings.lock_webpage.."\n》#Lock links Pro: "..settings.lock_linkpro.."\n》#Lock Operator: "..settings.lock_operator.."\n》#Lock entry robot(Cli): "..settings.lock_antispambot.."\n____________________\nBOT VERSION: 3.6"
  local text = string.gsub(text,'yes','[Yes | 🔐]')
  local text = string.gsub(text,'no','[No | 🔓]')
  send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
  --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "ℹ️تنظیمات مربوط به قفل این سوپرگروه در خصوصی ارسال شد(En)"
end
end

function show_supergroup_settingspmore(msg, target)
 	if not is_owner(msg) then
    	return
  	end
   local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	local bots_protection = "yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
     bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_low'] then
			data[tostring(target)]['settings']['lock_low'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_high'] then
			data[tostring(target)]['settings']['lock_high'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_family'] then
			data[tostring(target)]['settings']['lock_family'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_all'] then
			data[tostring(target)]['settings']['lock_all'] = 'no'
		end
	end	
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
			data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_pornword'] then
			data[tostring(target)]['settings']['lock_pornword'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_support'] then
			data[tostring(target)]['settings']['lock_support'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_kickme'] then
			data[tostring(target)]['settings']['lock_kickme'] = 'no'
		end
end
	local Welcome = "yes"
    if  data[tostring(msg.to.id)]['welcome'] then
    Welcome = data[tostring(msg.to.id)]['welcome']
    end

    local expiretime = redis:hget('expiretime', get_receiver(msg))
    local expire = ''
  if not expiretime then
  expire = expire..'نامحدود!'
  else
   local now = tonumber(os.time())
   expire =  expire..math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
 end

local gp_type = data[tostring(msg.to.id)]['group_type']

local settings = data[tostring(target)]['settings']
local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  local text = "⚙تنظیمات ["..msg.to.title.."] (کارکرد+دیگر تنظیمات):\n____________________\n🔺#قفل ارسال پیام متوالی: "..settings.flood.."\n🔻#حساسیت نسبت به ارسال پیام : "..NUM_MSG_MAX.."\n\n↙️#قفل تصاویر پورن: "..settings.lock_porn.."\n⬅️#قفل کلمات(مستهجن): "..settings.lock_pornword.."\n↖️#قفل پشتیبانی(Sudo): "..settings.lock_support.."\n🔀#قفل استفاده از دستور(kickme): "..settings.lock_kickme.."\n\n____Switch & Traffic Mod_____\n🔄#کارکرد ترافیک سنگین: "..settings.lock_high.."\n🔄#کارکرد ترافیک سبک: "..settings.lock_low.."\n🔄#حالت خانواده: "..settings.lock_family.."\nℹ️#قفل تمامی تنظیمات: "..settings.lock_all.."\n\n_____درباره گروه_____\n↙️#پیغام خوش آمد گویی: "..Welcome.."\n⬅️#نوع گروه: "..gp_type.."\n↖️#تاریخ انقضای گروه: "..expire.." روز دیگر\n____________________\nBOT VERSION: 3.6"
  local text = string.gsub(text,'yes','[قفل | 🔐]')
  local text = string.gsub(text,'no','[آزاد | 🔓]')
  return reply_msg(msg.id, text, ok_cb, false)
else
local text = "⚙Settings ["..msg.to.title.."] (Function + other settings):\n____________________\n🔺#Lock flood: "..settings.flood.."\n🔻#Flood sensitivity : "..NUM_MSG_MAX.."\n\n》#Lock porn pictures: "..settings.lock_porn.."\n》#Lock porn Words: "..settings.lock_pornword.."\n》#Lock Support(Sudo): "..settings.lock_support.."\n》#Lock Kickme: "..settings.lock_kickme.."\n\n____Switch & Traffic Mod_____\n》#Heavy traffic operation: "..settings.lock_high.."\n》#Light traffic operation: "..settings.lock_low.."\n》#Mode family: "..settings.lock_family.."\n》#Lock All Settings: "..settings.lock_all.."\n\n_____About Group_____\n》#Welcome Message: "..Welcome.."\n》#Type Group: "..gp_type.."\n》#Group expiration date: "..expire.." other day\n____________________\nBOT VERSION: 3.6"
  local text = string.gsub(text,'yes','[Yes | 🔐]')
  local text = string.gsub(text,'no','[No | 🔓]')
  return reply_msg(msg.id, text, ok_cb, false)
end
end

function show_supergroup_settingspmorepv(msg, target)
 	if not is_owner(msg) then
    	return
  	end
   local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	local bots_protection = "yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
     bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_low'] then
			data[tostring(target)]['settings']['lock_low'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_high'] then
			data[tostring(target)]['settings']['lock_high'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_family'] then
			data[tostring(target)]['settings']['lock_family'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_all'] then
			data[tostring(target)]['settings']['lock_all'] = 'no'
		end
	end	
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
			data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_pornword'] then
			data[tostring(target)]['settings']['lock_pornword'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_support'] then
			data[tostring(target)]['settings']['lock_support'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_kickme'] then
			data[tostring(target)]['settings']['lock_kickme'] = 'no'
		end
end
	local Welcome = "yes"
    if  data[tostring(msg.to.id)]['welcome'] then
    Welcome = data[tostring(msg.to.id)]['welcome']
    end

    local expiretime = redis:hget('expiretime', get_receiver(msg))
    local expire = ''
  if not expiretime then
  expire = expire..'The expiry date is not set'
  else
   local now = tonumber(os.time())
   expire =  expire..math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
 end

local gp_type = data[tostring(msg.to.id)]['group_type']

local settings = data[tostring(target)]['settings']
local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  local text = "⚙تنظیمات ["..msg.to.title.."] (کارکرد+دیگر تنظیمات):\n____________________\n🔺#قفل ارسال پیام متوالی: "..settings.flood.."\n🔻#حساسیت نسبت به ارسال پیام : "..NUM_MSG_MAX.."\n\n↙️#قفل تصاویر پورن: "..settings.lock_porn.."\n⬅️#قفل کلمات(مستهجن): "..settings.lock_pornword.."\n↖️#قفل پشتیبانی(Sudo): "..settings.lock_support.."\n🔀#قفل استفاده از دستور(kickme): "..settings.lock_kickme.."\n\n____Switch & Traffic Mod_____\n🔄#کارکرد ترافیک سنگین: "..settings.lock_high.."\n🔄#کارکرد ترافیک سبک: "..settings.lock_low.."\n🔄#حالت خانواده: "..settings.lock_family.."\nℹ️#قفل تمامی تنظیمات: "..settings.lock_all.."\n\n_____درباره گروه_____\n↙️#پیغام خوش آمد گویی: "..Welcome.."\n⬅️#نوع گروه: "..gp_type.."\n↖️#تاریخ انقضای گروه: "..expire.." روز دیگر\n____________________\nBOT VERSION: 3.6"
  local text = string.gsub(text,'yes','[قفل | 🔐]')
  local text = string.gsub(text,'no','[آزاد | 🔓]')
  send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
  --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "ℹ️تنظیمات مروبط به تنظیمات بیشتر این سوپرگروه در خصوصی ارسال شد(Fa)"
else
local text = "⚙Settings ["..msg.to.title.."] (Function + other settings):\n____________________\n🔺#Lock flood: "..settings.flood.."\n🔻#Flood sensitivity : "..NUM_MSG_MAX.."\n\n》#Lock porn pictures: "..settings.lock_porn.."\n》#Lock porn Words: "..settings.lock_pornword.."\n》#Lock Support(Sudo): "..settings.lock_support.."\n》#Lock Kickme: "..settings.lock_kickme.."\n\n____Switch & Traffic Mod_____\n》#Heavy traffic operation: "..settings.lock_high.."\n》#Light traffic operation: "..settings.lock_low.."\n》#Mode family: "..settings.lock_family.."\n》#Lock All Settings: "..settings.lock_all.."\n\n_____About Group_____\n》#Welcome Message: "..Welcome.."\n》#Type Group: "..gp_type.."\n》#Group expiration date: "..expire.." other day\n____________________\nBOT VERSION: 3.6"
  local text = string.gsub(text,'yes','[Yes | 🔐]')
  local text = string.gsub(text,'no','[No | 🔓]')
  send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
  --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "تنظیمات مروبط به تنظیمات بیشتر این سوپرگروه در خصوصی ارسال شد(En)"
end
end

function show_supergroup_settingsgeneral(msg, target)
 	if not is_owner(msg) then
    	return
  	end
   local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	local bots_protection = "yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
     bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_qa'] then
			data[tostring(target)]['settings']['lock_qa'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_dialogue'] then
			data[tostring(target)]['settings']['lock_dialogue'] = 'no'
		end
	end

local settings = data[tostring(target)]['settings']
local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  local text = "⚙تنظیمات سوپرگروه (پخش عمومی):\n____________________\n🛄#قفل پرسش و پاسخ(گروه): "..settings.lock_qa.."\n🛄#قفل کمکی متن(گفتگو): "..settings.lock_dialogue.."\n🛄#بخش های جدید بزودی: ❌".."\n🛄#بخش های جدید بزودی: ❌".."\n____________________\nBOT VERSION: 3.6"
  local text = string.gsub(text,'yes','✅')
  local text = string.gsub(text,'no','❌')
  return reply_msg(msg.id, text, ok_cb, false)
else
local text = "⚙Super Group Settings (General):\n____________________\n》#Lock FAQ (in the group): "..settings.lock_qa.."\n》#Text auxiliary lock (dialogue): "..settings.lock_dialogue.."\n》#The new section soon: ❌".."\n》#The new section soon: ❌".."\n____________________\nBOT VERSION: 3.6"
  local text = string.gsub(text,'yes','✅')
  local text = string.gsub(text,'no','❌')
  return reply_msg(msg.id, text, ok_cb, false)
end
end

function show_supergroup_settingsgeneralpv(msg, target)
 	if not is_owner(msg) then
    	return
  	end
   local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	local bots_protection = "yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
     bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_qa'] then
			data[tostring(target)]['settings']['lock_qa'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_dialogue'] then
			data[tostring(target)]['settings']['lock_dialogue'] = 'no'
		end
	end

local settings = data[tostring(target)]['settings']
local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  local text = "⚙تنظیمات سوپرگروه (پخش عمومی):\n____________________\n🛄#قفل پرسش و پاسخ(گروه): "..settings.lock_qa.."\n🛄#قفل کمکی متن(گفتگو): "..settings.lock_dialogue.."\n🛄#بخش های جدید بزودی: ❌".."\n🛄#بخش های جدید بزودی: ❌".."\n____________________\nBOT VERSION: 3.6"
  local text = string.gsub(text,'yes','✅')
  local text = string.gsub(text,'no','❌')
   send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
   --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "ℹ️تنظیمات مربوط به پخش عمومی این سوپرگروه به خصوصی شما ارسال شد(Fa)"
else
 local text = "⚙Super Group Settings (General):\n____________________\n》#Lock FAQ (in the group): "..settings.lock_qa.."\n》#Text auxiliary lock (dialogue): "..settings.lock_dialogue.."\n》#The new section soon: ❌".."\n》#The new section soon: ❌".."\n____________________\nBOT VERSION: 3.6"
  local text = string.gsub(text,'yes','✅')
  local text = string.gsub(text,'no','❌')
   send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
   --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "ℹ️تنظیمات مربوط به پخش عمومی این سوپرگروه به خصوصی شما ارسال شد(En)"
end
end

--Show supergroup settingsall; function
function show_supergroup_settingsall(msg, target)
 	if not is_owner(msg) then
    	return
  	end
	local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	local bots_protection = "yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
     bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_rtl'] then
			data[tostring(target)]['settings']['lock_rtl'] = 'no'
		end
end
      if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tgservice'] then
			data[tostring(target)]['settings']['lock_tgservice'] = 'no'
		end
	end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_badwords'] then
			data[tostring(target)]['settings']['lock_badwords'] = 'no'
		end
end
--[[if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_hashtag'] then
			data[tostring(target)]['settings']['lock_hashtag'] = 'no'
		end
end]]
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_security'] then
			data[tostring(target)]['settings']['lock_security'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_public'] then
			data[tostring(target)]['settings']['lock_public'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_webpage'] then
			data[tostring(target)]['settings']['lock_webpage'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_linkpro'] then
			data[tostring(target)]['settings']['lock_linkpro'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
			data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_operator'] then
			data[tostring(target)]['settings']['lock_operator'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_support'] then
			data[tostring(target)]['settings']['lock_support'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_low'] then
			data[tostring(target)]['settings']['lock_low'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_high'] then
			data[tostring(target)]['settings']['lock_high'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_family'] then
			data[tostring(target)]['settings']['lock_family'] = 'no'
		end
end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_extalk'] then
			data[tostring(target)]['settings']['lock_extalk'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_speechfa'] then
			data[tostring(target)]['settings']['lock_speechfa'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_speechen'] then
			data[tostring(target)]['settings']['lock_speechen'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_kickme'] then
			data[tostring(target)]['settings']['lock_kickme'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_qa'] then
			data[tostring(target)]['settings']['lock_qa'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_dialogue'] then
			data[tostring(target)]['settings']['lock_dialogue'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_antispambot'] then
			data[tostring(target)]['settings']['lock_antispambot'] = 'no'
		end
	end
	   if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_commands'] then
			data[tostring(target)]['settings']['lock_commands'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_commandsuser'] then
			data[tostring(target)]['settings']['lock_commandsuser'] = 'no'
		end
	end
  if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_all'] then
			data[tostring(target)]['settings']['lock_all'] = 'no'
		end
	end	
      if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_reply'] then
			data[tostring(target)]['settings']['lock_reply'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_member'] then
			data[tostring(target)]['settings']['lock_member'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_low'] then
			data[tostring(target)]['settings']['lock_low'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_high'] then
			data[tostring(target)]['settings']['lock_high'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_family'] then
			data[tostring(target)]['settings']['lock_family'] = 'no'
		end
end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
			data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_pornword'] then
			data[tostring(target)]['settings']['lock_pornword'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_support'] then
			data[tostring(target)]['settings']['lock_support'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tags'] then
			data[tostring(target)]['settings']['lock_tags'] = 'no'
		end
end
	local Welcome = "yes"
    if  data[tostring(msg.to.id)]['welcome'] then
    Welcome = data[tostring(msg.to.id)]['welcome']
    end

    local expiretime = redis:hget('expiretime', get_receiver(msg))
    local expire = ''
  if not expiretime then
  expire = expire..'0'
  else
   local now = tonumber(os.time())
   expire =  expire..math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
 end
	
	local gp_type = data[tostring(msg.to.id)]['group_type']
	
	local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then
      return '>لینک گروه ('..msg.to.id..') ثبت نشده است!'
       end
	   
	  -- local data_cat = 'rules'  
	--local group_rules = data[tostring(msg.to.id)][data_cat]
        local group_owner = data[tostring(msg.to.id)]['set_owner']
       if not group_owner then 
         return 
       end
	   
	local adminslist = ''
for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
  adminslist = adminslist .. '> '.. v ..' ('..k..')\n'
end

  local settings = data[tostring(target)]['settings']
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  local text = ">تنظیمات کلی سوپرگروه\n____________________\n>نام گروه: ["..msg.to.title.."]\n>شناسه گروه ["..msg.to.id.."]\n____________________\n>قفل ها:\n》قفل راست به چپ: "..settings.lock_rtl.."\n》قفل خدمات تلگرام : "..settings.lock_tgservice.."\n》قفل کلمات توهین آمیز: "..settings.lock_badwords.."\n》قفل ورود اعضا: "..settings.lock_member.."\n》قفل عربی/فارسی: "..settings.lock_arabic.."\n》قفل برچسب: "..settings.lock_sticker.."\n》قفل امنیتی پیشرفته: "..settings.lock_security.."\n》تنظیمات سخت گیرانه: "..settings.strict.."\n》قفل هرزنامه: "..settings.lock_spam.."\n》قفل ورود ربات: "..bots_protection.."\n》قفل پیشرفته تبلیغات: "..settings.lock_public.."\n》قفل لینک : "..settings.lock_link.."\n》قفل تگ: "..settings.lock_tags.."\n》قفل دستورات: "..settings.lock_commands.."\n》قفل دستورات کاربران: "..settings.lock_commandsuser.."\n》قفل صفحات اینترنتی : "..settings.lock_webpage.."\n》قفل ارسال لینک پیشرفته: "..settings.lock_linkpro.."\n》قفل تبلیغات اپراتور: "..settings.lock_operator.."\n》قفل ورود ربات(Cli): "..settings.lock_antispambot.."\n》قفل پرسش و پاسخ(گروه): "..settings.lock_qa.."\n》قفل کمکی متن(گفتگو): "..settings.lock_dialogue.."\n》قفل ارسال پیام متوالی: "..settings.flood.."\n》حساسیت نسبت به ارسال پیام : "..NUM_MSG_MAX.."\n》قفل تصاویر پورن: "..settings.lock_porn.."\n》قفل کلمات(مستهجن): "..settings.lock_pornword.."\n》قفل پشتیبانی(Sudo): "..settings.lock_support.."\n》قفل استفاده از دستور(kickme): "..settings.lock_kickme.."\n》کارکرد ترافیک سنگین: "..settings.lock_high.."\n》کارکرد ترافیک سبک: "..settings.lock_low.."\n》حالت خانواده: "..settings.lock_family.."\n》قفل تمامی تنظیمات: "..settings.lock_all.."\n》پیغام خوش آمد گویی: "..Welcome.."\n》نوع گروه: "..gp_type.."\n》تاریخ انقضای گروه: "..expire.." روز دیگر\n>تعداد ادمین ها: "..result.admins_count.."\n>تعداد کاربران: "..result.participants_count.."\n>تعداد کاربران اخراج شده: "..result.kicked_count.."\nمالک گروه: "..group_owner.."\nلینک گروه: "..group_link.."\nلیست مدیران:\n "..adminslist.."____________________\nBOT VERSION: 3.6"
   local text = string.gsub(text,'yes','[قفل | 🔐]')
  local text = string.gsub(text,'no','[آزاد | 🔓]')
  return reply_msg(msg.id, text, ok_cb, false)
else
local text = "><b>General Settings SuperGroup</b>\n____________________\n><b> Group name: </b> ["..msg.to.title.."]\n><b>Group ID:</b> ["..msg.to.id.."]\n____________________\n><b>Lock(s):</b>\n》<i>Lock RTL:</i> "..settings.lock_rtl.."\n》<i>Lock TGservice:</i> "..settings.lock_tgservice.."\n》<i>Lock Badwords:</i> "..settings.lock_badwords.."\n》<i>Lock Join Members:</i> ".."\n》<i>Lock Arabic/Persian:</i> "..settings.lock_arabic.."\n》<i>Lock Stickers:</i> "..settings.lock_sticker.."\n》<i>Lock Security Pro:</i> "..settings.lock_security.."\n》<i>Lock Strict:</i> "..settings.strict.."\n》<i>Lock Spam:</i> "..settings.lock_spam.."\n》<i>Lock join BOTs(API):</i> "..bots_protection.."\n》<i>Lock publicy pro:</i> "..settings.lock_public.."\n》<i>Lock links:</i> "..settings.lock_link.."\n》<i>Lock Tags:</i> "..settings.lock_tags.."\n》<i>Lock Commands:</i> "..settings.lock_commands.."\n》<i>Lock Commands user:</i> ".."\n》<i>Lock Webpage:</i> "..settings.lock_webpage.."\n》<i>Lock links Pro:</i> "..settings.lock_linkpro.."\n》<i>Lock Operator:</i> "..settings.lock_operator.."\n》<i>Lock entry robot(Cli):</i> "..settings.lock_antispambot.."\n》<i>Lock FAQ (in the group):</i> "..settings.lock_qa.."\n》<i>Text auxiliary lock (dialogue):</i> "..settings.lock_dialogue.."\n》<i>Lock flood:</i> "..settings.flood.."\n》<i>Flood sensitivity:</i> "..NUM_MSG_MAX.."\n》<i>Lock porn pictures:</i> "..settings.lock_porn.."\n》<i>Lock porn Words:</i> ".."\n》<i>Lock Support(Sudo):</i> "..settings.lock_support.."\n》<i>Lock Kickme command:</i> "..settings.lock_kickme.."\n》<i>Heavy traffic operation:</i> "..settings.lock_high.."\n》<i>Light traffic operation:</i> "..settings.lock_low.."\n》<i>Mode family:</i> "..settings.lock_family.."\n》<i>Lock All Settings:</i> ".."\n____________________\n》<i>Welcome Message:</i> "..Welcome.."\n》<i>Type Group:</i> ["..gp_type.."]\n》<i>Group expiry date:</i> ["..expire.."] other day\n____________________\n> <b> Administrators: </b> [Fault]".."\n> <b> number of users: </b> [Fault]".."\n> <b> Members expelled: </b> [Fault]".."\n____________________\n> <b> Group Owner: </b> ["..group_owner.."]\n> <b> Group link: </b>  ["..group_link.."]\n____________________\n> <b> Managers list: </b> "..adminslist.."\n____________________\n> <b> Group Rules: </b> [".."] \n____________________\n<i>BOT VERSION: 3.6</i>"
  --reply_msg(msg.id,"<code>⚙Settings SuperGroup ["..msg.to.title.."] (Lock):\n____________________\n》#Lock RTL: "..settings.lock_rtl.."\n》#Lock TGservice : "..settings.lock_tgservice.."\n》#Lock Badwords: "..settings.lock_badwords.."\n》#Lock Join Members: "..settings.lock_member.."\n》#Lock Arabic/Persian: "..settings.lock_arabic.."\n》#Lock Stickers: "..settings.lock_sticker.."\n》#Lock Security Pro: "..settings.lock_security.."\n》#Lock Strict: "..settings.strict.."\n》#Lock Spam: "..settings.lock_spam.."\n》#Lock join BOTs(API): "..bots_protection.."\n》#Lock publicy: "..settings.lock_public.."\n》#Lock links : "..settings.lock_link.."\n》#Lock Tags: "..settings.lock_tags.."\n》#Lock Commands: "..settings.lock_commands.."\n》#Lock Webpage : "..settings.lock_webpage.."\n》#Lock links Pro: "..settings.lock_linkpro.."\n》#Lock Operator: "..settings.lock_operator.."\n》#Lock entry robot(Cli): "..settings.lock_antispambot.."\n____________________\nBOT VERSION: 3.6</code>",ok_cb,true)
  local text = string.gsub(text,'yes','[Yes | 🔐]')
  local text = string.gsub(text,'no','[No | 🔓]')
  return reply_msg(msg.id, text, ok_cb, false)
end
end
-----------------
function show_supergroup_settingsallpv(msg, target)
 	if not is_owner(msg) then
    	return
  	end
	local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	local bots_protection = "yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
     bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_rtl'] then
			data[tostring(target)]['settings']['lock_rtl'] = 'no'
		end
end
      if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tgservice'] then
			data[tostring(target)]['settings']['lock_tgservice'] = 'no'
		end
	end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_badwords'] then
			data[tostring(target)]['settings']['lock_badwords'] = 'no'
		end
end
--[[if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_hashtag'] then
			data[tostring(target)]['settings']['lock_hashtag'] = 'no'
		end
end]]
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_security'] then
			data[tostring(target)]['settings']['lock_security'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_public'] then
			data[tostring(target)]['settings']['lock_public'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_webpage'] then
			data[tostring(target)]['settings']['lock_webpage'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_linkpro'] then
			data[tostring(target)]['settings']['lock_linkpro'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
			data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_operator'] then
			data[tostring(target)]['settings']['lock_operator'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_support'] then
			data[tostring(target)]['settings']['lock_support'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_low'] then
			data[tostring(target)]['settings']['lock_low'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_high'] then
			data[tostring(target)]['settings']['lock_high'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_family'] then
			data[tostring(target)]['settings']['lock_family'] = 'no'
		end
end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_extalk'] then
			data[tostring(target)]['settings']['lock_extalk'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_speechfa'] then
			data[tostring(target)]['settings']['lock_speechfa'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_speechen'] then
			data[tostring(target)]['settings']['lock_speechen'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_kickme'] then
			data[tostring(target)]['settings']['lock_kickme'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_qa'] then
			data[tostring(target)]['settings']['lock_qa'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_dialogue'] then
			data[tostring(target)]['settings']['lock_dialogue'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_antispambot'] then
			data[tostring(target)]['settings']['lock_antispambot'] = 'no'
		end
	end
	   if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_commands'] then
			data[tostring(target)]['settings']['lock_commands'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_commandsuser'] then
			data[tostring(target)]['settings']['lock_commandsuser'] = 'no'
		end
	end
  if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_all'] then
			data[tostring(target)]['settings']['lock_all'] = 'no'
		end
	end	
      if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_reply'] then
			data[tostring(target)]['settings']['lock_reply'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_member'] then
			data[tostring(target)]['settings']['lock_member'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_low'] then
			data[tostring(target)]['settings']['lock_low'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_high'] then
			data[tostring(target)]['settings']['lock_high'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_family'] then
			data[tostring(target)]['settings']['lock_family'] = 'no'
		end
end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
			data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_pornword'] then
			data[tostring(target)]['settings']['lock_pornword'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_support'] then
			data[tostring(target)]['settings']['lock_support'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_tags'] then
			data[tostring(target)]['settings']['lock_tags'] = 'no'
		end
end
	local Welcome = "yes"
    if  data[tostring(msg.to.id)]['welcome'] then
    Welcome = data[tostring(msg.to.id)]['welcome']
    end

    local expiretime = redis:hget('expiretime', get_receiver(msg))
    local expire = ''
  if not expiretime then
  expire = expire..'0'
  else
   local now = tonumber(os.time())
   expire =  expire..math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
 end
	
	local gp_type = data[tostring(msg.to.id)]['group_type']
	
	local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then
      return '>برای دریافت کلیه تنظیمات گروه ('..msg.to.title..') ابتدا اقدام به ثبت لینک گروه کنید!'
       end
	   
	  -- local data_cat = 'rules'  
	--local group_rules = data[tostring(msg.to.id)][data_cat]
        local group_owner = data[tostring(msg.to.id)]['set_owner']
       if not group_owner then 
         return 
       end
	   
	local adminslist = ''
for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
  adminslist = adminslist .. '> '.. v ..' ('..k..')\n'
end

  local settings = data[tostring(target)]['settings']
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  local text = ">تنظیمات کلی سوپرگروه\n____________________\n>نام گروه: ["..msg.to.title.."]\n>شناسه گروه ["..msg.to.id.."]\n____________________\n>قفل ها:\n》قفل راست به چپ: "..settings.lock_rtl.."\n》قفل خدمات تلگرام : "..settings.lock_tgservice.."\n》قفل کلمات توهین آمیز: "..settings.lock_badwords.."\n》قفل ورود اعضا: "..settings.lock_member.."\n》قفل عربی/فارسی: "..settings.lock_arabic.."\n》قفل برچسب: "..settings.lock_sticker.."\n》قفل امنیتی پیشرفته: "..settings.lock_security.."\n》تنظیمات سخت گیرانه: "..settings.strict.."\n》قفل هرزنامه: "..settings.lock_spam.."\n》قفل ورود ربات: "..bots_protection.."\n》قفل پیشرفته تبلیغات: "..settings.lock_public.."\n》قفل لینک : "..settings.lock_link.."\n》قفل تگ: "..settings.lock_tags.."\n》قفل دستورات: "..settings.lock_commands.."\n》قفل دستورات کاربران: "..settings.lock_commandsuser.."\n》قفل صفحات اینترنتی : "..settings.lock_webpage.."\n》قفل ارسال لینک پیشرفته: "..settings.lock_linkpro.."\n》قفل تبلیغات اپراتور: "..settings.lock_operator.."\n》قفل ورود ربات(Cli): "..settings.lock_antispambot.."\n》قفل پرسش و پاسخ(گروه): "..settings.lock_qa.."\n》قفل کمکی متن(گفتگو): "..settings.lock_dialogue.."\n》قفل ارسال پیام متوالی: "..settings.flood.."\n》حساسیت نسبت به ارسال پیام : "..NUM_MSG_MAX.."\n》قفل تصاویر پورن: "..settings.lock_porn.."\n》قفل کلمات(مستهجن): "..settings.lock_pornword.."\n》قفل پشتیبانی(Sudo): "..settings.lock_support.."\n》قفل استفاده از دستور(kickme): "..settings.lock_kickme.."\n》کارکرد ترافیک سنگین: "..settings.lock_high.."\n》کارکرد ترافیک سبک: "..settings.lock_low.."\n》حالت خانواده: "..settings.lock_family.."\n》قفل تمامی تنظیمات: "..settings.lock_all.."\n》پیغام خوش آمد گویی: "..Welcome.."\n》نوع گروه: "..gp_type.."\n》تاریخ انقضای گروه: "..expire.." روز دیگر\n>تعداد ادمین ها: "..result.admins_count.."\n>تعداد کاربران: "..result.participants_count.."\n>تعداد کاربران اخراج شده: "..result.kicked_count.."\nمالک گروه: "..group_owner.."\nلینک گروه: "..group_link.."\nلیست مدیران:\n "..adminslist.."____________________\nBOT VERSION: 3.6"
   local text = string.gsub(text,'yes','[قفل | 🔐]')
  local text = string.gsub(text,'no','[آزاد | 🔓]')
  send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
   --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "ℹ️کلیه اطلاعات سوپرگروه به خصوصی شما ارسال شد(FA)"
else
local text = ">General Settings SuperGroup\n____________________\n>Group name: ["..msg.to.title.."]\n>Group ID ["..msg.to.id.."]\n____________________\n>Lock(s):\n》Lock RTL: "..settings.lock_rtl.."\n》Lock TGservice : "..settings.lock_tgservice.."\n》Lock Badwords: "..settings.lock_badwords.."\n》Lock Join Members: ".."\n》Lock Arabic/Persian: "..settings.lock_arabic.."\n》Lock Stickers: "..settings.lock_sticker.."\n》Lock Security Pro: "..settings.lock_security.."\n》Lock Strict: "..settings.strict.."\n》Lock Spam: "..settings.lock_spam.."\n》Lock join BOTs(API): "..bots_protection.."\n》Lock publicy pro: "..settings.lock_public.."\n》Lock links : "..settings.lock_link.."\n》Lock Tags: "..settings.lock_tags.."\n》Lock Commands: "..settings.lock_commands.."\n》Lock Commands user: ".."\n》Lock Webpage : "..settings.lock_webpage.."\n》Lock links Pro: "..settings.lock_linkpro.."\n》Lock Operator: "..settings.lock_operator.."\n》Lock entry robot(Cli): "..settings.lock_antispambot.."\n》Lock FAQ (in the group): "..settings.lock_qa.."\n》Text auxiliary lock (dialogue): "..settings.lock_dialogue.."\n》Lock flood: "..settings.flood.."\n》Flood sensitivity : "..NUM_MSG_MAX.."\n》Lock porn pictures: "..settings.lock_porn.."\n》Lock porn Words: ".."\n》Lock Support(Sudo): "..settings.lock_support.."\n》Lock Kickme command: "..settings.lock_kickme.."\n》Heavy traffic operation: "..settings.lock_high.."\n》Light traffic operation: "..settings.lock_low.."\n》Mode family: "..settings.lock_family.."\n》Lock All Settings: ".."\n____________________\n》Welcome Message: "..Welcome.."\n》Type Group: ["..gp_type.."]\n》Group expiry date: ["..expire.."] other day\n____________________\n>Administrators: [Fault]".."\n>number of users: [Fault]".."\n>Members expelled: [Fault]".."\n____________________\n>Group Owner: ["..group_owner.."]\n>Group link: ["..group_link.."]\n____________________\n>Managers list ["..adminslist.."]\n____________________\n>Group Rules : [".."] \n____________________\nBOT VERSION: 3.6"
  --reply_msg(msg.id,"<code>⚙Settings SuperGroup ["..msg.to.title.."] (Lock):\n____________________\n》#Lock RTL: "..settings.lock_rtl.."\n》#Lock TGservice : "..settings.lock_tgservice.."\n》#Lock Badwords: "..settings.lock_badwords.."\n》#Lock Join Members: "..settings.lock_member.."\n》#Lock Arabic/Persian: "..settings.lock_arabic.."\n》#Lock Stickers: "..settings.lock_sticker.."\n》#Lock Security Pro: "..settings.lock_security.."\n》#Lock Strict: "..settings.strict.."\n》#Lock Spam: "..settings.lock_spam.."\n》#Lock join BOTs(API): "..bots_protection.."\n》#Lock publicy: "..settings.lock_public.."\n》#Lock links : "..settings.lock_link.."\n》#Lock Tags: "..settings.lock_tags.."\n》#Lock Commands: "..settings.lock_commands.."\n》#Lock Webpage : "..settings.lock_webpage.."\n》#Lock links Pro: "..settings.lock_linkpro.."\n》#Lock Operator: "..settings.lock_operator.."\n》#Lock entry robot(Cli): "..settings.lock_antispambot.."\n____________________\nBOT VERSION: 3.6</code>",ok_cb,true)
  local text = string.gsub(text,'yes','[Yes | 🔐]')
  local text = string.gsub(text,'no','[No | 🔓]')
  send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
   --send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "ℹ️کلیه اطلاعات سوپرگروه به خصوصی شما ارسال شد(En)"
end
end

function show_supergroup_settingspswitch(msg, target)
 	if not is_owner(msg) then
    	return
  	end
   local data = load_data(_config.moderation.data)
    if data[tostring(target)] then
     	if data[tostring(target)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
	local bots_protection = "yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
     bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
    end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_low'] then
			data[tostring(target)]['settings']['lock_low'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_high'] then
			data[tostring(target)]['settings']['lock_high'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_family'] then
			data[tostring(target)]['settings']['lock_family'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_security'] then
			data[tostring(target)]['settings']['lock_security'] = 'no'
		end
end
if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_all'] then
			data[tostring(target)]['settings']['lock_all'] = 'no'
		end
	end	


local settings = data[tostring(target)]['settings']
local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  local text = "⚙لیست سوئیچ های موجود:\n____________________\n🗃#کارکرد ربات روی حالت سنگین: "..settings.lock_high.."\n🗃#کارکرد ربات روی حالت نرمال: "..settings.lock_low.."\n🗃#حالت خانواده(معمولی): "..settings.lock_family.."\n🗃#کارکرد ربات روی حالت امنیتی : "..settings.lock_security.."\n🗃#قفل تمامی تنظیمات: "..settings.lock_all.."\n____________________\nنسخه ربات: 3.7"
  local text = string.gsub(text,'yes','[قفل | 🔐]')
  local text = string.gsub(text,'no','[آزاد | 🔓]')
  return reply_msg(msg.id, text, ok_cb, false)
else
local text = "⚙Switch list available:\n____________________\n》#Heavy traffic operation: "..settings.lock_high.."\n》#Light traffic operation: "..settings.lock_low.."\n》#Mode family: "..settings.lock_family.."\n》#Switches to security mode : "..settings.lock_security.."\n》#Lock All Settings: "..settings.lock_all.."\n____________________\nBOT VERSION: 3.6"
 local text = string.gsub(text,'yes','[Yes | 🔐]')
  local text = string.gsub(text,'no','[No | 🔓]')
  return reply_msg(msg.id, text, ok_cb, false)
end
end

function show_supergroup_mutes(msg, target)
 	if not is_owner(msg) then
    	return
  	end
	local data = load_data(_config.moderation.data)
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_text'] then
			data[tostring(target)]['settings']['mute_text'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_audio'] then
			data[tostring(target)]['settings']['mute_audio'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_service'] then
			data[tostring(target)]['settings']['mute_service'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_photo'] then
			data[tostring(target)]['settings']['mute_photo'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_forward'] then
			data[tostring(target)]['settings']['mute_forward'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_video'] then
			data[tostring(target)]['settings']['mute_video'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_gif'] then
			data[tostring(target)]['settings']['mute_gif'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_doc'] then
			data[tostring(target)]['settings']['mute_doc'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_media'] then
			data[tostring(target)]['settings']['mute_media'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_all'] then
			data[tostring(target)]['settings']['mute_all'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
		data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_pornword'] then
		data[tostring(target)]['settings']['lock_pornword'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_contact'] then
			data[tostring(target)]['settings']['lock_contact'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_sticker'] then
			data[tostring(target)]['settings']['lock_sticker'] = 'no'
		end
	end
  local settings = data[tostring(target)]['settings']
--local group_link = data[tostring(msg.to.id)]['settings']['set_link']
   local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  	local text = "<i> 🔕لیست فیلتر های سوپرگروه:  </i> [<b>"..msg.to.print_name:gsub("_"," ").."</b>]:\n____________________\n><i> فیلتر گفتگو: </i> "..settings.mute_all.."\n><i> فیلتر متن: </i> "..settings.mute_text.."\n><i> فیلتر تصاویر: </i> "..settings.mute_photo.."\n><i> فیلتر برچسب: </i> "..settings.lock_sticker.."\n><i> فیلتر ویدئو: </i> "..settings.mute_video.."\n><i> فیلتر صدا: </i> "..settings.mute_audio.."\n><i> فیلتر اشتراک مخاطبین: </i> "..settings.lock_contact.."\n><i> فیلتر تصاویر متحرک: </i> "..settings.mute_gif.."\n><i> فیلتر فایل: </i> "..settings.mute_doc.."\n><i> فیلتر فوروارد: </i> "..settings.mute_forward.."\n><i> فیلتر محتوای بزرگسالان: </i> "..settings.lock_porn.."\n><i> فیلتر خدمات تلگرام: </i> "..settings.mute_service.."\n><i> فیلتر تمامی رسانه ها: </i> "..settings.mute_media..""
  local text = string.gsub(text,'yes','|<i>حذف</i>|')
  local text = string.gsub(text,'no','|<i>غیرفعال</i>|')
return reply_msg(msg.id, text, ok_cb, false)
else
local text = "🔕 <i>Filter the list of Super Group:</i> [<b>"..msg.to.print_name:gsub("_"," ").."</b>]:\n____________________\n><i> Vintage filter: </i> "..settings.mute_all.."\n><i> Text Filter: </i> "..settings.mute_text.."\n><i> Filter pictures: </i> "..settings.mute_photo.."\n><i> Filter Tags: </i> "..settings.lock_sticker.."\n><i> Video filter: </i> "..settings.mute_video.."\n><i> Audio filter: </i> "..settings.mute_audio.."\n><i> Share filtering contacts: </i> "..settings.lock_contact.."\n><i> Filter animated images: </i> "..settings.mute_gif.."\n><i> The file filter: </i> "..settings.mute_doc.."\n><i> Forward filter: </i> "..settings.mute_forward.."\n><i> Filter adult content: </i> "..settings.lock_porn.."\n><i> Filter Telegram Service: </i> "..settings.mute_service.."\n><i> Filter all media: </i> "..settings.mute_media..""
  local text = string.gsub(text,'yes','|<b>Delete</b>|')
  local text = string.gsub(text,'no','|<b>Ok</b>|')
return reply_msg(msg.id, text, ok_cb, false)
end
end

function show_supergroup_mutesar(msg, target)
 	if not is_owner(msg) then
    	return
  	end
	local data = load_data(_config.moderation.data)
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_text'] then
			data[tostring(target)]['settings']['mute_text'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_audio'] then
			data[tostring(target)]['settings']['mute_audio'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_service'] then
			data[tostring(target)]['settings']['mute_service'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_photo'] then
			data[tostring(target)]['settings']['mute_photo'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_forward'] then
			data[tostring(target)]['settings']['mute_forward'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_video'] then
			data[tostring(target)]['settings']['mute_video'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_gif'] then
			data[tostring(target)]['settings']['mute_gif'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_doc'] then
			data[tostring(target)]['settings']['mute_doc'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_media'] then
			data[tostring(target)]['settings']['mute_media'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_all'] then
			data[tostring(target)]['settings']['mute_all'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
		data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_pornword'] then
		data[tostring(target)]['settings']['lock_pornword'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_contact'] then
			data[tostring(target)]['settings']['lock_contact'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_sticker'] then
			data[tostring(target)]['settings']['lock_sticker'] = 'no'
		end
	end
  local settings = data[tostring(target)]['settings']
  	local text = "🔕تصفية قائمة السوبر المجموعة: ["..msg.to.print_name:gsub("_"," ").."]:\n____________________\n> 🔇مرشح خمر: "..settings.mute_all.."\n> 🔇تصفية النص: "..settings.mute_text.."\n> 🔇تصفية الصور: "..settings.mute_photo.."\n> 🔇مرشح للخلف: "..settings.lock_sticker.."\n> 🔇تصفية الفيديو: "..settings.mute_video.."\n> 🔇تصفية الصوت: "..settings.mute_audio.."\n> 🔇اتصالات حصة تصفية: "..settings.lock_contact.."\n> 🔇تصفية الصور المتحركة: "..settings.mute_gif.."\n> 🔇ملف الترشيح: "..settings.mute_doc.."\n> 🔇مرشح إلى الأمام: "..settings.mute_forward.."\n> 🔇محتوى للبالغين فلتر: "..settings.lock_porn.."\n> 🔇تصفية خدمة برقية: "..settings.mute_service.."\n> 🔇تصفية جميع وسائل الإعلام: "..settings.mute_media.."\n____________________\nالأمناء صيغة: 3⃣.7⃣\nسودو : @AliReza_PT"
  local text = string.gsub(text,'yes','[القفل | 🔕]')
  local text = string.gsub(text,'no','[مفتوح | 🔔]')
return reply_msg(msg.id, text, ok_cb, false)
end

function show_supergroup_mutespv(msg, target)
 	if not is_owner(msg) then
    	return
  	end
	local data = load_data(_config.moderation.data)
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_text'] then
			data[tostring(target)]['settings']['mute_text'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_audio'] then
			data[tostring(target)]['settings']['mute_audio'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_service'] then
			data[tostring(target)]['settings']['mute_service'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_photo'] then
			data[tostring(target)]['settings']['mute_photo'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_forward'] then
			data[tostring(target)]['settings']['mute_forward'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_video'] then
			data[tostring(target)]['settings']['mute_video'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_gif'] then
			data[tostring(target)]['settings']['mute_gif'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_doc'] then
			data[tostring(target)]['settings']['mute_doc'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_media'] then
			data[tostring(target)]['settings']['mute_media'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['mute_all'] then
			data[tostring(target)]['settings']['mute_all'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_porn'] then
		data[tostring(target)]['settings']['lock_porn'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_pornword'] then
		data[tostring(target)]['settings']['lock_pornword'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_contact'] then
			data[tostring(target)]['settings']['lock_contact'] = 'no'
		end
	end
	if data[tostring(target)]['settings'] then
		if not data[tostring(target)]['settings']['lock_sticker'] then
			data[tostring(target)]['settings']['lock_sticker'] = 'no'
		end
	end
  local settings = data[tostring(target)]['settings']
  local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
  	local text = "<i> 🔕لیست فیلتر های سوپرگروه:  </i> [<b>"..msg.to.print_name:gsub("_"," ").."</b>]:\n____________________\n><i> فیلتر گفتگو: </i> "..settings.mute_all.."\n><i> فیلتر متن: </i> "..settings.mute_text.."\n><i> فیلتر تصاویر: </i> "..settings.mute_photo.."\n><i> فیلتر برچسب: </i> "..settings.lock_sticker.."\n><i> فیلتر ویدئو: </i> "..settings.mute_video.."\n><i> فیلتر صدا: </i> "..settings.mute_audio.."\n><i> فیلتر اشتراک مخاطبین: </i> "..settings.lock_contact.."\n><i> فیلتر تصاویر متحرک: </i> "..settings.mute_gif.."\n><i> فیلتر فایل: </i> "..settings.mute_doc.."\n><i> فیلتر فوروارد: </i> "..settings.mute_forward.."\n><i> فیلتر محتوای بزرگسالان: </i> "..settings.lock_porn.."\n><i> فیلتر خدمات تلگرام: </i> "..settings.mute_service.."\n><i> فیلتر تمامی رسانه ها: </i> "..settings.mute_media..""
  local text = string.gsub(text,'yes','|<i> حذف </i>|')
  local text = string.gsub(text,'no','|<i> غیرفعال </i>|')
send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
--send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "ℹ️لیست تنظیمات فیلتر شده به خصوصی شما ارسال شد(Fa)"
else
local text = "🔕 <i>Filter the list of Super Group:</i> [<b>"..msg.to.print_name:gsub("_"," ").."</b>]:\n____________________\n><i> Vintage filter: </i> "..settings.mute_all.."\n><i> Text Filter: </i> "..settings.mute_text.."\n><i> Filter pictures: </i> "..settings.mute_photo.."\n><i> Filter Tags: </i> "..settings.lock_sticker.."\n><i> Video filter: </i> "..settings.mute_video.."\n><i> Audio filter: </i> "..settings.mute_audio.."\n><i> Share filtering contacts: </i> "..settings.lock_contact.."\n><i> Filter animated images: </i> "..settings.mute_gif.."\n><i> The file filter: </i> "..settings.mute_doc.."\n><i> Forward filter: </i> "..settings.mute_forward.."\n><i> Filter adult content: </i> "..settings.lock_porn.."\n><i> Filter Telegram Service: </i> "..settings.mute_service.."\n><i> Filter all media: </i> "..settings.mute_media..""
  local text = string.gsub(text,'yes','|<b>Delete</b>|')
  local text = string.gsub(text,'no','|<b>Ok</b>|')
send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
--send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "ℹ️لیست تنظیمات فیلتر شده به خصوصی شما ارسال شد(En)"
end
end


local function set_welcomemod(msg, data, target)
      if not is_owner(msg) then
        return 
      end
  local data_cat = 'welcome_msg'
  data[tostring(target)][data_cat] = rules
  save_data(_config.moderation.data, data)
  return 'ℹ️پیغام خوش آمد گویی :\n'..rules..'\n---------------\nبرای نمایش نام کاربر و نام گروه یا قوانین  میتوانید به صورت زیر عمل کنید\n\n /set welcome salam {name} be goroohe {group} khosh amadid \n ghavanine gorooh: {rules} \n\nربات به صورت هوشمند نام گروه , نام کاربر و قوانین را به جای {name}و{group} و {rules} اضافه میکند.'
end

local function set_expiretime(msg, data, target)
      if not is_sudo(msg) then
        return 
      end
  local data_cat = 'expire'
  data[tostring(target)][data_cat] = expired
  save_data(_config.moderation.data, data)
  return 'ℹ️تاریخ انقضای گروه به '..expired..' تنظیم شد'
end

local function promote_admin(receiver, member_username, user_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'channel#id', '')
  local member_tag_username = string.gsub(member_username, '@', '@')
  if not data[group] then
    return
  end
  if data[group]['moderators'][tostring(user_id)] then
  return send_large_msg(receiver, '🔖کاربر ['..member_username..'] از قبل به مقام مدیریت ارتقاء یافته است(مجدد سعی نکنید)')
 -- return reply_msg(msg.reply_id,"🔖کاربر ["..member_username.."] از قبل به مقام مدیریت ارتقاء یافته است(مجدد سعی نکنید)",ok_cb,true)
 end
  data[group]['moderators'][tostring(user_id)] = member_tag_username
  save_data(_config.moderation.data, data)
end

local function demote_admin(receiver, member_username, user_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'channel#id', '')
  if not data[group] then
    return
  end
  if not data[group]['moderators'][tostring(user_id)] then
    return send_large_msg(receiver, '🔖#کاربر ['..member_tag_username..'] دسترسی برای مدیریت گروه ندارد(مجدد سعی نکنید)')
	--return reply_msg(msg.id,"🔖#کاربر ["..member_tag_username.."] دسترسی برای مدیریت گروه ندارد(مجدد سعی نکنید)",ok_cb,true)
  end
  data[group]['moderators'][tostring(user_id)] = nil
  save_data(_config.moderation.data, data)
end

local function promote2(receiver, member_username, user_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'channel#id', '')
  local member_tag_username = string.gsub(member_username, '@', '@')
  if not data[group] then
    return send_large_msg(receiver, 'سوپرگروه اضافه نشده است')
  end
  if data[group]['moderators'][tostring(user_id)] then
    return send_large_msg(receiver, '🔖#کاربر['..member_username..'] از قبل به مقام مدیریت ارتقاء یافته است(مجدد سعی نکنید)')
  end
  data[group]['moderators'][tostring(user_id)] = member_tag_username
  save_data(_config.moderation.data, data)
  send_large_msg(receiver, '🔖 <i>انجام شد!</i> \n> <i> مدیریت جدید: </i> ['..member_username..'] ')
  --reply_msg(msg.id,"🔖ارتقاء مقام مدیریت به کاربر ["..member_username.."] انجام شد!",ok_cb,true)
end

local function demote2(receiver, member_username, user_id)
  local data = load_data(_config.moderation.data)
  local member_tag_username = string.gsub(member_username, '@', '@')
  local group = string.gsub(receiver, 'channel#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'سوپرگروه اضاف نشده است!')
  end
  if not data[group]['moderators'][tostring(user_id)] then
    return send_large_msg(receiver, '🔖#کاربر ['..member_tag_username..'] دسترسی برای مدیریت گروه ندارد(مجدد سعی نکنید)')
	 --return reply_msg(msg.id,"🔖#کاربر ["..member_tag_username.."] دسترسی برای مدیریت گروه ندارد(مجدد سعی نکنید)",ok_cb,true)
  end
  data[group]['moderators'][tostring(user_id)] = nil
  save_data(_config.moderation.data, data)
  send_large_msg(receiver, '🔖 <i>انجام شد!</i> \n> ['..member_username..'] <i>هم اکنون کاربر عادی است </i>')
  --reply_msg(msg.id,"🔖عزل مقام مدیریت از کاربر ["..member_username.."] انجام شد",ok_cb,true)
end

local function modlist(msg)
  local data = load_data(_config.moderation.data)
  local groups = "groups"
  if not data[tostring(groups)][tostring(msg.to.id)] then
    return 'سوپرگروه اضاف نشده است'
  end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['moderators']) == nil then
    local text = 'ادمینی در این گروه یافت نشد'
	return reply_msg(msg.id, text, ok_cb, false)
  end
  local i = 1
  local hour = os.date("%H")
 local modlist_hash = 'modlist:'..hour..':'..msg.from.id
 local is_modlist = redis:get(modlist_hash)
if is_modlist then
    return "🔖#user (@"..msg.from.username..") After 1 hour try again"
     elseif not is_modlist then
     redis:set(modlist_hash, true)
  local message = '\n👥لیست ادمین های گروه ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
  for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
    message = message ..i..' - '..v..' [' ..k.. '] \n'
    i = i + 1
  end
  send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/admin.webp", ok_cb, false)
  return reply_msg(msg.id, message, ok_cb, false)
end
end

-- Start by reply actions
function get_message_callback(extra, success, result)
	local get_cmd = extra.get_cmd
	local msg = extra.msg
	local data = load_data(_config.moderation.data)
	local print_name = user_print_name(msg.from):gsub("‮", "")
	local name_log = print_name:gsub("_", " ")
	if type(result) == 'boolean' then
     return reply_msg(msg.id, '><code> متاسفم.قادر به خواندن این پیام نیستم. </code>\n<b>[Not supported] This is a old message!</b>', ok_cb, false)
   end
    if get_cmd == "id" and not result.action then
		local channel = 'channel#id'..result.to.peer_id
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] obtained id for: ["..result.from.peer_id.."]")
		id1 = send_large_msg(channel, result.from.peer_id)
	elseif get_cmd == 'id' and result.action then
		local action = result.action.type
		if action == 'chat_add_user' or action == 'chat_del_user' or action == 'chat_rename' or action == 'chat_change_photo' then
			if result.action.user then
				user_id = result.action.user.peer_id
			else
				user_id = result.peer_id
			end
			local channel = 'channel#id'..result.to.peer_id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] obtained id by service msg for: ["..user_id.."]")
			id1 = send_large_msg(channel, user_id)
		end
    elseif get_cmd == "idfrom" then
		local channel = 'channel#id'..result.to.peer_id
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] obtained id for msg fwd from: ["..result.fwd_from.peer_id.."]")
		id2 = send_large_msg(channel, result.fwd_from.peer_id)
    elseif get_cmd == 'channel_block' and not result.action then
		local member_id = result.from.peer_id
		local channel_id = result.to.peer_id
    if member_id == msg.from.id then
      return send_large_msg("channel#id"..channel_id, "<i>ℹ️شما نمیتوانید خودتان را اخراج نمایید</i>")
    end
    if is_momod2(member_id, channel_id) and not is_admin2(msg.from.id) then
			   return send_large_msg("channel#id"..channel_id, "<i>ℹ️شما نمیتوانید مالک گروه/مدیرها/ادمین ها را اخراج کنید</i>")
    end
    if is_admin2(member_id) then
         return send_large_msg("channel#id"..channel_id, "<i>ℹ️شما نمیتوانید دیگر ادمین ها را اخراج کنید</i>")
    end
		--savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: ["..user_id.."] by reply")
				 --send_large_msg("channel#id"..channel_id, "🎟To request the #user to manage [@"..(msg.from.username or "---").."] Was expelled from the group")
				 -- reply_msg("channel#id"..channel_id, "🎟#User Target Upon Request Management [@"..(msg.from.username or "---").."] Was Expelled From The Group")
				 reply_msg(msg.reply_id,"》<i>کاربر مورد نظر از گروه اخراج گردید</i>",ok_cb,true) 
		kick_user(member_id, channel_id)
	elseif get_cmd == 'channel_block' and result.action and result.action.type == 'chat_add_user' then
		local user_id = result.action.user.peer_id
		local channel_id = result.to.peer_id
    if member_id == msg.from.id then
      return send_large_msg("channel#id"..channel_id, "<i>ℹ️شما نمیتوانید خودتان را اخراج نمایید</i>")
    end
    if is_momod2(member_id, channel_id) and not is_admin2(msg.from.id) then
			   return send_large_msg("channel#id"..channel_id, "<i>ℹ️شما نمیتوانید مالک گروه/مدیرها/ادمین ها را اخراج کنید</i>")
    end
    if is_admin2(member_id) then
         return send_large_msg("channel#id"..channel_id, "<i>ℹ️شما نمیتوانید دیگر ادمین ها را اخراج کنید</i>")
    end
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: ["..user_id.."] by reply to sev. msg.")
		kick_user(user_id, channel_id)
	elseif get_cmd == "del" then
		delete_msg(result.id, ok_cb, false)
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] deleted a message by reply")
	elseif get_cmd == "setadmin" then
		local user_id = result.from.peer_id
		local channel_id = "channel#id"..result.to.peer_id
		channel_set_admin(channel_id, "user#id"..user_id, ok_cb, false)
		if result.from.username then
			text = "🔖 <i>انجام شد</i> > 👤 <i> ادمین جدید: </i> (@"..result.from.username..")--{<b>"..result.from.id.."</b>}"
		else
			--text = "👤کاربر [ "..user_id.." ] به مقام ادمین گروه ارتقاء یافت"
			text = "🔖 <i>انجام شد</i> > 👤 <i> ادمین جدید: </i> ("..user_id..")"
		end
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] set: ["..user_id.."] as admin by reply")
		send_large_msg(channel_id, text)
	elseif get_cmd == "demoteadmin" then
		local user_id = result.from.peer_id
		local channel_id = "channel#id"..result.to.peer_id
		if is_admin2(result.from.peer_id) then
			return send_large_msg(channel_id, "شما نمیتوانید ادمین های اصلی را بر کنار کنید")
		end
		channel_demote(channel_id, "user#id"..user_id, ok_cb, false)
		if result.from.username then
			--text = "👤کاربر (@"..result.from.username..") از مقام مدیریت گروه عزل شد"
			text = "🔖 <i>انجام شد </i>\n>👤 <i> توانایی مدیریت گروه از کاربر: </i> (@"..result.from.username..")--{<b>"..result.from.id.."</b>} <i> گرفته شد! </i>\n<i> هم اکنون کاربر عادی است </i>"
		else
			--text = "👤کاربر [ "..user_id.." ] از مقام مدیریت گروه عزل شد"
			text = "🔖 <i>انجام شد </i>\n>👤 <i> توانایی مدیریت گروه از کاربر: </i> ("..user_id..") <i> گرفته شد! </i>\n<i> هم اکنون کاربر عادی است </i>"
		end
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted: ["..user_id.."] from admin by reply")
		send_large_msg(channel_id, text)
	elseif get_cmd == "setowner" then
		local group_owner = data[tostring(result.to.peer_id)]['set_owner']
		if group_owner then
		local channel_id = 'channel#id'..result.to.peer_id
			if not is_admin2(tonumber(group_owner)) and not is_support(tonumber(group_owner)) then
				local user = "user#id"..group_owner
				channel_demote(channel_id, user, ok_cb, false)
			end
			local user_id = "user#id"..result.from.peer_id
			channel_set_admin(channel_id, user_id, ok_cb, false)
			data[tostring(result.to.peer_id)]['set_owner'] = tostring(result.from.peer_id)
			save_data(_config.moderation.data, data)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] set: ["..result.from.peer_id.."] as owner by reply")
			if result.from.username then
				--text = "》کاربر [@"..result.from.username.."] با شناسه [ "..result.from.peer_id.." ] به مقام مالک گروه ارتقاء یافت"
				text = "🔖 <i>انجام شد </i>\n>⭐️ <i> اطلاعات مالک جدید گروه: </i>\n > [@"..result.from.username.."]-{<b>"..result.from.peer_id.."</b>}"
			else
				--text = "》کاربر [ "..result.from.peer_id.." ] به مقام مالک گروه ارتقاء یافت"
				text = "🔖 <i>انجام شد </i>\n>⭐️ <i> اطلاعات مالک جدید گروه: </i>\n > [<b>"..result.from.peer_id.."</b>]"
			end
			send_large_msg(channel_id, text)
		end
	elseif get_cmd == "promote" then
		local receiver = result.to.peer_id
		local full_name = (result.from.first_name or '')..' '..(result.from.last_name or '')
		local member_name = full_name:gsub("‮", "")
		local member_username = member_name:gsub("_", " ")
		if result.from.username then
			member_username = '@'.. result.from.username
		end
		local member_id = result.from.peer_id
		if result.to.peer_type == 'channel' then
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] promoted mod: @"..member_username.."["..result.from.peer_id.."] by reply")
		promote2("channel#id"..result.to.peer_id, member_username, member_id)
	    --channel_set_mod(channel_id, user, ok_cb, false)
		end
	elseif get_cmd == "demote" then
		local receiver = result.to.peer_id
		local full_name = (result.from.first_name or '')..' '..(result.from.last_name or '')
		local member_name = full_name:gsub("‮", "")
		local member_username = member_name:gsub("_", " ")
		if result.from.username then
			member_username = '@'.. result.from.username
		end
		local member_id = result.from.peer_id
		if result.to.peer_type == 'channel' then
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted mod: @"..member_username.."["..result.from.peer_id.."] by reply")
		demote2("channel#id"..result.to.peer_id, member_username, member_id)
	    --channel_set_mod(channel_id, user, ok_cb, false)
		end
	elseif get_cmd == 'mute_user' then
		if result.service then
			local action = result.action.type
			if action == 'chat_add_user' or action == 'chat_del_user' or action == 'chat_rename' or action == 'chat_change_photo' then
				if result.action.user then
					user_id = result.action.user.peer_id
				end
			end
			if action == 'chat_add_user_link' then
				if result.from then
					user_id = result.from.peer_id
				end
			end
		else
			user_id = result.from.peer_id
		end
		if result.from then
					user_name = result.from.username
				end
		local receiver = extra.receiver
		local chat_id = msg.to.id
		print(user_id)
		print(chat_id)
		if is_muted_user(chat_id, user_id) then
			unmute_user(chat_id, user_id)
			--send_large_msg(receiver, "🎫کاربر ["..user_id.."] 🔔از لیست سکوت خارج شد(اکنون توانایی گفتگو در گروه را داراست)")
			reply_msg(msg.reply_id,"🔖 <i>انجام شد </i>\n🔊 ><i>  از لیست سکوت کاربران حذف گردید  </i>\n><i> مشخصات کاربر: </i> [@"..(user_name or "—-").."]--[<b>"..user_id.."</b>] ",ok_cb,true)
		elseif is_admin1(msg) then
			mute_user(chat_id, user_id)
			--send_large_msg(receiver, "》کاربر ["..user_id.."] 🔕به لیست سکوت افزوده شد(اکنون توانایی گفتگو در گروه را از دست داد)")
			reply_msg(msg.reply_id,"🔖 <i>انجام شد </i>\n🔇 ><i>  به لیست سکوت کاربران افزوده گردید  </i>\n><i> مشخصات کاربر: </i> [@"..(user_name or "—-").."]--[<b>"..user_id.."</b>]",ok_cb,true)
		end
	end
end
-- End by reply actions

--By ID actions
local function cb_user_info(extra, success, result)
	local receiver = extra.receiver
	local user_id = result.peer_id
	local get_cmd = extra.get_cmd
	local data = load_data(_config.moderation.data)
	--[[if get_cmd == "setadmin" then
		local user_id = "user#id"..result.peer_id
		channel_set_admin(receiver, user_id, ok_cb, false)
		if result.username then
			text = "@"..result.username.." has been set as an admin"
		else
			text = "[ "..result.peer_id.." ] has been set as an admin"
		end
			send_large_msg(receiver, text)]]
	if get_cmd == "demoteadmin" then
		if is_admin2(result.peer_id) then
			return send_large_msg(receiver, "شما نمیتوانید ادمین های اصلی را برکنار کنید")
		end
		local user_id = "user#id"..result.peer_id
		channel_demote(receiver, user_id, ok_cb, false)
		if result.username then
			--text = "👤کاربر (@"..result.from.username..") از مقام مدیریت گروه عزل شد"
			text = "🔖 <i>انجام شد </i>\n>👤 <i>توانایی مدیریت گروه از کاربر: </i> (@"..result.from.username..") <i> گرفته شد! </i>\n<i> هم اکنون کاربر عادی است </i>"
			send_large_msg(receiver, text)
		else
			--text = "👤کاربر [ "..user_id.." ] از مقام مدیریت گروه عزل شد"
			text = "🔖 <i>انجام شد </i>\n>👤 <i>توانایی مدیریت گروه از کاربر: </i> ("..user_id..") <i> گرفته شد! </i>\n<i> هم اکنون کاربر عادی است </i>"
			send_large_msg(receiver, text)
		end
	elseif get_cmd == "promote" then
		if result.username then
			member_username = "@"..result.username
		else
			member_username = string.gsub(result.print_name, '_', ' ')
		end
		promote2(receiver, member_username, user_id)
	elseif get_cmd == "demote" then
		if result.username then
			member_username = "@"..result.username
		else
			member_username = string.gsub(result.print_name, '_', ' ')
		end
		demote2(receiver, member_username, user_id)
	end
end

-- Begin resolve username actions
local function callbackres(extra, success, result)
  local member_id = result.peer_id
  local member_username = "@"..result.username
  local get_cmd = extra.get_cmd
	if get_cmd == "res" then
		local user = result.peer_id
		local name = string.gsub(result.print_name, "_", " ")
		local channel = 'channel#id'..extra.channelid
		send_large_msg(channel,"》 <i>نام کامل:</i> {<b>"..name.."</b>}\n》 <i>شناسه کاربری:</i> [<b>"..user.."</b>]")
		--reply_msg(channel,"》شناسه کاربری: ["..user.."]\n_______________\n》نام کامل: {"..name.."}")
		return user
	elseif get_cmd == "id" then
		local user = result.peer_id
		local channel = 'channel#id'..extra.channelid
		send_large_msg(channel, user)
		return user
  elseif get_cmd == "invite" then
    local receiver = extra.channel
    local user_id = "user#id"..result.peer_id
    channel_invite(receiver, user_id, ok_cb, false)
	--[[elseif get_cmd == "channel_block" then
		local user_id = result.peer_id
		local channel_id = extra.channelid
    local sender = extra.sender
    if member_id == sender then
      return send_large_msg("channel#id"..channel_id, "Leave using kickme command")
    end
		if is_momod2(member_id, channel_id) and not is_admin2(sender) then
			   return send_large_msg("channel#id"..channel_id, "You can't kick mods/owner/admins")
    end
    if is_admin2(member_id) then
         return send_large_msg("channel#id"..channel_id, "You can't kick other admins")
    end
		kick_user(user_id, channel_id)
	elseif get_cmd == "setadmin" then
		local user_id = "user#id"..result.peer_id
		local channel_id = extra.channel
		channel_set_admin(channel_id, user_id, ok_cb, false)
		if result.username then
			text = "@"..result.username.." has been set as an admin"
			send_large_msg(channel_id, text)
		else
			text = "@"..result.peer_id.." has been set as an admin"
			send_large_msg(channel_id, text)
		end
	elseif get_cmd == "setowner" then
		local receiver = extra.channel
		local channel = string.gsub(receiver, 'channel#id', '')
		local from_id = extra.from_id
		local group_owner = data[tostring(channel)]['set_owner']
		if group_owner then
			local user = "user#id"..group_owner
			if not is_admin2(group_owner) and not is_support(group_owner) then
				channel_demote(receiver, user, ok_cb, false)
			end
			local user_id = "user#id"..result.peer_id
			channel_set_admin(receiver, user_id, ok_cb, false)
			data[tostring(channel)]['set_owner'] = tostring(result.peer_id)
			save_data(_config.moderation.data, data)
			savelog(channel, name_log.." ["..from_id.."] set ["..result.peer_id.."] as owner by username")
		if result.username then
			text = member_username.." [ "..result.peer_id.." ] added as owner"
		else
			text = "[ "..result.peer_id.." ] added as owner"
		end
		send_large_msg(receiver, text)
  end]]
	elseif get_cmd == "promote" then
		local receiver = extra.channel
		local user_id = result.peer_id
		--local user = "user#id"..result.peer_id
		promote2(receiver, member_username, user_id)
		--channel_set_mod(receiver, user, ok_cb, false)
	elseif get_cmd == "demote" then
		local receiver = extra.channel
		local user_id = result.peer_id
		local user = "user#id"..result.peer_id
		demote2(receiver, member_username, user_id)
	elseif get_cmd == "demoteadmin" then
		local user_id = "user#id"..result.peer_id
		local channel_id = extra.channel
		if is_admin2(result.peer_id) then
			return send_large_msg(channel_id, "<i> ℹ️شما نمیتوانید ادمین های اصلی را برکنار کنید </i>")
		end
		channel_demote(channel_id, user_id, ok_cb, false)
		if result.username then
			--text = "<i> 👤کاربر </i> (@"..result.from.username..") <i> از مقام مدیریت گروه عزل شد</i> "
			text = "🔖 <i>انجام شد </i>\n>👤 <i> توانایی مدیریت گروه از کاربر: </i> (@"..result.from.username..") <i> گرفته شد! </i>\n<i> هم اکنون کاربر عادی است </i>"
			send_large_msg(channel_id, text)
		else
			--text = "<i> 👤کاربر </i> [ "..user_id.." ] <i> از مقام مدیریت گروه عزل شد </i>"
			text = "🔖 <i>انجام شد </i>\n>👤 <i> توانایی مدیریت گروه از کاربر: </i> ("..user_id..") <i> گرفته شد! </i>\n<i> هم اکنون کاربر عادی است </i>"
			send_large_msg(channel_id, text)
		end
		local receiver = extra.channel
		local user_id = result.peer_id
		local user_name = result.v.username
		--local user_nam = result.from.username
		demote_admin(receiver, member_username, user_id)
	elseif get_cmd == 'mute_user' then
		local user_id = result.peer_id
		local receiver = extra.receiver
		local chat_id = string.gsub(receiver, 'channel#id', '')
		if is_muted_user(chat_id, user_id) then
			unmute_user(chat_id, user_id)
			--send_large_msg(receiver, "🔖 <i>انجام شد </i>\n🔇 ><i> از لیست سکوت کاربران حذف گردید  </i>\n><i> مشخصات کاربر: </i> [@---]--[<b>"..user_id.."</b>]")
			  reply_msg(extra.msg.id, "🔖 <i>انجام شد </i>\n🔇 ><i> از لیست سکوت کاربران حذف گردید  </i>\n><i> مشخصات کاربر: </i> [@---]--[<b>"..user_id.."</b>]", ok_cb, true)
			--reply_msg(receiver,"🔖 <i>انجام شد </i>\n><i> از لیست سکوت کاربران حذف گردید </i>\n><i> مشخصات کاربر: </i> [---]--[<b>"..user_id.."</b>]",ok_cb,true)
		elseif is_owner(extra.msg) then
			mute_user(chat_id, user_id)
			--send_large_msg(receiver, "🔖 <i>انجام شد </i>\n🔊 ><i> به لیست سکوت کاربران افزوده گردید  </i>\n><i> مشخصات کاربر: </i> [@---]--[<b>"..user_id.."</b>]")
			--reply_msg(receiver,"🔖 <i>انجام شد </i>\n><i> به لیست سکوت کاربران افزوده گردید </i>\n><i> مشخصات کاربر: </i> [---]--[<b>"..user_id.."</b>]",ok_cb,true)
			reply_msg(extra.msg.id, "🔖 <i>انجام شد </i>\n🔊 ><i> به لیست سکوت کاربران افزوده گردید  </i>\n><i> مشخصات کاربر: </i> [@---]--[<b>"..user_id.."</b>]", ok_cb, true)
		end
	end
end
--End resolve username actions

--Begin non-channel_invite username actions
local function in_channel_cb(cb_extra, success, result)
  local get_cmd = cb_extra.get_cmd
  local receiver = cb_extra.receiver
  local msg = cb_extra.msg
  local data = load_data(_config.moderation.data)
  local print_name = user_print_name(cb_extra.msg.from):gsub("‮", "")
  local name_log = print_name:gsub("_", " ")
  local member = cb_extra.username
  local memberid = cb_extra.user_id
  if member then
    text = 'ℹ️کاربر [@'..member..'] در این سوپرگروه یافت نشد'
  else
    text = 'ℹ️کاربر ['..memberid..'] در این سوپرگروه یافت نشد'
  end
if get_cmd == "channel_block" then
  for k,v in pairs(result) do
    vusername = v.username
    vpeer_id = tostring(v.peer_id)
    if vusername == member or vpeer_id == memberid then
     local user_id = v.peer_id
     local channel_id = cb_extra.msg.to.id
     local sender = cb_extra.msg.from.id
      if user_id == sender then
        return send_large_msg("channel#id"..channel_id, " <i>ℹ️شما نمیتوانید خودتان را اخراج نمایید</i>")
      end
      if is_momod2(user_id, channel_id) and not is_admin2(sender) then
        return send_large_msg("channel#id"..channel_id, "<i>شما نمیتوانید مالک گروه/مدیر/ادمین ها را اخراج کنید</i>")
      end
      if is_admin2(user_id) then
        return send_large_msg("channel#id"..channel_id, " <i>شما نمیتوانید سایر ادمین ها را اخراج کنید</i>")
      end
      if v.username then
        text = ""
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: @"..v.username.." ["..v.peer_id.."]")
      else
        text = ""
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: ["..v.peer_id.."]")
      end
      kick_user(user_id, channel_id)
      local text = '><i>کاربر مورد نظر از گروه اخراج گردید</i>'
			return reply_msg(msg.id, text, ok_cb, false)
			--reply_msg(msg.reply_id,"🎟#کاربر به درخواست  [@"..(msg.from.username or "—-").."] از گروه اخراج گردید :(",ok_cb,true) 
    end
  end
elseif get_cmd == "setadmin" then
   for k,v in pairs(result) do
    vusername = v.username
    vpeer_id = tostring(v.peer_id)
    if vusername == member or vpeer_id == memberid then
      local user_id = "user#id"..result.from.id --v.peer_id
      local channel_id = "channel#id"..cb_extra.msg.to.id
      channel_set_admin(channel_id, user_id, ok_cb, false)
      if v.username then
        --text = "👤کاربر (@"..v.username..") با شناسه [ "..v.peer_id.." ] به مقام ادمین گروه ارتقاء یافت"
		text = "🔖 <i>انجام شد </i>\n>👤 <i>ادمین جدید: </i> (@"..v.username..")--{<b>"..user_id.."</b>}"
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] set admin @"..v.username.." ["..v.peer_id.."]")
      else
       --text = "👤کاربر [ "..v.peer_id.." ] به مقام ادمین گروه ارتقاء یافت"
	   text = "🔖 <i>انجام شد </i>\n>👤 <i>ادمین جدید: </i> (@"..v.username..")--{<b>"..user_id.."</b>}"
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] set admin "..v.peer_id)
      end
	  if v.username then
		member_username = "@"..v.username
	  else
		member_username = string.gsub(v.print_name, '_', ' ')
	  end
		local receiver = channel_id
		local user_id = v.peer_id
		promote_admin(receiver, member_username, user_id)

    end
    send_large_msg(channel_id, text)
    return
 end
 elseif get_cmd == 'setowner' then
	for k,v in pairs(result) do
		vusername = v.username
		vpeer_id = tostring(v.peer_id)
		if vusername == member or vpeer_id == memberid then
			local channel = string.gsub(receiver, 'channel#id', '')
			local from_id = cb_extra.msg.from.id
			local group_owner = data[tostring(channel)]['set_owner']
			if group_owner then
				if not is_admin2(tonumber(group_owner)) and not is_support(tonumber(group_owner)) then
					local user = "user#id"..group_owner
					channel_demote(receiver, user, ok_cb, false)
				end
					local user_id = "user#id"..v.peer_id
					channel_set_admin(receiver, user_id, ok_cb, false)
					data[tostring(channel)]['set_owner'] = tostring(v.peer_id)
					save_data(_config.moderation.data, data)
					savelog(channel, name_log.."["..from_id.."] set ["..v.peer_id.."] as owner by username")
				if result.username then
					--text = member_username.."🔖کاربر ["..v.peer_id.."] به مقام مالک گروه ارتقاء یافت"
					text = member_username.."🔖 <i>انجام شد </i>\n> <i> اطلاعات مالک جدید گروه: </i>\n> [<b>"..v.peer_id.."</b>]"
				else
					--text = "🔖کاربر ["..v.peer_id.."] به مقام مالک گروه ارتقاء یافت"
					text = "🔖 <i>انجام شد </i>\n> <i> اطلاعات مالک جدید گروه: </i>\n > [<b>"..v.peer_id.."</b>]"
				end
			end
		elseif memberid and vusername ~= member and vpeer_id ~= memberid then
			local channel = string.gsub(receiver, 'channel#id', '')
			local from_id = cb_extra.msg.from.id
			local group_owner = data[tostring(channel)]['set_owner']
			if group_owner then
				if not is_admin2(tonumber(group_owner)) and not is_support(tonumber(group_owner)) then
					local user = "user#id"..group_owner
					channel_demote(receiver, user, ok_cb, false)
				end
				data[tostring(channel)]['set_owner'] = tostring(memberid)
				save_data(_config.moderation.data, data)
				savelog(channel, name_log.."["..from_id.."] set ["..memberid.."] as owner by username")
				--text = "🔖کاربر ["..memberid.."] به مقام مالک گروه ارتقاء یافت"
				text = "🔖 <i>انجام شد </i>\n> <i> اطلاعات مالک جدید گروه: </i>\n  >[<b>"..memberid.."</b>]"
			end
		end
	end
 end
send_large_msg(receiver, text)
end
--End non-channel_invite username actions

--'Set supergroup photo' function
local function set_supergroup_photo(msg, success, result)
  local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)] then
      return
  end
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/photos/channel_photo_'..msg.to.id..'.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    channel_set_photo(receiver, file, ok_cb, false)
    data[tostring(msg.to.id)]['settings']['set_photo'] = file
    save_data(_config.moderation.data, data)
    send_large_msg(receiver, 'تصویر جدید ذخیره شد!', ok_cb, false)
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'خطا!مجدد سعی کنید', ok_cb, false)
  end
end

local function set_supergroup_photoreply(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/photos/channel_photo_'..msg.to.id..'.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    channel_set_photo(receiver, file, ok_cb, false)
   redis:del("photo:sticker")
	reply_msg(msg.id,"تصویر جدید با موفقیت ذخیره و تغییر یافت!",ok_cb,true) 
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'خطا!مجدد سعی کنید', ok_cb, false)
  end
end

local function callback_clean_members (extra, success, result)
  local msg = extra.msg
  local receiver = 'channel#id'..msg.to.id
  local channel_id = msg.to.id
  for k,v in pairs(result) do
  local users_id = v.peer_id
  kick_user(users_id,channel_id)
  end
end

local function callback_clean_bots (extra, success, result)
  local msg = extra.msg
  local receiver = 'channel#id'..msg.to.id
  local channel_id = msg.to.id
  for k,v in pairs(result) do
  local users_id = v.peer_id
  kick_user(users_id,channel_id)
  end
end

--[[local function callback_clean_deleted (extra, success, result)
local msg = extra.msg
  local receiver = 'channel#id'..msg.to.id
  local channel_id = msg.to.id
  for k,v in pairs(result) do
  local users_id = msg.from.first_name
  if not msg.from.first_name then
  kick_user(users_id,channel_id)
  end
end
end]]--
	
	local function check_member_super_deleted(cb_extra, success, result)
local receiver = cb_extra.receiver
 local msg = cb_extra.msg
  local deleted = 0 
if success == 0 then
send_large_msg(receiver, "ابتدا من را ادمین گروه کنید!") 
end
for k,v in pairs(result) do
  if not v.first_name and not v.last_name then
deleted = deleted + 1
 kick_user(v.peer_id,msg.to.id)
 end
 end
 send_large_msg(receiver, "<i> تعداد </i> [<b>"..deleted.."</b>] <i> کاربر حذف حساب کاربری شده در گروه با موفقیت حذف گردید! </i>")
 end 
 
--Run function
local function run(msg, matches)
	if msg.to.type == 'chat' then
		if matches[1] == 'tosuper' then
			if not is_admin1(msg) then
				return
			end
			local receiver = get_receiver(msg)
			chat_upgrade(receiver, ok_cb, false)
		end
	elseif msg.to.type == 'channel'then
		if matches[1] == 'tosuper' then
			if not is_admin1(msg) then
				return
			end
			return "ℹ️لطفا مجدد سعی نکنید! اینجا سوپرگروه است"
		end
	end
	if msg.to.type == 'channel' then
	local support_id = msg.from.id
	local receiver = get_receiver(msg)
	local print_name = user_print_name(msg.from):gsub("‮", "")
	local name_log = print_name:gsub("_", " ")
	local data = load_data(_config.moderation.data)
		if matches[1]:lower() == 'adding' or matches[1]:lower() == 'gadd' and not matches[2] then
			if not is_sudo(msg) and not is_support(support_id) then
				return
			end
			if is_super_group(msg) then
				return reply_msg(msg.id, 'ℹ️سوپر گروه [<b>'..msg.to.title..'</b>] از قبل به لیست دسترسی های مدیریت اضافه شده است', ok_cb, false)
			end
			print("SuperGroup "..msg.to.print_name.."("..msg.to.id..") added")
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] added SuperGroup")
			superadd(msg)
			set_mutes(msg.to.id)
			channel_set_admin(receiver, 'user#id'..msg.from.id, ok_cb, false)
		end
		if matches[1]:lower() == 'remove' or matches[1] == 'grem' and not matches[2] then
		if not is_sudo(msg) and not is_support(support_id) then
				return
			end
			if not is_super_group(msg) then
				return reply_msg(msg.id, 'ℹ️سوپرگروه [<b>'..msg.to.title..'</b>] به لیست دسترسی های مدیریتی اضافه نشده است', ok_cb, false)
			end
			print("SuperGroup "..msg.to.print_name.."("..msg.to.id..") removed")
			superrem(msg)
			rem_mutes(msg.to.id)
		end

		if not data[tostring(msg.to.id)] then
			return
		end
		----------------------
		if matches[1]:lower() == 'reset group' and not matches[2] then
			if not is_owner(msg) and not is_support(support_id) then
				return
			end
			
			resetrem(msg)
			rem_mutes(msg.to.id)
			resetadd(msg)
			set_mutes(msg.to.id)
			channel_set_admin(receiver, 'user#id'..msg.from.id, ok_cb, false)
		end
		-------------------------
		if matches[1]:lower() == "infogroup" then
			if not is_owner(msg) then
				return
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup info")
			channel_info(receiver, callback_info, {receiver = receiver, msg = msg})
		end

		if matches[1]:lower() == "groupinfo" then
			if not is_owner(msg) then
				return
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup info")
			channel_info(receiver, callback_groupinfo, {receiver = receiver, msg = msg})
		end
		
		if matches[1]:lower() == "admin list" then
			if not is_owner(msg) and not is_support(msg.from.id) then
				return
			end
			member_type = 'Admins'
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup Admins list")
			admins = channel_get_admins(receiver,callback, {receiver = receiver, msg = msg, member_type = member_type})
		end

		if matches[1]:lower() == "holder" then
			local group_owner = data[tostring(msg.to.id)]['set_owner']
			if not group_owner then
				return "#⃣مالک گروه یافت نشد!با @alireza_PT ارتباط برقرار کنید"
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] used /owner")
			local hour = os.date("%M") * 10
 local holder_hash = 'holder:'..hour..':'..msg.from.id
 local is_holder = redis:get(holder_hash)
if is_holder then
    return "🔖#کاربر (@"..msg.from.username..") برای دریافت شناسه مالک گروه دقایقی دیگر مجدد تلاش کنید!"
     elseif not is_holder then
     redis:set(holder_hash, true)
			send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/owner.webp", ok_cb, false)
			local text = "> <i> مالکین سوپرگروه </i> ["..msg.to.title.."]\n\n <b>1-</b> [<b>"..group_owner.."</b>]--[<i>@---</i>]"
			return reply_msg(msg.id, text, ok_cb, false)
		end
		end
		
		if matches[1]:lower() == "holder pv" then
		if not is_owner(msg) then
				return
			end
			local group_owner = data[tostring(msg.to.id)]['set_owner']
			if not group_owner then
				return "#⃣مالک گروه یافت نشد!با @alireza_PT ارتباط برقرار کنید"
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] used /owner")
			local text = "🎫مالک سوپر گروه ["..group_owner..']'
			send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
			--send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "اطلاعات مالک این سوپرگروه به خصوصی شما ارسال شد"
		end

		if matches[1] == "managers" then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group modlist")
			return modlist(msg)
			-- channel_get_admins(receiver,callback, {receiver = receiver})
		end

		if matches[1]:lower() == "bots" and is_owner(msg) then
			member_type = 'Bots'
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup bots list")
			channel_get_bots(receiver, callback, {receiver = receiver, msg = msg, member_type = member_type})
		end

	   if matches[2] == "deleted" and is_owner(msg) then
           local receiver = get_receiver(msg) 
           channel_get_users(receiver, check_member_super_deleted,{receiver = receiver, msg = msg})
       end
	   
		if matches[1]:lower() == "blocked" and is_owner(msg) then
			member_type = 'blocked_user'
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup blocked_user list")
			channel_get_blocked_user(receiver, callback, {receiver = receiver, msg = msg, member_type = member_type})
		end
		
		if matches[1]:lower() == "who list" and not matches[2] and is_owner(msg) then
			local user_id = msg.from.peer_id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup users list")
			channel_get_users(receiver, callback_wholist, {receiver = receiver})
		end

		if matches[1]:lower() == "who file" and not matches[2] and is_owner(msg) then
			local user_id = msg.from.peer_id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup users list")
			channel_get_users(receiver, callback_whofile, {receiver = receiver})
		end
		
		if matches[1]:lower() == "block list" and is_owner(msg) then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested Kicked users list")
			channel_get_kicked(receiver, callback_kickedlist, {receiver = receiver})
		end

		if matches[1]:lower() == "block file" and is_owner(msg) then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested Kicked users list")
			channel_get_kicked(receiver, callback_kickedfile, {receiver = receiver})
		end
		
		if matches[1]:lower() == 'del' and is_momod(msg) then
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'del',
					msg = msg
				}
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
				get_message(msg.reply_id, get_message_callback, cbreply_extra)
			end
		end

		if matches[1]:lower() == 'block' or matches[1]:lower() == 'kick' then
		if not is_momod(msg) then
				return
			end
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'channel_block',
					msg = msg
				}
				get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1] == 'block' or matches[1] == 'kick' and matches[2] and string.match(matches[2], '^%d+$') then
				--[[local user_id = matches[2]
				local channel_id = msg.to.id
				if is_momod2(user_id, channel_id) and not is_admin2(user_id) then
					return send_large_msg(receiver, "You can't kick mods/owner/admins")
				end
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: [ user#id"..user_id.." ]")
				kick_user(user_id, channel_id)]]
				local get_cmd = 'channel_block'
				local msg = msg
				local user_id = matches[2]
				channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, user_id=user_id})
			elseif matches[1] == "block" or matches[1] == 'kick' and matches[2] and not string.match(matches[2], '^%d+$') then
			--[[local cbres_extra = {
					channelid = msg.to.id,
					get_cmd = 'channel_block',
					sender = msg.from.id
				}
			    local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked: @"..username)
				resolve_username(username, callbackres, cbres_extra)]]
			local get_cmd = 'channel_block'
			local msg = msg
			local username = matches[2]
			local username = string.gsub(matches[2], '@', '')
			channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, username=username})
			end
		end
  
		if matches[1]:lower() == 'ids' and is_owner(msg) then
			if type(msg.reply_id) ~= "nil" and is_momod(msg) and not matches[2] then
				local cbreply_extra = {
					get_cmd = 'id',
					msg = msg
				}
				get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif type(msg.reply_id) ~= "nil" and matches[2] == "from" and is_momod(msg) then
				local cbreply_extra = {
					get_cmd = 'idfrom',
					msg = msg
				}
				get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif msg.text:match("@[%a%d]") then
				local cbres_extra = {
					channelid = msg.to.id,
					get_cmd = 'id'
				}
				local username = matches[2]
				local username = username:gsub("@","")
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested ID for: @"..username)
				resolve_username(username,  callbackres, cbres_extra)
			else
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup ID")
				local hour = os.date("%M") * 5
 local ids_hash = 'ids:'..hour..':'..msg.from.id
 local is_ids = redis:get(ids_hash)
if is_ids then
    local text = "برای دریافت شناسه خود دقایقی دیگر تلاش کنید"
	return reply_msg(msg.id, text, ok_cb, false)
     elseif not is_ids then
     redis:set(ids_hash, true)
				local text = '['..msg.from.id..']'
				return reply_msg(msg.id, text, ok_cb, false)
	  end
	  end
	  end
--[[local text = "🎟نام گروه : "..string.gsub(msg.to.print_name, "_", " ").. "\n🆔شناسه سوپرگروه : ["..msg.to.id.."]"
				return reply_msg(msg.id, text, ok_cb, false)
      else
	  local text = "🎟Group Name : "..string.gsub(msg.to.print_name, "_", " ").. "\n🆔SuperGroup ID : ["..msg.to.id.."]"
				return reply_msg(msg.id, text, ok_cb, false)
	  end
	  end
	  end]]--
	  
		if matches[1]:lower() == 'idspv' and is_owner(msg) then
			if type(msg.reply_id) ~= "nil" and is_momod(msg) and not matches[2] then
				local cbreply_extra = {
					get_cmd = 'id',
					msg = msg
				}
				get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif type(msg.reply_id) ~= "nil" and matches[2] == "from" and is_momod(msg) then
				local cbreply_extra = {
					get_cmd = 'idfrom',
					msg = msg
				}
				get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif msg.text:match("@[%a%d]") then
				local cbres_extra = {
					channelid = msg.to.id,
					get_cmd = 'id'
				}
				local username = matches[2]
				local username = username:gsub("@","")
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested ID for: @"..username)
				resolve_username(username,  callbackres, cbres_extra)
			else
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup ID")
				local text = "🎟نام گروه : "..string.gsub(msg.to.print_name, "_", " ").. "\n🆔شناسه سوپرگروه : ["..msg.to.id.."]"
				send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
				--send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/send.webp", ok_cb, false)
           return "شناسه این سوپرگروه به خصوصی شما ارسال شد"
			end
		end
		if matches[1]:lower() == 'group id' and is_owner(msg) then
			if msg.to.type == 'channel' then
            --local text = '》['..msg.to.id..']《'
			return reply_msg(msg.id,'> <i>Group ID</i>: {<b>'..msg.to.id..'</b>}',ok_cb, false)
			--..'<a href="http://telegram.me">'..msg.to.id..'</a>'
			end
		end
		----------------------------
		if msg.to.type == "channel" and is_owner(msg) then
		if matches[1]:lower() == "silent" then
			local chat_id = msg.to.id
			local hash = "mute_user:"..chat_id
			local user_id = ""
			if type(msg.reply_id) ~= "nil" then
				local receiver = get_receiver(msg)
				muteuser = get_message(msg.reply_id, silentuser_by_reply, {receiver = receiver, msg = msg})
			elseif matches[1]:lower() == "silent" and string.match(matches[2], '^%d+$') then
				local user_id = matches[2]
				if is_muted_user(chat_id, user_id) then 
					--return "["..user_id.."] is already silented."
					return reply_msg(msg.id,"><i> کاربر </i> ["..user_id.."] <i> از قبل در لیست سکوت کاربران قرار دارد. </i>",ok_cb,true)
      else
					mute_user(chat_id, user_id)
					--return "["..user_id.."] added to silent users list."
					return reply_msg(msg.id,"<i>انجام شد </i>\n><i>  به لیست سکوت کاربران افزوده گردید  </i>\n><i> مشخصات کاربر: </i> [<b>"..user_id.."</b>]",ok_cb,true)
			end
			elseif matches[1]:lower() == "silent" and not string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				resolve_username(username, silentuser_by_username, {receiver = receiver, msg=msg})
			end
		end
		

--silent user
		if matches[1]:lower() == "unsilent" then
			local chat_id = msg.to.id
			local hash = "mute_user:"..chat_id
			local user_id = ""
			if type(msg.reply_id) ~= "nil" then
				local receiver = get_receiver(msg)
				muteuser = get_message(msg.reply_id, unsilentuser_by_reply, {receiver = receiver, msg = msg})
			elseif matches[1]:lower() == "unsilent" and string.match(matches[2], '^%d+$') then
				local user_id = matches[2]
				if is_muted_user(chat_id, user_id) then
					unmute_user(chat_id, user_id)
					--return "["..user_id.."] removed from silent users list."
					return reply_msg(msg.id,"<i>انجام شد </i>\n><i>  از لیست سکوت کاربران حذف گردید  </i>\n><i> مشخصات کاربر: </i> [<b>"..user_id.."</b>]",ok_cb,true)
    else
					--return "["..user_id.."] is not silented."
					return reply_msg(msg.id,"><i> کاربر </i> ["..user_id.."] <i> در لیست حالت سکوت کاربران قرار ندارد. </i>",ok_cb,true)
				end
			elseif matches[1]:lower() == "unsilent" and not string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				resolve_username(username, unsilentuser_by_username, {receiver = receiver, msg=msg})
			end
		end
     if matches[1] == 'silentlist' then
			local chat_id = msg.to.id
     return muted_user_list(chat_id)
    end

			if matches[1] == 'clean' and matches[2] == 'silentlist' then

			local chat_id = msg.to.id
			local hash = "mute_user:"..chat_id
					redis:del(hash)
				--return "silent list has been cleaned."
				return reply_msg(msg.id,"><i> لیست کاربران حالت سکوت با موفقیت بازنشانی گردید. </i>",ok_cb,true)
			end
       end
    --end
		----------------------------
		if matches[1]:lower() == 'user id' then
			if msg.to.type == 'channel' then
			local file = io.open("./info/"..msg.from.id..".txt", "r")
		--if file ~= nil then
		if not file then
	local text = "<i> >کاربر </i> {<b>"..msg.from.first_name.."</b>}\n<i> ابتدا نیاز به تایید حساب کاربری خوددارید </i>\n<i> > برای تکمیل فرایند عضویت روی عبارت زیر کلیک کنید </i>\n> /activation"
	return reply_msg(msg.id, text, ok_cb, false)
	else
			local hour = os.date("%M")
 local userid_hash = 'userid:'..hour..':'..msg.from.id
 local is_userid = redis:get(userid_hash)
if is_userid then
    local text = "<i> 》کاربر </i> [@"..msg.from.username.."] <i> با توجه به محدودیت پیش آمده دقایقی دیگر مجدد تلاش کنید </i> ["..useridhash.."]"
	return reply_msg(msg.id, text, ok_cb, false)
     elseif not is_userid then
     redis:set(userid_hash, true)
          -- local text = '》['..msg.from.id..']《'
			return reply_msg(msg.id,'> <i>User ID</i>: {<b>'..msg.from.id..'</b>}',ok_cb, false)
			end
		end
		end
		end
		 
if matches[1]:lower() == 'setrank' then
  local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
  redis:incr(hash)
  if not is_sudo(msg) then
    return ""
  end
  local receiver = get_receiver(msg)
  local Reply = msg.reply_id
  if msg.reply_id then
  local value = string.sub(matches[2], 1, 1000)
    msgr = get_message(msg.reply_id, action_by_reply2, {receiver=receiver, Reply=Reply, value=value})
  else
  local name = string.sub(matches[2], 1, 50)
  local value = string.sub(matches[3], 1, 1000)
  local text = setrank(msg, name, value)

  return text
  end
  end
  ----------multi kick----------
  --[[if matches[1] == 'mban' and is_owner(msg) then
  local channel_id = msg.to.id
		ban_user(matches[2], msg.to.id)
		ban_user(matches[3], msg.to.id)
		ban_user(matches[4], msg.to.id)
		local text = "> <i> دسترسی کاربران </i> \n >[<b>"..matches[2].."</b>] \n >[<b>"..matches[3].."</b>] \n >[<b>"..matches[4].."</b>] \n <i> برای ورود به این گروه مسدود گردید! </i>"
		return reply_msg(msg.id, text, ok_cb, false)
	end
	
	if matches[1] == 'munban' and is_owner(msg) then
  local channel_id = msg.to.id
		unban_user(matches[2], msg.to.id)
		unban_user(matches[3], msg.to.id)
		unban_user(matches[4], msg.to.id)
		local text = "> <i> دسترسی کاربران </i> \n >[<b>"..matches[2].."</b>] \n >[<b>"..matches[3].."</b>] \n >[<b>"..matches[4].."</b>] \n <i> برای ورود به این گروه بازگردانده شد! </i>"
		return reply_msg(msg.id, text, ok_cb, false)
	end
	
	if matches[1] == 'mkick' and is_owner(msg) then
  local channel_id = msg.to.id
		ban_user(matches[2], msg.to.id)
		ban_user(matches[3], msg.to.id)
		ban_user(matches[4], msg.to.id)
		local text = "> <i> کاربران </i> \n >[<b>"..matches[2].."</b>] \n >[<b>"..matches[3].."</b>] \n >[<b>"..matches[4].."</b>] \n <i> از گروه اخراج شدند </i>"
		return reply_msg(msg.id, text, ok_cb, false)
	end]]
	---------kickme---------------
if matches[1]:lower() == 'kickme' then
			if msg.to.type == 'channel' then
			local file = io.open("./info/"..msg.from.id..".txt", "r")
		--if file ~= nil then
		if not file then
	local text = "<i> >کاربر </i> {<b>"..msg.from.first_name.."</b>}\n<i> ابتدا نیاز به تایید حساب کاربری خوددارید </i>\n<i> > برای تکمیل فرایند عضویت روی عبارت زیر کلیک کنید </i>\n> /activation"
	return reply_msg(msg.id, text, ok_cb, false)
	else
			local hour = os.date("%M") * 30
 local kickme_hash = 'kickme:'..hour..':'..msg.from.id
 local is_kickme = redis:get(kickme_hash)
if is_kickme then
    local text = " 》#کاربر (@"..msg.from.username..") از ارسال درخواست حذف مجدد خود از گروه خودداری کنید!(با کلیک بر روی گزینه Leave از گروه خارج شوید)"
	return reply_msg(msg.id, text, ok_cb, false)
     elseif not is_kickme then
     redis:set(kickme_hash, true)
            local text = "》<i> کاربر </i> ("..msg.from.first_name..") <i> این قابلیت غیرفعال است </i> (در صورت تمایل از گروه خارج شوید)"
			return reply_msg(msg.id, text, ok_cb, false)
			end
		end
		end
		end
		if matches[1]:lower() == 'info' and msg.reply_id then
			if msg.to.type == 'channel' then
            local text = '<i> 》شما فقط قادر به دریافت اطلاعات خود هستید! </i>'
			return reply_msg(msg.id, text, ok_cb, false)
			end
		end
--------------security-----------
if matches[1]:lower() == 'Security' then
if not is_owner(msg) then
        return
       end
local photos = '/root/TeleSeed/userinfo/ax.png'
local receiver = get_receiver(msg)
local text = 'Security BOT Version 3.6 :) by    @alireza_PT.'
 send_photo2(receiver,photos,text,ok_cb,false)
--send_photo2(receiver, photos, text, rmtmp_cb, cb_extra)
end
----------inprivate-----------
	if matches[1] == 'help' then
	if msg.to.type == 'user' then
		local text = 'ℹ️خوش آمدید به ربات Security\n\n ℹ️برای دریافت گروه با ربات Security, با ادمین ارتباط برقرار کنید:\n\n #⃣Admin:🆔 @alireza_PT or @CliApi\n\n ℹ️برای اطلاعات بیشتر, channel:\n@create_antispam_bot [Persian]'
     	return reply_msg(msg.id, text, ok_cb, false)
    end
	end
	---------------user inpm------------
	if matches[1]:lower() == 'help' then
	if msg.to.type == 'user' then
			 local text = "> سلام ["..msg.from.first_name.."] عزیز\n\nℹ️خوش آمدید به ربات Security\n\nℹ️برای دریافت گروه با ربات SecurityBOT, با ادمین ارتباط برقرار کنید:\n\n >Admin: @CliApi\n >PMresan: @alireza_PT_BOT\n\n ℹ️برای اطلاعات بیشتر:\n>channel: @create_antispam_bot [Persian]"
			reply_msg(msg.id, text, ok_cb, false)
	end
	end
	----------invite by username and reply--------------	
	if matches[1]:lower() == 'invite' and is_sudo(msg) then
            local chat_id = msg.to.id
            local chat_type = msg.to.type
            if msg.reply_id then
                get_message(msg.reply_id, add_by_reply, false)
                return
            end
   if matches[1]:lower() == 'invite' and is_sudo(msg) then
                local member = string.gsub(matches[2], '@', '')
                print(chat_id)
                resolve_username(member, add_by_username, {chat_id=chat_id, member=member, chat_type=chat_type})
                return
            else
                local user_id = matches[2]
                if chat_type == 'chat' then
                    chat_add_user('chat#id'..chat_id, 'user#id'..user_id, ok_cb, false)
                elseif chat_type == 'channel' then
                    channel_invite('channel#id'..chat_id, 'user#id'..user_id, ok_cb, false)
              end
            end
    end
	-------------------info security----------------
	if matches[1]:lower() == 'securitybot' or matches[1]:lower() == 'security' then
	local file = io.open("./info/"..msg.from.id..".txt", "r")
		--if file ~= nil then
		if not file then
	local text = "<i> >کاربر </i> {<b>"..msg.from.first_name.."</b>}\n<i> ابتدا نیاز به تایید حساب کاربری خوددارید </i>\n<i> > برای تکمیل فرایند عضویت روی عبارت زیر کلیک کنید </i>\n> /activation"
	return reply_msg(msg.id, text, ok_cb, false)
	else
	 fwd_msg('channel#id'..msg.to.id,'01000000eeb187094ba20000000000006b78cf56857533c7',ok_cb,false)
  end
  end
-------------------nerkh security----------------
	if matches[1]:lower() == 'nerkh' or matches[1]:lower() == 'ربات میخوام' or matches[1]:lower() == 'خرید ربات' then
	local file = io.open("./info/"..msg.from.id..".txt", "r")
		--if file ~= nil then
		if not file then
	local text = "<i> >کاربر </i> {<b>"..msg.from.first_name.."</b>}\n<i> ابتدا نیاز به تایید حساب کاربری خوددارید </i>\n<i> > برای تکمیل فرایند عضویت روی عبارت زیر کلیک کنید </i>\n> /activation"
	return reply_msg(msg.id, text, ok_cb, false)
	else
	 fwd_msg('channel#id'..msg.to.id,'01000000eeb18709cc090100000000006b78cf56857533c7',ok_cb,false)
  end
  end

-----------------cheak online bots------------------
--[[if string.find(msg.from.username , 'O_o_maghze_falaj_o_O') then
local text = '<i> >کاربر گرامی لطفا نسبت به تغییر نام خود اقدام کنید </i>'
return reply_msg(msg.id, text, ok_cb, false)
end
if string.find(msg.from.username , 'Tele_jooker') then
local text = '<i> یوهوووووووووووووووووووو </i>'
return reply_msg(msg.id, text, ok_cb, false)
end]]
		if matches[1]:lower() == 'bot' and is_owner(msg) then
			if msg.to.type == 'channel' then
            --local answers = {'<i>ربات فعال میباشد </i> ','<b>The robot is activated</b> ✅'}
            --return answers[math.random(#answers)] 
			return reply_msg(msg.id, '<b>BOT Online!</b>', ok_cb, false)
			end
			end
			if matches[1]:lower() == 'ping' then
			if msg.to.type == 'channel' then
			return reply_msg(msg.id, '<code>PONG!</code>', ok_cb, false)
			end
			end
			if matches[1]:lower() == 'pin' then
			if msg.to.type == 'channel' then
			return reply_msg(msg.id, '><b>YOUR HASH CODE:</b> <code>'..msg.from.access_hash..'</code>\n----------\n><b>YOUR Proprietary code:</b> <code>'..msg.from.flags..'</code>\n----------\n><b>Code statistically secret:</b> <code>'..msg.to.participants_count..'</code>', ok_cb, false)
			end
			end
		
			if matches[1] == "group reports" and is_owner(msg) then
if matches[2] == "enable" then
redis:set("reports:"..msg.to.id, true)
return reply_msg(msg.id, '<b>Activated!</b>\n<code>Now all changes made in the group will be announced by BOT</code>', ok_cb, false)
end
if matches[2] == "disable" then
redis:del("reports:"..msg.to.id)
return reply_msg(msg.id, '<b>Deactivated.</b>\n<code>Now a group report is not sent!</code>', ok_cb, false)
end
end
			if msg.service then 
		--local action = msg.action.type
			--if action == 'chat_add_user_link' then
			if msg.action and msg.action.type then
			if redis:get("reports:"..msg.to.id) then
			if msg.action.type == "chat_change_photo" then
			local url , res = http.request('http://api.gpmod.ir/time/')
			local jdat = json:decode(url)
if res ~= 200 then
 return 
  end
return reply_msg(msg.id, '>تغییر تصویر پروفایل گروه توسط کاربر [<code>'..msg.from.first_name..'</code>] در تاریخ {'..jdat.FAdate..'} و در ساعت {'..jdat.FAtime..'} انجام شد.', ok_cb, false)
elseif msg.action.type == "chat_delete_photo" then
return reply_msg(msg.id, '>تصویر پروفایل گروه توسط کاربر [<code>'..msg.from.first_name..'</code>] حذف گردید.', ok_cb, false)
elseif msg.action.type == "chat_rename" then
return reply_msg(msg.id, '>نام گروه فعلی به نام جدید (<b>'..msg.to.title..'</b>) توسط کاربر [<code>'..msg.from.first_name..'</code>] تغییر یافت.', ok_cb, false)
elseif msg.action.type == "delete_cnt" then 	
return "....."
end  
end
end
end

if matches[1]:lower() == 'mutechat' and is_owner(msg) then
       local hash = 'muteallchat:'..msg.to.id
       if not matches[2] then
              redis:set(hash, true)
			 return reply_msg(msg.id, '><code>فیلتر تمامی گفتگو ها فعال گردید!</code>', ok_cb, false)
 else 
local hour = string.gsub(matches[2], 'h', '')
 local num1 = tonumber(hour) * 3600
local minutes = string.gsub(matches[3], 'm', '')
 local num2 = tonumber(minutes) * 60
local second = string.gsub(matches[4], 's', '')
 local num3 = tonumber(second) 
local num4 = tonumber(num1 + num2 + num3)
redis:setex(hash, num4, true)
-- return "mute all has been enabled for\n⏺ hour(s) : "..matches[2].."\n⏺ minute(s) : "..matches[3].." \n⏺ second(s) : "..matches[4]..""
 return reply_msg(msg.id, '><code>فیلتر تمامی گفتگو ها برای مدت زمان</code>\n>[<b>'..matches[2]..'</b>]{ساعت}\n>[<b>'..matches[3]..'</b>]{دقیقه}\n>[<b>'..matches[4]..'</b>]{ثانیه}\n <code>فعال گردید</code>\n------------\n<code>پس از پایان مدت زمان تنظیم شده گروه به طور خودکار از حالت فیلتر خارج میگردد و نیاز به غیرفعال سازی به طور دستی نیست!</code>', ok_cb, false)
 end
 end
if matches[1]:lower() == 'unmutechat' and is_owner(msg) then
               local hash = 'muteallchat:'..msg.to.id
        redis:del(hash)
		   return reply_msg(msg.id, '><code>فیلتر تمامی گفتگو ها غیرفعال گردید!</code>', ok_cb, false)
  end
  --[[if matches[1] == '!id' or matches[1] == '/id'  then
			if msg.to.type == 'channel' then
			local file = io.open("./info/"..msg.from.id..".txt", "r")
		--if file ~= nil then
		if not file then
	local text = "<i> >کاربر </i> {<b>"..msg.from.first_name.."</b>}\n<i> ابتدا نیاز به تایید حساب کاربری خوددارید </i>\n<i> > برای تکمیل فرایند عضویت روی عبارت زیر کلیک کنید </i>\n> /activation"
	return reply_msg(msg.id, text, ok_cb, false)
	else
            local text = ':|'
			return reply_msg(msg.id, text, ok_cb, false)
			end
		end
		end]]

		------------whois------------
		if matches[1]:lower() == 'userinfo' and is_owner(msg) then
		local receiver = get_receiver(msg)
		local user_id = "user#id"..matches[2]
		user_info(user_id, cb_user_infouser, {receiver = receiver})
	end
	-----تنظیم مقام حرفه ای-------
	local data = load_data(_config.moderation.data)
	local gp_leader = data[tostring(msg.to.id)]['settings']['gp_leader']
	local org_chat_id = "channel#id"..msg.to.id
	local bot = {
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"0",
}
local bot1 = {
"a",
"b",
"c",
"d",
"e",
"f",
"g",
"h",
"i",
"j",
}
local bot2 = {
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"0",
}
local bot3 = {
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"0",
}
local bot4 = {
"x",
"c",
"z",
"b",
"v",
"l",
"k",
"p",
"m",
"o",
}
local bot5 = {
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"0",
}
local bot6 = {
"a",
"b",
"c",
"d",
"e",
"f",
"g",
"h",
"i",
"j",
}
local bot7 = {
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"0",
}
local bot8 = {
"x",
"c",
"z",
"b",
"v",
"l",
"k",
"p",
"m",
"o",
}
local bot9 = {
"a",
"b",
"c",
"d",
"e",
"f",
"g",
"h",
"i",
"j",
}
local bot10 = {
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"0",
}
local a = bot[math.random(#bot)]
local b = bot1[math.random(#bot1)]
local c = bot2[math.random(#bot2)]
local d = bot3[math.random(#bot3)]
local e = bot4[math.random(#bot4)]
local f = bot5[math.random(#bot5)]
local g = bot6[math.random(#bot6)]
local h = bot7[math.random(#bot7)]
local i = bot8[math.random(#bot8)]
local j = bot9[math.random(#bot9)]
local k = bot10[math.random(#bot10)]
	if is_sudo(msg) then
		access = 1
	else
		access = 0
	end
	if matches[1] == '/unsubscribe' and is_sudo(msg) then
		local azlemagham = io.popen('rm ./info/'..matches[2]..'.txt'):read('*all')
		local security = '> عضویت کاربر [<b>'..matches[2]..'</b>] لغو گردید\n> شناسه پیگیری: [<b>'..a..b..c..d..e..f..g..h..i..j..k..'</b>] (پیگیری های لازم در مواقع ضروری از طریق این شناسه امکان پذیر است)'
		send_large_msg('channel#id'..1070428460, security.."\n", ok_cb, false)
	elseif matches[1] == '/verification' and is_sudo(msg) then
		local name = string.sub(matches[2], 1, 50)
		--local userid = string.sub(matches[3], 1, 50)
		local text = string.sub(matches[3], 1, 10000000000)
		local file = io.open("./info/"..name..".txt", "w")
		file:write(text)
		file:flush()
		file:close() 
		local alireza = ">درخواست تایید عضویت حساب کاربر: (<b>"..matches[2].."</b>) با شناسه پیگیری [<b>"..a..b..c..d..e..f.."</b>] توسط [@CliApi] در ربات تایید شد✅"
	send_large_msg('channel#id'..1070428460, alireza.."\n", ok_cb, false)
	elseif #matches == 2 then
		local cbres_extra = {chatid = msg.to.id}
		if string.match(matches[2], '^%d+$') then
			return user_info('user#id'..matches[2], callback_infoo, cbres_extra)
	--	else
			--return res_user(matches[2]:gsub("@",""), callback_ress, cbres_extra)
		end
		end
		if matches[1] == '/rejected' and is_sudo(msg) then
		local azlemagham = io.popen('rm ./info/'..matches[2]..'.txt'):read('*all')
		local security = '> درخواست تایید حساب کاربر [@'..(matches[2] or '---')..']--(<b>'..matches[3]..'</b>) تایید نشد!🚫'
		send_large_msg('channel#id'..1070428460, security.."\n", ok_cb, false)
		end
------درخواست تایید کاربر-------
	if matches[1]:lower() == 'activation' then
	local file = io.open("./info/"..msg.from.id..".txt", "r")
		--if file ~= nil then
		if file then
	local text = "> اکانت کاربری شما به مشخصات [@"..(msg.from.username or "---").."]--(<b>"..msg.from.id.."</b>) در دیتابیس موجود است و نیاز به تایید مجدد نیست"
	return reply_msg(msg.id, text, ok_cb, false)
	else
local text3 = "لطفا اکانت کاربری من را تایید کنید"
local text4 = "confirmed"
local user = "channel#id"..1085622309
local data = load_data(_config.moderation.data)
local group_link = data[tostring(msg.to.id)]['settings']['set_link']
if not group_link then
group_link = "ثبت نشده است"
end
local exppm = '🔊 درخواست فعال سازی اکانت کاربری\n'
..'----------------------------------\n'
..'> نام گروه : [<b>'..msg.to.title..'</b>] \n'
..'> شناسه گروه : [<b>'..msg.to.id..'</b>] \n'
..'> لینک ورود به گروه : ['..group_link..'] \n'
..'> متن ارسالی:\n['..text3..'] \n'
..'----------------------------------\n'
..'🔖تایید اکانت :\n'
..'/verification_'..msg.from.id..'_'..text4..'\n'
..'----------------------------------\n'
..'🔖لغو عضویت :\n'
..'/unsubscribe_'..msg.from.id..'\n'
..'----------------------------------\n'
..'🔖امتناع از پذیرش تایید حساب :\n'
..'/rejected_'..msg.from.username..'_'..msg.from.id..'\n'
..'----------------------------------\n'
..'@TGSecurityBOT'
			local sends = send_msg(user, exppm, ok_cb, false)
			--send_large_msg('channel#id'..1051256714, exppm.."\n", ok_cb, false)
			local hour = os.date("%M") * 60
 local activation_hash = 'activation:'..hour..':'..msg.to.id
 local is_activation = redis:get(activation_hash)
if is_activation then
    local text = "<i> >کاربر </i> (<b>"..msg.from.first_name.."</b>) <i> درخواست شما درحال بررسی است... </i>\n<i> تا زمان تاییده نهایی منتظر بمانید و از ارسال درخواست مجدد خودداری کنید </i>"
	return reply_msg(msg.id, text, ok_cb, false)
     elseif not is_activation then
     redis:set(activation_hash, true)
		local text = "<i> > درخواست تایید اکانت کاربری خود ارسال گردید\nپس از تایید در گروه به نمایش درخواهد آمد </i>"
		return reply_msg(msg.id, text, ok_cb, false)
end
end
end

if matches[1]:lower() == "setwelcome" and is_owner(msg) then
local alirezapt = "welcome"..msg.to.id
redis:set(alirezapt, matches[2])
local alireza = "><code>پیغام خوش آمد گویی جدید با موفقیت ذخیره و تغییر یافت :-)</code> "
return reply_msg(msg.id, alireza, ok_cb, false)
end
if matches[1] == "delete welcome" and is_owner(msg) then
local alirezapt = "welcome"..msg.to.id
redis:del(alirezapt)
local alireza = "><code>پیغام خوش آمد گویی بازنشانی شد و به حالت پیشفرض تنظیم شد</code>"
return reply_msg(msg.id, alireza, ok_cb, false)
end
if matches[1] == "welcome" and is_owner(msg) then
if matches[2] == "on" then
redis:set("welcome:"..msg.to.id, true)
return reply_msg(msg.id, '><code>Welcome Message</code> <b>activated</b>\n<code>برای تغییر پیغام خوش آمد گویی به شکل زیر عمل کنید</code>\n<b>/setwelcome</b> <code>text</code>', ok_cb, false)
end
if matches[2] == "off" then
redis:del("welcome:"..msg.to.id)
return reply_msg(msg.id, '><b>Deactivated</b> <code>welcome message!</code>', ok_cb, false)
end
end
if redis:get("welcome:"..msg.to.id) then
if matches[1] == "chat_add_user_link" then
local alirezapt = "welcome"..msg.to.id
  local cliapi = redis:get(alirezapt)
            if cliapi then
local alireza = '> <code>'..cliapi..'</code>'
return reply_msg(msg.id, alireza, ok_cb, false)
else
if not cliapi then
local text = '><code>سلام</code>  '
..'{<code>'..msg.from.print_name..'</code>}--'
..'[@'..(msg.from.username or "---")..']\n'
..'<code>به گروه</code>  '
..'(<b>'..msg.to.title..'</b>)  '
..'<code>خوش آمدید</code>'
return reply_msg(msg.id, text, ok_cb, false)
end
end
end
end
if redis:get("welcome:"..msg.to.id) then
if matches[1] == "chat_add_user" then
local alirezapt = "welcome"..msg.to.id
  local cliapi = redis:get(alirezapt)
            if cliapi then
local alireza = '> <code>'..cliapi..'</code>'
return reply_msg(msg.id, alireza, ok_cb, false)
else
if not cliapi then
local text = '><code>سلام</code>  '
..'{<code>'..msg.action.user.print_name..'</code>}--'
..'[@'..(msg.action.user.username or "---")..']\n'
..'<code>ورود شما را به واسطه</code>  '
..'[<b>'..msg.from.print_name..'</b>]  '
..'<code>به گروه</code>  '
..'[<b>'..msg.to.title..'</b>]  '
..'<code>خوش آمد عرض مینمایم :)</code>'
return reply_msg(msg.id, text, ok_cb, false)
end
end
end
end
	--[[if matches[1]:lower() == "setnumber" then
local number = 'alirezapt7:'..msg.from.id
redis:set(number, matches[2])
local text = "🔖 <i> تغییرات با موفقیت اعمال شد :) </i> \n> <i> اکنون مجاز به استفاده از ربات هستید </i> <b>:)</b>\n"
return  reply_msg(msg.id, text, ok_cb, true)
end]]
	---------------admin.lua-----------------
	--[[local receiver = get_receiver(msg)
    local group = msg.to.id
	local print_name = user_print_name(msg.from):gsub("‮", "")
	local name_log = print_name:gsub("_", " ")
    if not is_admin1(msg) then
    	return 
    end
    if msg.media then
      	if msg.media.type == 'photo' and redis:get("bot:photo") then
      		if redis:get("bot:photo") == 'waiting' then
        		load_photo(msg.id, set_bot_photo, msg)
      		end
      	end
    end]]
    if matches[1] == "setbotphoto" and is_sudo(msg) then
    	redis:set("bot:photo", "waiting")
    	return 'Please send me bot photo now'
    end
    if matches[1] == "markread" and is_sudo(msg) then
    	if matches[2] == "on" then
    		redis:set("bot:markread", "on")
    		return "Mark read > on"
    	end
    	if matches[2] == "off" and is_sudo(msg) then
    		redis:del("bot:markread")
    		return "Mark read > off"
    	end
    	return
    end
    if matches[1] == "pm" and is_sudo(msg) then
    	local text = "Message From "..(msg.from.username or msg.from.last_name).."\n\nMessage : "..matches[3]
    	send_large_msg("user#id"..matches[2],text)
    	return "Message has been sent"
    end
    
    if matches[1] == "blockuser" and is_sudo(msg) then
    	if is_admin2(matches[2]) then
    		return "》شما نمیتوانید ادمین ها را مسدود کنید"
    	end
    	block_user("user#id"..matches[2],ok_cb,false)
    	local text = "》انجام شد! کاربر ["..matches[2].."] از اکانت کاربری ربات مسدود شد \n》یوزرنیم ربات: [ @TGSecurityBOT ]"
		return reply_msg(msg.id, text, ok_cb, false)
    end
    if matches[1] == "unblockuser" and is_sudo(msg) then
    	unblock_user("user#id"..matches[2],ok_cb,false)
    	local text = "》انجام شد! کاربر ["..matches[2].."] از اکانت کاربری ربات رفع مسدودیت شد \n》یوزرنیم ربات: [ @TGSecurityBOT ]"
		return reply_msg(msg.id, text, ok_cb, false)
    end
	
	if matches[1] == "import" and is_sudo(msg) then--join by group link
    	local hash = parsed_url(matches[2])
    	import_chat_link(hash,ok_cb,false)
    end
	
	if matches[1] == 'reload' and is_sudo(msg) then
		receiver = get_receiver(msg)
		reload_plugins(true)
		post_msg(receiver, "", ok_cb, false)
		--local text = "#Done Successfully :)"
		return reply_msg(msg.id,'<b>Done Successfully!</b>',ok_cb, false) 
	end
	
	if matches[1] == 'addlog' and is_sudo(msg) and not matches[2] then
		if is_log_group(msg) then
			return "Already a Log_SuperGroup"
		end
		print("Log_SuperGroup "..msg.to.title.."("..msg.to.id..") added")
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] added Log_SuperGroup")
		logadd(msg)
	end
	if matches[1] == 'remlog' and is_sudo(msg)and not matches[2] then
		if not is_log_group(msg) then
			return "Not a Log_SuperGroup"
		end
		print("Log_SuperGroup "..msg.to.title.."("..msg.to.id..") removed")
		savelog(msg.to.id, name_log.." ["..msg.from.id.."] added Log_SuperGroup")
		logrem(msg)
    return
end
	---------------end admin.lua------------------------
	--------badword.lua-----------------
	--------------end badword.lua---------------
	-----------setlaws for group--------------
	if matches[1]:lower() == 'lawsset' then
				rules = matches[3]
				local target = matches[2]
				return set_rules(msg, data, target)
			end
			-----------name set for group-------------
			if matches[1] == 'groupnameset' and is_admin1(msg) then
		    local new_name = string.gsub(matches[3], '_', ' ')
		    data[tostring(matches[2])]['settings']['set_name'] = new_name
		    save_data(_config.moderation.data, data)
		    local group_name_set = data[tostring(matches[2])]['settings']['set_name']
		    local chat_to_rename = 'chat#id'..matches[2]
			local channel_to_rename = 'channel#id'..matches[2]
		    rename_chat(to_rename, group_name_set, ok_cb, false)
			rename_channel(channel_to_rename, group_name_set, ok_cb, false)
			savelog(matches[3], "Group { "..group_name_set.." }  name changed to [ "..new_name.." ] by "..name_log.." ["..msg.from.id.."]")
		end
		--[[if matches[1] == 'flood banall' and is_owner(msg) then
			if msg.to.type == 'channel' then
            local text = 'Done! Spam will block users from all groups :)))'
			return reply_msg(msg.id, text, ok_cb, false)
			end
			end]]
	-----------show options group------------
if  matches[1]:lower() == 'options lock' and matches[2] == 'supergroup' and data[tostring(matches[3])]['settings'] then
			local target = matches[3]
			text = show_supergroup_settingsmod(msg, target)
			return text.."\nID: "..target.."\n"
		end	
		
		if  matches[1]:lower() == 'options more' and matches[2] == 'supergroup' and data[tostring(matches[3])]['settings'] then
			local target = matches[3]
			text = show_supergroup_settingspmore(msg, target)
			return text.."\nID: "..target.."\n"
		end	
		
		if  matches[1]:lower() == 'options general' and matches[2] == 'supergroup' and data[tostring(matches[3])]['settings'] then
			local target = matches[3]
			text = show_supergroup_settingsgeneral(msg, target)
			return text.."\nID: "..target.."\n"
		end	
  --------------options-------------------
		if matches[1]:lower() == 'options' and is_owner(msg) then
			if msg.to.type == 'channel' then
			local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
             local text = '<i> ⚙راهنمای بخش تنظیمات سوپرگروه: </i>\n____________________\n📕 <i> برای مشاهده بخش تنظیمات قفل های مربوط به تنطیمات سوپرگروه عبارت زیر را ارسال کنید </i>\n📂 #options lock\n____________________\n📕<i> برای مشاهده بخش تنظیمات سوئیچ ها و حالت های کارکرد ربات مربوط به تنطیمات سوپرگروه عبارت زیر را ارسال کنید </i>\n📂#options more\n\n____________________\n📕<i> برای مشاهده بخش تنظیمات  عمومی  مربوط به تنطیمات سوپرگروه عبارت زیر را ارسال کنید </i>\n📂#options general\n____________________\nمالک ربات : @AliReza_PT\nکانال من! :\n @Create_AntiSpam_Bot'
			return reply_msg(msg.id, text, ok_cb, false)
			else
			local text = '<b> ⚙Directory Settings SuperGroup: </b>\n____________________\n📕 <b> To view the locking settings for setting up a super group submit the following words </b>\n📂 #options lock\n____________________\n📕<b> To view the switch settings and operation modes corresponding to the settings robot Svprgrvh submit the following words </b>\n📂#options more\n____________________\n📕<b> To view the General Settings section of the Settings Super Group to submit the following statement </b>\n📂#options general\n____________________\n<b> Robot owner: </b> @AliReza_PT\n<b> My channel!: </b>\n @Create_AntiSpam_Bot'
			
			return reply_msg(msg.id, text, ok_cb, false)
			end
		end
		end
		
		if matches[1]:lower() == 'options pv' and is_owner(msg) then
			if msg.to.type == 'channel' then
			 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
             local text = '⚙راهنمای بخش تنظیمات سوپرگروه:\n____________________\n📕برای مشاهده بخش تنظیمات قفل های مربوط به تنطیمات سوپرگروه عبارت زیر را ارسال کنید\n📂 #options lock\n____________________\n📕برای مشاهده بخش تنظیمات سوئیچ ها و حالت های کارکرد ربات مربوط به تنطیمات سوپرگروه عبارت زیر را ارسال کنید\n📂#options more\n\n____________________\n📕برای مشاهده بخش تنظیمات  عمومی  مربوط به تنطیمات سوپرگروه عبارت زیر را ارسال کنید\n📂#options general\n____________________\nمالک ربات : @AliReza_PT\nکانال پشتیبانی ربات :\n @Create_AntiSpam_Bot :)'
			send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "ℹ️راهنمای پخش های تنظیمات گروه به خصوصی شما ارسال شد(FA)"
			else
			local text = '<b>⚙Directory Settings SuperGroup:</b>\n____________________\n📕To view the locking settings for setting up a super group submit the following words\n📂 #options lock\n____________________\n📕To view the switch settings and operation modes corresponding to the settings robot Svprgrvh submit the following words\n📂#options more\n____________________\n📕To view the General Settings section of the Settings Super Group to submit the following statement\n📂#options general\n____________________\nRobot owner : @AliReza_PT\nBot Support Channel :\n @Create_AntiSpam_Bot :)'
			send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "<b>ℹ️Guide your player was sent to a private group settings</b>(EN)"
			end
		end
		end
		
		if matches[1]:lower() == 'newlink' and is_owner(msg) then
			local function callback_link (extra , success, result)
			local receiver = get_receiver(msg)
				if success == 0 then
					send_large_msg(receiver, '*خطا در بارگذاری لینک* \nℹ️دلیل: سازنده گروه نیست\n\nℹ️اگر لینک را دارید از دستور /setlink استفاده کنید')
					data[tostring(msg.to.id)]['settings']['set_link'] = nil
					save_data(_config.moderation.data, data)
				else
					send_large_msg(receiver, "<i> ℹ️لینک جدید برای ورود به گروه با موفقیت ساخته شد </i>")
					data[tostring(msg.to.id)]['settings']['set_link'] = result
					save_data(_config.moderation.data, data)
				end
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] attempted to create a new SuperGroup link")
			export_channel_link(receiver, callback_link, false)
		end
		
		if matches[1]:lower() == 'setlink' and is_owner(msg) then
			data[tostring(msg.to.id)]['settings']['set_link'] = 'waiting'
			save_data(_config.moderation.data, data)
			return '<i> ℹ️اکنون لینک گروه را ارسال کنید </i>'
		end

		if msg.text then
			if msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") and data[tostring(msg.to.id)]['settings']['set_link'] == 'waiting' and is_owner(msg) then
				data[tostring(msg.to.id)]['settings']['set_link'] = msg.text
				save_data(_config.moderation.data, data)
				return "<i> ℹ️لینک جدید تنظیم شد </i>"
			end
		end

		if matches[1]:lower() == 'setlinkchannel' and is_owner(msg) then
			data[tostring(msg.to.id)]['settings']['set_linkchannel'] = 'waiting'
			save_data(_config.moderation.data, data)
			return '<i> 🔖اکنون لینک کانال را ارسال کنید </i>'
		end

		if msg.text then
			if msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") and data[tostring(msg.to.id)]['settings']['set_linkchannel'] == 'waiting' and is_owner(msg) then
				data[tostring(msg.to.id)]['settings']['set_linkchannel'] = msg.text
				save_data(_config.moderation.data, data)
				return "<i> 🔖لینک کانال با موفقیت ذخیره شد </i>"
			end
		end
		
		if matches[1]:lower() == 'setuserchannel' and is_owner(msg) then
			data[tostring(msg.to.id)]['settings']['set_userchannel'] = 'waiting'
			save_data(_config.moderation.data, data)
			return '<i> 🔖اکنون یوزرنیم کانال را ارسال کنید </i>'
		end

		if msg.text then
			if msg.text:match("^@(.*)$") and data[tostring(msg.to.id)]['settings']['set_userchannel'] == 'waiting' and is_owner(msg) then
				data[tostring(msg.to.id)]['settings']['set_userchannel'] = msg.text
				save_data(_config.moderation.data, data)
				return "<i> 🔖یوزرنیم جدید کانال با موفقیت تنظیم شد </i>"
			end
		end
		
		if matches[1]:lower() == 'setusertag' and is_owner(msg) then
			data[tostring(msg.to.id)]['settings']['set_usertag'] = 'waiting'
			save_data(_config.moderation.data, data)
			return '<i> 🎟اکنون تگ جدید را ارسال کنید </i>'
		end

		if msg.text then
			if msg.text:match("^#(.*)$") and data[tostring(msg.to.id)]['settings']['set_usertag'] == 'waiting' and is_owner(msg) then
				data[tostring(msg.to.id)]['settings']['set_usertag'] = msg.text
				save_data(_config.moderation.data, data)
				return "<i> 🎟تگ جدید با موفقیت ذخیره و تغییر یافت </i>"
			end
		end
		
		if matches[1]:lower() == 'setlinkgroup' and msg.text:match("([https?://w]*.?telegram.me/joinchat/%S+)$") and is_owner(msg) then
			data[tostring(msg.to.id)]['settings']['set_linkgroup'] = 'waiting'
			save_data(_config.moderation.data, data)
			return '<i> ℹ️آیا لینک ارسالی شما صحیح است؟ </i>\n____________________\n⬅️تایید = ارسال مجدد لینک'
		else
		if msg.text then
			if msg.text:match("([https?://w]*.?telegram.me/joinchat/%S+)") and data[tostring(msg.to.id)]['settings']['set_linkgroup'] == 'waiting' and is_owner(msg) then
				data[tostring(msg.to.id)]['settings']['set_linkgroup'] = msg.text
				save_data(_config.moderation.data, data)
				 return '<i> 🔖لینک جدید گروه با موفقیت ذخیره و تغییر یافت </i>'
			end
		end
		end
		
		if matches[1]:lower() == 'link' then
			if not is_momod(msg) then
				return
			end
			local group_link = data[tostring(msg.to.id)]['settings']['set_link']
			if not group_link then
				local text = "ℹ️ابتدا لینک جدید را با استفاده از دستور /newlink بسازید!\n\nℹ️یا اگر ربات سازنده گروه نیست با استفاده از دستور /setlink لینک گروه را تنظیم کنید"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
			local hour = os.date("%M") * 5
 local link_hash = 'link:'..hour..':'..msg.from.id
 local is_link = redis:get(link_hash)
if is_link then
   local text = "You attempted too! Try again in a few minutes :("
   return reply_msg(msg.id, text, ok_cb, false)
     elseif not is_link then
     redis:set(link_hash, true)
	 local hash = 'group:'..msg.to.id
    local group_lang = redis:hget(hash,'lang')
    if group_lang then
			local text = '> <i>نام گروه:</i> [<b>'..msg.to.title..'</b>]\n> <i>لینک ورود به گروه:</i> '
--..'<a href="'..group_link..'">لینک(کلیک کنید)</a>'
			return reply_msg(msg.id, text, ok_cb, false)
			 else
	local text = '> <b>Group Name:</b> [<i>'..msg.to.title..'</i>]\n> <b>SuperGroup Link:</b>\n' --['..cliapi..']
--..'<a href="'..cliapi..'">Link (click)</a>'
..'['..group_link..']'
			return reply_msg(msg.id, text, ok_cb, false)
			
		end
		end
		end
		
		if matches[1]:lower() == 'linkpv' then
			if not is_owner(msg) then
				return
			end
			local group_link = data[tostring(msg.to.id)]['settings']['set_link']
			if not group_link then
				local text = "ℹ️ابتدا لینک جدید را با استفاده از دستور /newlink بسازید!\n\nℹ️یا اگر ربات سازنده گروه نیست با استفاده از دستور /setlink لینک گروه را تنظیم کنید"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
			local text = '> <b>Group Name:</b> [<i>'..msg.to.title..'</i>]\n> <b>SuperGroup Link:</b>\n' --['..cliapi..']
--..'<a href="'..cliapi..'">Link (click)</a>'
..'['..group_link..']'
			 send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "ℹ️لینک ورود به گروه به خصوصی شما ارسال شد"
		end
		
		if matches[1]:lower() == 'linkchannel' then
			if not is_momod(msg) then
				return
			end
			local linkchannel = data[tostring(msg.to.id)]['settings']['set_linkchannel']
			if not linkchannel then
				local text = "ابتدا لینک دوم گروه را با استفاده از دستور /setlinkchannel تنظیم کنید"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..linkchannel.."]")
			local text = "👤درخواست کننده : "..msg.from.first_name.."\n🏷لینک ورود به گروه (2):\n____________________\n"..linkchannel
			return reply_msg(msg.id, text, ok_cb, false)
		end
		
		if matches[1]:lower() == 'linkchannel pv' then
			if not is_owner(msg) then
				return
			end
			local linkchannel = data[tostring(msg.to.id)]['settings']['set_linkchannel']
			if not linkchannel then
				local text = "ابتدا لینک دوم گروه را با استفاده از دستور <b>/setlinkchannel</b> تنظیم کنید"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..linkchannel.."]")
			local text = "👤درخواست کننده : "..msg.from.first_name.."\n🏷لینک ورود به کانال:\n____________________\n"..linkchannel
			send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "ℹ️لینک ورود به گروه دوم به خصوصی شما ارسال شد"
		end
		
		if matches[1]:lower() == 'userchannel' then
			if not is_momod(msg) then
				return
			end
			local userchannel = data[tostring(msg.to.id)]['settings']['set_userchannel']
			if not userchannel then
				local text = "<i> ابتدا یوزرنیم جدید کانال را با استفاده از دستور /setuserchannel تنظیم کنید </i>"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..userchannel.."]")
				local hour = os.date("%M") * 15
 local userchannel_hash = 'userchannel:'..hour..':'..msg.from.id
 local is_userchannel = redis:get(userchannel_hash)
if is_userchannel then
   local text = "<b>About every 15 minutes you are entitled to receive a username channel</b>"
   return reply_msg(msg.id, text, ok_cb, false)
     elseif not is_userchannel then
     redis:set(userchannel_hash, true)
			local text = "👤<i> درخواست کننده: </i> "..msg.from.first_name.."\n🏷<i> یوزرنیم ورود به کانال: </i>\n____________________\n"..userchannel
			return reply_msg(msg.id, text, ok_cb, false)
		end
		end
		
		if matches[1]:lower() == 'userchannel pv' then
			if not is_owner(msg) then
				return
			end
			local userchannel = data[tostring(msg.to.id)]['settings']['set_userchannel']
			if not userchannel then
				local text = "ابتدا یوزرنیم جدید کانال را با استفاده از دستور /seruserchannel تنظیم کنید"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..userchannel.."]")
			local text = "👤<i> درخواست کننده: </i> "..msg.from.first_name.."\n🏷<i> یوزرنیم ورود به کانال: </i>\n____________________\n"..userchannel
			send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "ℹ️یوزرنیم کانال به خصوصی شما ارسال شد"
		end
		
		if matches[1]:lower() == 'usertag' then
			if not is_momod(msg) then
				return
			end
			local usertag = data[tostring(msg.to.id)]['settings']['set_usertag']
			if not usertag then
				local text = "تگ جدید ثبت نشده است.ابتدا با استفاده از دستور /setusertag تگ جدید را تنظیم کنید"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..usertag.."]")
			local hour = os.date("%M") * 15
 local usertag_hash = 'usertag:'..hour..':'..msg.from.id
 local is_usertag = redis:get(usertag_hash)
if is_usertag then
   local text = "<b>About every 15 minutes you are entitled to receive a username tag</b>"
   return reply_msg(msg.id, text, ok_cb, false)
     elseif not usertag then
     redis:set(usertag_hash, true)
			local text = "<i> 👤درخواست کننده: </i> "..msg.from.first_name.."\n🏷<i> یوزرنیم تگ شده: </i>\n____________________\n"..usertag
			return reply_msg(msg.id, text, ok_cb, false)
		end
		end
		
		if matches[1]:lower() == 'usertag pv' then
			if not is_sudo(msg) then
				return
			end
			local usertag = data[tostring(msg.to.id)]['settings']['set_usertag']
			if not usertag then
				local text = "<i> تگ جدید ثبت نشده است.ابتدا با استفاده از دستور </i> <b>/setusertag</b> <i> تگ جدید را تنظیم کنید </i>"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..usertag.."]")
			local text = "<i> 👤درخواست کننده: </i> "..msg.from.first_name.."\n<i> یوزر تگ شده: </i>\n____________________\n"..usertag
			send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "<i> ℹ️تگ یوزر به خصوصی شما ارسال شد </i>"
		end
		
		-------------
		if matches[1]:lower() == "setlinks" and is_owner(msg) then
local alirezapt = "links"..msg.from.id
redis:set(alirezapt, matches[2])
local alireza = "<i> 🔖لینک جدید با موفقیت ذخیره گردید </i>"
return reply_msg(msg.id, alireza, ok_cb, false)
end

if matches[1] == "clean links" and is_owner(msg) then
local alirezapt = "links"..msg.from.id
redis:del(alirezapt)
local alireza = "<i> لینک ذخیره شده با موفقیت حذف گردید! </i>"
return reply_msg(msg.id, alireza, ok_cb, false)
end

if matches[1] == "links" and is_owner(msg) then
local alirezapt = "links"..msg.from.id
  local cliapi = redis:get(alirezapt)
            if cliapi then
--local alireza = "》<b>Group Name:</b> ["..msg.to.title.."]\n____________________\n><b>Group Link:</b> ["..redis:get(alirezapt).."]"
local alireza = '> <b>Group Name:</b> [<i>'..msg.to.title..'</i>]\n> <b>SuperGroup Link:</b>\n' --['..cliapi..']
--..'<a href="'..cliapi..'">Link (click)</a>'
..'['..cliapi..']'
return reply_msg(msg.id, alireza, ok_cb, false)
else
if not cliapi then
local text = "<i> > لینک گروه یافت نشد! با استفاده از دستور [/setlinks] لینک جدید را تنظیم کنید </i>"
return reply_msg(msg.id, text, ok_cb, false)
end
end
end

--[[if matches[1]:lower() == "setuserchannels" then
local alirezapt2 = "userchannel2"..msg.from.id
local alirezapt3 = "userchannel3"..msg.from.id
local alirezapt4 = "userchannel4"..msg.from.id
local alirezapt5 = "userchannel5"..msg.from.id
local alirezapt6 = "userchannel6"..msg.from.id
local alirezapt7 = "userchannel7"..msg.from.id
redis:set(alirezapt2, matches[2])
redis:set(alirezapt3, matches[3])
redis:set(alirezapt4, matches[4])
redis:set(alirezapt5, matches[5])
redis:set(alirezapt6, matches[6])
redis:set(alirezapt7, matches[7])
local alireza = "🔖یوزرنیم های ارسالی با موفقیت ذخیره گردید"
return reply_msg(msg.id, alireza, ok_cb, false)
end

if matches[1]:lower() == "clean userchannels" then
local alirezapt2 = "userchannel2"..msg.from.id
local alirezapt3 = "userchannel3"..msg.from.id
local alirezapt4 = "userchannel4"..msg.from.id
local alirezapt5 = "userchannel5"..msg.from.id
local alirezapt6 = "userchannel6"..msg.from.id
local alirezapt7 = "userchannel7"..msg.from.id
redis:del(alirezapt2)
redis:del(alirezapt3)
redis:del(alirezapt4)
redis:del(alirezapt5)
redis:del(alirezapt6)
redis:del(alirezapt7)
local alireza = " یوزرنیم های ذخیره شده با موفقیت حذف گردید!"
return reply_msg(msg.id, alireza, ok_cb, false)
end

if matches[1] == "userchannels" then
local alirezapt2 = "userchannel2"..msg.from.id
local alirezapt3 = "userchannel3"..msg.from.id
local alirezapt4 = "userchannel4"..msg.from.id
local alirezapt5 = "userchannel5"..msg.from.id
local alirezapt6 = "userchannel6"..msg.from.id
local alirezapt7 = "userchannel7"..msg.from.id
local alireza = "👤درخواست کننده : ["..msg.from.first_name.."]\n____________________\n🎟|نام منتخب|: ["..(redis:get(alirezapt2) or "یافت نشد").."] > |یوزرنیم|: [@"..(redis:get(alirezapt3) or "یافت نشد").."]\n\n🎟|نام منتخب|: ["..(redis:get(alirezapt4) or "یافت نشد").."] > |یوزرنیم|: [@"..(redis:get(alirezapt5) or "یافت نشد").."]\n\n🎟|نام منتخب|: ["..(redis:get(alirezapt6) or "یافت نشد").."] > |یوزرنیم|: [@"..(redis:get(alirezapt7) or "یافت نشد").."]"
return reply_msg(msg.id, alireza, ok_cb, false)
else
local text = "ℹ️لینک گروه یافت نشد! با استفاده از دستور /setlink لینک جدید را تنظیم کنید "
return reply_msg(msg.id, alireza, ok_cb, false)
end]]
--------------------
--[[if matches[1] == "setchannelgroup" then
local alirezapt2 = "userchannel2"..msg.from.id
local alirezapt3 = "userchannel3"..msg.from.id
local alirezapt4 = "userchannel4"..msg.from.id
local alirezapt5 = "userchannel5"..msg.from.id
redis:set(alirezapt2, matches[2])
redis:set(alirezapt3, matches[3])
redis:set(alirezapt4, matches[4])
redis:set(alirezapt5, matches[5])
local alireza = "🔖یوزرنیم و لینک ارسالی با موفقیت بروزرسانی شد\nبرای نمایش عبارت /channel group را ارسال کنید"
return reply_msg(msg.id, alireza, ok_cb, false)
end

if matches[1] == "clean channelgroup" then
local alirezapt2 = "userchannel2"..msg.from.id
local alirezapt3 = "userchannel3"..msg.from.id
local alirezapt4 = "userchannel4"..msg.from.id
local alirezapt5 = "userchannel5"..msg.from.id
redis:del(alirezapt2)
redis:del(alirezapt3)
redis:del(alirezapt4)
redis:del(alirezapt5)
local alireza = " یوزرنیم و لینک ذخیره شده با موفقیت حذف گردید"
return reply_msg(msg.id, alireza, ok_cb, false)
end

if matches[1] == "channel group" then
local alirezapt2 = "userchannel2"..msg.from.id
local alirezapt3 = "userchannel3"..msg.from.id
local alirezapt4 = "userchannel4"..msg.from.id
local alirezapt5 = "userchannel5"..msg.from.id
local alireza = "👤درخواست کننده : ["..msg.from.first_name.."]\n____________________\n🔖|نام کانال|: ["..(redis:get(alirezapt2) or "یافت نشد").."]\n > (یوزرنیم ورود به کانال): [@"..(redis:get(alirezapt3) or "یوزرنیم کانال ثبت نشده است").."]\n____________________\n🔖|نام گروه|: ["..(redis:get(alirezapt4) or "یافت نشد").."]\n > (لینک ورود به گروه): ["..(redis:get(alirezapt5) or "لینک گروه ثبت نشده است").."]"
return reply_msg(msg.id, alireza, ok_cb, false)
else
local text = "ℹ️لینک گروه یافت نشد! با استفاده از دستور /setlink لینک جدید را تنظیم کنید "
return reply_msg(msg.id, alireza, ok_cb, false)
end]]
----------Leave from Group------------
if matches[1]:lower() == 'leave' and matches[2] and is_sudo(msg) then 
local data = load_data(_config.moderation.data)
local group_name = data[tostring(matches[2])]['settings']['set_name']
leave_channel("channel#id"..matches[2], ok_cb, false)
return reply_msg(msg.id, "》 <i> ربات </i> [ @TGSecurityBOT ] <i> با موفقیت از سوپرگروه </i> [<b>"..group_name.."</b>] <i> خارج گردید </i>", ok_cb, false)
end
----------------------
		if matches[1]:lower() == "invite" and is_sudo(msg) then
			local cbres_extra = {
				channel = get_receiver(msg),
				get_cmd = "invite"
			}
			local username = matches[2]
			local username = username:gsub("@","")
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] invited @"..username)
			resolve_username(username,  callbackres, cbres_extra)
		end

		if matches[1]:lower() == 'res' and is_momod(msg) then
			local cbres_extra = {
				channelid = msg.to.id,
				get_cmd = 'res'
			}
			local username = matches[2]
			local username = username:gsub("@","")
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] resolved username: @"..username)
			resolve_username(username,  callbackres, cbres_extra)
		end
		--[[if matches[1] == 'kick' and is_momod(msg) then
			local receiver = channel..matches[3]
			local user = "user#id"..matches[2]
			chaannel_kick(receiver, user, ok_cb, false)
		end]]

			if matches[1]:lower() == 'adminset' then
				if not is_support(msg.from.id) and not is_owner(msg) then
					return
				end
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'setadmin',
					msg = msg
				}
				setadmin = get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1]:lower() == 'adminset' and matches[2] and string.match(matches[2], '^%d+$') then
			--[[]	local receiver = get_receiver(msg)
				local user_id = "user#id"..matches[2]
				local get_cmd = 'setadmin'
				user_info(user_id, cb_user_info, {receiver = receiver, get_cmd = get_cmd})]]
				local get_cmd = 'setadmin'
				local msg = msg
				local user_id = matches[2]
				channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, user_id=user_id})
			elseif matches[1] == 'adminset' and matches[2] and not string.match(matches[2], '^%d+$') then
				--[[local cbres_extra = {
					channel = get_receiver(msg),
					get_cmd = 'setadmin'
				}
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] set admin @"..username)
				resolve_username(username, callbackres, cbres_extra)]]
				local get_cmd = 'setadmin'
				local msg = msg
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, username=username})
			end
		end

		if matches[1]:lower() == 'admindem' then
			if not is_support(msg.from.id) and not is_owner(msg) then
				return
			end
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'demoteadmin',
					msg = msg
				}
				demoteadmin = get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1]:lower() == 'admindem' and matches[2] and string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local user_id = "user#id"..matches[2]
				local get_cmd = 'demoteadmin'
				user_info(user_id, cb_user_info, {receiver = receiver, get_cmd = get_cmd})
			elseif matches[1]:lower() == 'admindem' and matches[2] and not string.match(matches[2], '^%d+$') then
				local cbres_extra = {
					channel = get_receiver(msg),
					get_cmd = 'demoteadmin'
				}
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted admin @"..username)
				resolve_username(username, callbackres, cbres_extra)
			end
		end

		if matches[1]:lower() == 'holderset' and is_sudo(msg) then
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'setowner',
					msg = msg
				}
				setowner = get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1] == 'holderset' and matches[2] and string.match(matches[2], '^%d+$') then
		--[[	local group_owner = data[tostring(msg.to.id)]['set_owner']
				if group_owner then
					local receiver = get_receiver(msg)
					local user_id = "user#id"..group_owner
					if not is_admin2(group_owner) and not is_support(group_owner) then
						channel_demote(receiver, user_id, ok_cb, false)
					end
					local user = "user#id"..matches[2]
					channel_set_admin(receiver, user, ok_cb, false)
					data[tostring(msg.to.id)]['set_owner'] = tostring(matches[2])
					save_data(_config.moderation.data, data)
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set ["..matches[2].."] as owner")
					local text = "[ "..matches[2].." ] added as owner"
					return text
				end]]
				local	get_cmd = 'setowner'
				local	msg = msg
				local user_id = matches[2]
				channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, user_id=user_id})
			elseif matches[1]:lower() == 'holderset' and matches[2] and not string.match(matches[2], '^%d+$') then
				local	get_cmd = 'setowner'
				local	msg = msg
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				channel_get_users (receiver, in_channel_cb, {get_cmd=get_cmd, receiver=receiver, msg=msg, username=username})
			end
		end

		if matches[1]:lower() == 'modset' then
		  if not is_momod(msg) then
				return
			end
			if not is_owner(msg) then
				local text = "<i>ℹ️فقط مالک گروه/ادمین میتواند ارتقا مقام دهد</i>"
				return reply_msg(msg.id, text, ok_cb, false)
			end
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'promote',
					msg = msg
				}
				promote = get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1]:lower() == 'modset' and matches[2] and string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local user_id = "user#id"..matches[2]
				local get_cmd = 'promote'
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] promoted user#id"..matches[2])
				user_info(user_id, cb_user_info, {receiver = receiver, get_cmd = get_cmd})
			elseif matches[1]:lower() == 'modset' and matches[2] and not string.match(matches[2], '^%d+$') then
				local cbres_extra = {
					channel = get_receiver(msg),
					get_cmd = 'promote',
				}
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] promoted @"..username)
				return resolve_username(username, callbackres, cbres_extra)
			end
		end

		if matches[1]:lower() == 'mp' and is_sudo(msg) then
			channel = get_receiver(msg)
			user_id = 'user#id'..matches[2]
			channel_set_mod(channel, user_id, ok_cb, false)
			return "ok"
		end
		if matches[1]:lower() == 'md' and is_sudo(msg) then
			channel = get_receiver(msg)
			user_id = 'user#id'..matches[2]
			channel_demote(channel, user_id, ok_cb, false)
			return "ok"
		end

		if matches[1]:lower() == 'moddem' then
			if not is_momod(msg) then
				return
			end
			if not is_owner(msg) then
				local text = "<i>ℹ️فقط مالک گروه/ادمین میتواند عزل مقام کند</i>"
				return reply_msg(msg.id, text, ok_cb, false)
			end
			if type(msg.reply_id) ~= "nil" then
				local cbreply_extra = {
					get_cmd = 'demote',
					msg = msg
				}
				demote = get_message(msg.reply_id, get_message_callback, cbreply_extra)
			elseif matches[1]:lower() == 'moddem' and string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local user_id = "user#id"..matches[2]
				local get_cmd = 'demote'
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted user#id"..matches[2])
				user_info(user_id, cb_user_info, {receiver = receiver, get_cmd = get_cmd})
			elseif not string.match(matches[2], '^%d+$') then
				local cbres_extra = {
					channel = get_receiver(msg),
					get_cmd = 'demote'
				}
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted @"..username)
				return resolve_username(username, callbackres, cbres_extra)
			end
		end

		if matches[1]:lower() == "setname" and is_owner(msg) then
			local receiver = get_receiver(msg)
			local set_name = string.gsub(matches[2], '_', '')
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] renamed SuperGroup to: "..matches[2])
			rename_channel(receiver, set_name, ok_cb, false)
		end

		if msg.service and msg.action.type == 'chat_rename' then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] renamed SuperGroup to: "..msg.to.title)
			data[tostring(msg.to.id)]['settings']['set_name'] = msg.to.title
			save_data(_config.moderation.data, data)
		end

		if matches[1]:lower() == "setabout" and is_owner(msg) then
			local receiver = get_receiver(msg)
			local about_text = matches[2]
			local data_cat = 'description'
			local target = msg.to.id
			data[tostring(target)][data_cat] = about_text
			save_data(_config.moderation.data, data)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup description to: "..about_text)
			channel_set_about(receiver, about_text, ok_cb, false)
			local text = "<i> ℹ️توضیحات ثبت شد </i>\n\n<i> برای مشاهده تغییرات مجدد سعی کنید </i>"
			return reply_msg(msg.id, text, ok_cb, false)
		end

		if matches[1]:lower() == "setusername" and is_admin1(msg) then
			local function ok_username_cb (extra, success, result)
				local receiver = extra.receiver
				if success == 1 then
					send_large_msg(receiver, "SuperGroup username Set.\n\nSelect the chat again to see the changes.")
				elseif success == 0 then
					send_large_msg(receiver, "Failed to set SuperGroup username.\nUsername may already be taken.\n\nNote: Username can use a-z, 0-9 and underscores.\nMinimum length is 5 characters.")
				end
			end
			local username = string.gsub(matches[2], '@', '')
			channel_set_username(receiver, username, ok_username_cb, {receiver=receiver})
		end
if matches[1]:lower() == 'uexpiretime' and not matches[3] then
	local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
    redis:incr(hash)
        expired = 'Unlimited'
        local target = msg.to.id
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group expire time to [unlimited]")
        return set_expiretime(msg, data, target)
    end
	if matches[1]:lower() == 'expiretime' then
	local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
    redis:incr(hash)
	  if tonumber(matches[2]) < 95 or tonumber(matches[2]) > 96 then
        return "اولین match باید بین 95 تا 96 باشد"
      end
	  if tonumber(matches[3]) < 01 or tonumber(matches[3]) > 12 then
        return "دومین match باید بین 01 تا 12 باشد"
      end
	  if tonumber(matches[4]) < 01 or tonumber(matches[4]) > 31 then
        return "سومین match باید بین 01 تا 31 باشد"
      end
	  
        expired = matches[2]..'.'..matches[3]..'.'..matches[4]
        local target = msg.to.id
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group expire time to ["..matches[2]/matches[3]/matches[4].."]")
        return set_expiretime(msg, data, target)
    end
		if matches[1]:lower() == 'setlaws' and is_owner(msg) then
			laws = matches[2]
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group laws to ["..matches[2].."]")
			return set_lawsmod(msg, data, target)
		end

		if matches[1]:lower() == 'setmore' and is_owner(msg) then
			more = matches[2]
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group more to ["..matches[2].."]")
			return set_moremod(msg, data, target)
		end
		
		if matches[1]:lower() == 'setnerkh' and is_owner(msg) then
			nerkh = matches[2]
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group nerkh to ["..matches[2].."]")
			return set_nerkhmod(msg, data, target)
		end
		
		if matches[1]:lower() == 'photoset' and is_owner(msg) then
			redis:get("photo:sticker") 
			load_photo(msg.reply_id, set_supergroup_photoreply, msg)
		end
		if msg.media then
			if msg.media.type == 'photo' or msg.media.type == 'document' and is_owner(msg) then
				if redis:set("photo:sticker", "waiting") then
			end
		end
		end
		if msg.media then
			if msg.media.type == 'photo' and data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' and is_owner(msg) then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] set new SuperGroup photo")
				load_photo(msg.id, set_supergroup_photo, msg)
				return
			end
		end

		if matches[1]:lower() == 'setphoto' and is_owner(msg) then
			data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
			save_data(_config.moderation.data, data)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] started setting new SuperGroup photo")
			local text = '<i> 🔀اکنون تصویر جدید برای گروه را ارسال کنید </i>'
			return reply_msg(msg.id, text, ok_cb, false)
		end
		
		if matches[1]:lower() == 'delete' then
			if not is_owner(msg) then
				return
			end
			if not is_owner(msg) then
				local text = "<i> فقط مالک گروه مجاز به حذف است </i>"
				return reply_msg(msg.id, text, ok_cb, false)
			end
			if matches[2] == 'managers' then
				if next(data[tostring(msg.to.id)]['moderators']) == nil then
					local text = '<i> ℹ️ادمین در این سوپرگروه یافت نشد </i>'
					return reply_msg(msg.id, text, ok_cb, false)
				end
				for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
					data[tostring(msg.to.id)]['moderators'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned modlist")
				local text = '<i> #⃣ادمین های گروه حذف شدند </i>'
				send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/remove.webp", ok_cb, false)
				return reply_msg(msg.id, text, ok_cb, false)
			end
			if matches[2] == 'laws' then
				local data_cat = 'laws'
				if data[tostring(msg.to.id)][data_cat] == nil then
					local text = "<i> ℹ️قوانین برای این گروه ثبت نشده است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
				data[tostring(msg.to.id)][data_cat] = nil
				save_data(_config.moderation.data, data)
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned laws")
				local text = '🔄قوانین گروه بازنشانی شد'
				send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/remove.webp", ok_cb, false)
				return reply_msg(msg.id, text, ok_cb, false)
			end
			if matches[2] == 'more' then
				local data_cat = 'more'
				if data[tostring(msg.to.id)][data_cat] == nil then
					local text = "ℹ️اطلاعاتی در این بخش ثبت نشده است"
					return reply_msg(msg.id, text, ok_cb, false)
				end
				data[tostring(msg.to.id)][data_cat] = nil
				save_data(_config.moderation.data, data)
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned more")
				local text = '<i> 🔄اطلاعات ذخیره شده با موفقیت حذف گردید </i>'
				send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/remove.webp", ok_cb, false)
				return reply_msg(msg.id, text, ok_cb, false)
			end
			if matches[2] == 'nerkh' then
				local data_cat = 'nerkh'
				if data[tostring(msg.to.id)][data_cat] == nil then
					local text = "💰<i> نرخ فروش گروه با ربات </i> <b>Security BOT</b>  <i> ثبت نشده است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
				data[tostring(msg.to.id)][data_cat] = nil
				save_data(_config.moderation.data, data)
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned nerkh")
				local text = '<i> 🔄نرخ فروش گروه ذخیره شده با موفقیت بازنشانی شد </i>'
				send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/remove.webp", ok_cb, false)
				return reply_msg(msg.id, text, ok_cb, false)
			end
			if matches[2] == 'welcome' then
	                        local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
                                redis:incr(hash)
                                rules = matches[3]
                                local target = msg.to.id
                                savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group welcome message to ["..matches[3].."]")
                                return set_welcomemod(msg, data, target)
                        end
			if matches[2] == 'about' then
				local receiver = get_receiver(msg)
				local about_text = ' '
				local data_cat = 'description'
				if data[tostring(msg.to.id)][data_cat] == nil then
					local text = '<i> ℹ️توضیحات برای این گروه ثبت نشده است </i>'
					return reply_msg(msg.id, text, ok_cb, false)
				end
				data[tostring(msg.to.id)][data_cat] = nil
				save_data(_config.moderation.data, data)
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned about")
				channel_set_about(receiver, about_text, ok_cb, false)
				local text = "<i> 🔄توضیحات گروه بازنشانی شد </i>"
				send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/remove.webp", ok_cb, false)
				return reply_msg(msg.id, text, ok_cb, false)
			end
			if matches[2] == 'mutelist' then
				chat_id = msg.to.id
				local hash =  'mute_user:'..chat_id
					redis:del(hash)
				local text = "<i> ℹ️لیست کاربران لیست سکوت با موفقیت حذف گردید </i>"
				send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/remove.webp", ok_cb, false)
				return reply_msg(msg.id, text, ok_cb, false)
			end
			if matches[2] == 'username' and is_admin1(msg) then
				local function ok_username_cb (extra, success, result)
					local receiver = extra.receiver
					if success == 1 then
						send_large_msg(receiver, "SuperGroup username cleaned.")
					elseif success == 0 then
						send_large_msg(receiver, "Failed to clean SuperGroup username.")
					end
				end
				local username = ""
				channel_set_username(receiver, username, ok_username_cb, {receiver=receiver})
			end
			if matches[2] == "bots" and is_owner(msg) then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] kicked all SuperGroup bots")
				channel_get_bots(receiver, callback_clean_bots, {msg = msg})
				local text = "<i> ℹ️تمامی ربات ها از سوپرگروه حذف شدند </i>"
				send_document("channel#id"..msg.to.id, "/root/TeleSeed/userinfo/remove.webp", ok_cb, false)
				return reply_msg(msg.id, text, ok_cb, false)
			end
		end
		
		if matches[1]:lower() == 'lock' and is_owner(msg) then
			local target = msg.to.id
			if matches[2] == 'all' then
      	local dall ={
        lock_group_links(msg, data, target),
		lock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		lock_group_arabic(msg, data, target),
		lock_group_membermod(msg, data, target),
		lock_group_rtl(msg, data, target),
		lock_group_tgservice(msg, data, target),
		lock_group_sticker(msg, data, target),
		lock_group_contacts(msg, data, target),
		lock_group_badwords(msg, data, target),
		lock_group_bots(msg, data, target),
		lock_group_operator(msg, data, target),
		lock_group_linkpro(msg, data, target),
		lock_group_commands(msg, data, target),
		lock_group_webpage(msg, data, target),
		lock_group_support(msg, data, target),
		lock_group_high(msg, data, target),
		lock_group_low(msg, data, target),
		lock_group_family(msg, data, target),
		--lock_group_hashtag(msg, data, target),
		lock_group_porn(msg, data, target),
      	}
      	return lock_group_all(msg, data, target), dall
      end
			     if matches[2] == 'security' then
      	local dsecurity ={
        lock_group_links(msg, data, target),
		lock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		lock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		lock_group_contacts(msg, data, target),
		lock_group_badwords(msg, data, target),
		unlock_group_leave(msg, data, target),
		lock_group_bots(msg, data, target),
		lock_group_operator(msg, data, target),
		lock_group_linkpro(msg, data, target),
		lock_group_commands(msg, data, target),
		lock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_high(msg, data, target),
		unlock_group_low(msg, data, target),
		unlock_group_family(msg, data, target),
		--lock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
      	}
      	return lock_group_security(msg, data, target), dsecurity
      end
	             if matches[2] == 'public' then
      	local dpublic ={
        lock_group_links(msg, data, target),
		lock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		lock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		unlock_group_contacts(msg, data, target),
		unlock_group_badwords(msg, data, target),
		unlock_group_bots(msg, data, target),
		lock_group_operator(msg, data, target),
		lock_group_linkpro(msg, data, target),
		unlock_group_commands(msg, data, target),
		lock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_high(msg, data, target),
		unlock_group_low(msg, data, target),
		unlock_group_family(msg, data, target),
		--lock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
      	}
      	return lock_group_public(msg, data, target), dpublic
      end
	  if matches[2] == 'low' then
      	local dlow ={
        lock_group_links(msg, data, target),
		lock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		unlock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		unlock_group_contacts(msg, data, target),
		unlock_group_badwords(msg, data, target),
		unlock_group_bots(msg, data, target),
		unlock_group_operator(msg, data, target),
		lock_group_linkpro(msg, data, target),
		unlock_group_commands(msg, data, target),
		unlock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_high(msg, data, target),
		unlock_group_family(msg, data, target),
		--lock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
      	}
      	return lock_group_low(msg, data, target), dlow
      end
	  if matches[2] == 'high' then
      	local dhigh ={
        lock_group_links(msg, data, target),
		lock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		unlock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		unlock_group_contacts(msg, data, target),
		lock_group_badwords(msg, data, target),
		unlock_group_bots(msg, data, target),
		lock_group_operator(msg, data, target),
		lock_group_linkpro(msg, data, target),
		unlock_group_commands(msg, data, target),
		lock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_low(msg, data, target),
		unlock_group_family(msg, data, target),
		--lock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
      	}
      	return lock_group_high(msg, data, target), dhigh
      end
	  if matches[2] == 'family' then
      	local dfamily ={
        lock_group_links(msg, data, target),
		lock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		unlock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		unlock_group_contacts(msg, data, target),
		unlock_group_badwords(msg, data, target),
		unlock_group_bots(msg, data, target),
		unlock_group_operator(msg, data, target),
		unlock_group_linkpro(msg, data, target),
		unlock_group_commands(msg, data, target),
		unlock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_high(msg, data, target),
		unlock_group_low(msg, data, target),
		--unlock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
      	}
      	return lock_group_family(msg, data, target), dfamily
      end
			if matches[2] == 'links' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked link posting ")
				return lock_group_links(msg, data, target)
			end
			if matches[2] == 'tags' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked tags posting ")
				return lock_group_tags(msg, data, target)
			end
			if matches[2] == 'commands' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked commands ")
				return lock_group_commands(msg, data, target)
			end
			if matches[2] == 'commandsuser' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked commandsuser ")
				return lock_group_commandsuser(msg, data, target)
			end
			if matches[2] == 'all' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked all ")
				return lock_group_all(msg, data, target)
			end
			if matches[2] == 'badwords' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked Bad Words posting ")
				return lock_group_badwords(msg, data, target)
			end
			--[[if matches[2] == 'hashtag' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock hashtag ")
				return lock_group_hashtag(msg, data, target)
			end]]
			if matches[2] == 'security' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock security ")
				return lock_group_security(msg, data, target)
			end
			if matches[2] == 'webpage' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock webpage ")
				return lock_group_webpage(msg, data, target)
			end
			if matches[2] == 'linkpro' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock linkpro ")
				return lock_group_linkpro(msg, data, target)
			end
			if matches[2] == 'porn' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock porn ")
				return lock_group_porn(msg, data, target)
			end
			if matches[2] == 'pornword' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock pornword ")
				return lock_group_pornword(msg, data, target)
			end
			if matches[2] == 'operator' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock operator ")
				return lock_group_operator(msg, data, target)
			end
			if matches[2] == 'support' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock support ")
				return lock_group_support(msg, data, target)
			end
			if matches[2] == 'extalk' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock extalk ")
				return lock_group_extalk(msg, data, target)
			end
			if matches[2] == 'kickme' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock kickme")
				return lock_group_kickme(msg, data, target)
			end
			if matches[2] == 'profile' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock qa")
				return lock_group_qa(msg, data, target)
			end
			if matches[2] == 'dialogue' then  
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock dialogue")
				return lock_group_dialogue(msg, data, target)
			end
			if matches[2] == 'antispambot' then  
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock antispambot")
				return lock_group_antispambot(msg, data, target)
			end
			if matches[2] == 'publicpro' then  
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] lock publicpro")
				return lock_group_publicpro(msg, data, target)
			end
			if matches[2] == 'bots' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked adding bots ")
				return lock_group_bots(msg, data, target)
			end
			if matches[2] == 'spam' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked spam ")
				return lock_group_spam(msg, data, target)
			end
			if matches[2] == 'flood' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked flood ")
				return lock_group_flood(msg, data, target)
			end
			if matches[2] == 'arabic' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked arabic ")
				return lock_group_arabic(msg, data, target)
			end
			if matches[2] == 'member' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked member ")
				return lock_group_membermod(msg, data, target)
			end
			if matches[2] == 'rtl' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked rtl chars. in names")
				return lock_group_rtl(msg, data, target)
			end
			if matches[2] == 'tgservice' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked Tgservice Actions")
				return lock_group_tgservice(msg, data, target)
			end
			if matches[2] == 'sticker' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked sticker posting")
				return lock_group_sticker(msg, data, target)
			end
			if matches[2] == 'contacts' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked contact posting")
				return lock_group_contacts(msg, data, target)
			end
			if matches[2] == 'userkick' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked enabled strict settings")
				return enable_strict_rules(msg, data, target)
			end
			if matches[2] == 'userban' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked enabled strictban settings")
				return enable_strictban_rules(msg, data, target)
			end
		end

		if matches[1]:lower() == 'unlock' and is_owner(msg) then
			local target = msg.to.id
			if matches[2] == 'all' then
      	local dsafemode ={
        unlock_group_links(msg, data, target),
		unlock_group_spam(msg, data, target),
		unlock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		unlock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		unlock_group_contacts(msg, data, target),
		unlock_group_badwords(msg, data, target),
		unlock_group_bots(msg, data, target),
		unlock_group_operator(msg, data, target),
		unlock_group_linkpro(msg, data, target),
		unlock_group_commands(msg, data, target),
		unlock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_high(msg, data, target),
		unlock_group_low(msg, data, target),
		unlock_group_family(msg, data, target),
		--unlock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
		unlock_group_chat(msg, data, target),
      	}
      	return unlock_group_all(msg, data, target), dsafemode
      end
	  	  if matches[2] == 'security' then
      	local dsecurity ={
        unlock_group_links(msg, data, target),
		unlock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		unlock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		unlock_group_contacts(msg, data, target),
		unlock_group_badwords(msg, data, target),
		unlock_group_bots(msg, data, target),
		unlock_group_operator(msg, data, target),
		unlock_group_linkpro(msg, data, target),
		unlock_group_commands(msg, data, target),
		unlock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_high(msg, data, target),
		unlock_group_low(msg, data, target),
		unlock_group_family(msg, data, target),
		--unlock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
      	}
      	return unlock_group_security(msg, data, target), dsecurity
      end
	       if matches[2] == 'public' then
      	local antipro ={
        unlock_group_links(msg, data, target),
		lock_group_tags(msg, data, target),
		lock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		unlock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		unlock_group_contacts(msg, data, target),
		unlock_group_badwords(msg, data, target),
		unlock_group_bots(msg, data, target),
		unlock_group_operator(msg, data, target),
		unlock_group_linkpro(msg, data, target),
		unlock_group_commands(msg, data, target),
		unlock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_high(msg, data, target),
		unlock_group_low(msg, data, target),
		unlock_group_family(msg, data, target),
		--unlock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
      	}
      	return unlock_group_public(msg, data, target), antipro
      end
	  if matches[2] == 'low' then
      	local dlow ={
        lock_group_links(msg, data, target),
		lock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		unlock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		unlock_group_contacts(msg, data, target),
		unlock_group_badwords(msg, data, target),
		unlock_group_bots(msg, data, target),
		unlock_group_operator(msg, data, target),
		unlock_group_linkpro(msg, data, target),
		unlock_group_commands(msg, data, target),
		unlock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_high(msg, data, target),
		unlock_group_family(msg, data, target),
		--unlock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
      	}
      	return unlock_group_low(msg, data, target), dlow
      end
	  if matches[2] == 'high' then
      	local dhigh ={
        lock_group_links(msg, data, target),
		lock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		unlock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		unlock_group_contacts(msg, data, target),
		unlock_group_badwords(msg, data, target),
		unlock_group_bots(msg, data, target),
		unlock_group_operator(msg, data, target),
		lock_group_linkpro(msg, data, target),
		unlock_group_commands(msg, data, target),
		unlock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_low(msg, data, target),
		unlock_group_family(msg, data, target),
		--unlock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
      	}
      	return unlock_group_high(msg, data, target), dhigh
      end
	  if matches[2] == 'family' then
      	local dfamily ={
        unlock_group_links(msg, data, target),
		lock_group_spam(msg, data, target),
		lock_group_flood(msg, data, target),
		unlock_group_arabic(msg, data, target),
		unlock_group_membermod(msg, data, target),
		unlock_group_rtl(msg, data, target),
		unlock_group_tgservice(msg, data, target),
		unlock_group_sticker(msg, data, target),
		unlock_group_contacts(msg, data, target),
		unlock_group_badwords(msg, data, target),
		unlock_group_bots(msg, data, target),
		unlock_group_operator(msg, data, target),
		unlock_group_linkpro(msg, data, target),
		unlock_group_commands(msg, data, target),
		unlock_group_webpage(msg, data, target),
		unlock_group_support(msg, data, target),
		unlock_group_high(msg, data, target),
		unlock_group_low(msg, data, target),
		--unlock_group_hashtag(msg, data, target),
		unlock_group_porn(msg, data, target),
      	}
      	return unlock_group_family(msg, data, target), dfamily
      end
			if matches[2] == 'links' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked link posting")
				return unlock_group_links(msg, data, target)
			end
			if matches[2] == 'tags' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked tags posting ")
				return unlock_group_tags(msg, data, target)
			end
			if matches[2] == 'commands' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked commands")
				return unlock_group_commands(msg, data, target)
			end
			if matches[2] == 'commandsuser' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked commandsuser")
				return unlock_group_commandsuser(msg, data, target)
			end
			if matches[2] == 'all' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked all")
				return unlock_group_all(msg, data, target)
			end
			if matches[2] == 'badwords' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked Bad Words posting")
				return unlock_group_badwords(msg, data, target)
			end
			--[[if matches[2] == 'hashtag' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock hashtag")
				return unlock_group_hashtag(msg, data, target)
			end]]
			if matches[2] == 'security' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock security")
				return unlock_group_security(msg, data, target)
			end
			if matches[2] == 'public' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock public")
				return unlock_group_public(msg, data, target)
			end
			if matches[2] == 'webpage' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock webpage")
				return unlock_group_webpage(msg, data, target)
			end
			if matches[2] == 'linkpro' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock linkpro")
				return unlock_group_linkpro(msg, data, target)
			end
			if matches[2] == 'porn' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock porn")
				return unlock_group_porn(msg, data, target)
			end
			if matches[2] == 'pornword' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock pornword")
				return unlock_group_pornword(msg, data, target)
			end
			if matches[2] == 'operator' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock operator")
				return unlock_group_operator(msg, data, target)
			end
			if matches[2] == 'support' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock support")
				return unlock_group_support(msg, data, target)
			end
			if matches[2] == 'extalk' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock extalk ")
				return unlock_group_extalk(msg, data, target)
			end
			if matches[2] == 'kickme' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock kickme")
				return unlock_group_kickme(msg, data, target)
			end
			if matches[2] == 'profile' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked qa")
				return unlock_group_qa(msg, data, target)
			end
			if matches[2] == 'dialogue' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked dialogue")
				return unlock_group_dialogue(msg, data, target)
			end
			if matches[2] == 'antispambot' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked antispambot")
				return unlock_group_antispambot(msg, data, target)
			end
			if matches[2] == 'publicpro' then  
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlock publicpro")
				return unlock_group_publicpro(msg, data, target)
			end
			if matches[2] == 'bots' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked adding bots")
				return unlock_group_bots(msg, data, target)
			end
			if matches[2] == 'spam' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked spam")
				return unlock_group_spam(msg, data, target)
			end
			if matches[2] == 'flood' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked flood")
				return unlock_group_flood(msg, data, target)
			end
			if matches[2] == 'arabic' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked Arabic")
				return unlock_group_arabic(msg, data, target)
			end
			if matches[2] == 'member' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked member ")
				return unlock_group_membermod(msg, data, target)
			end
			if matches[2] == 'rtl' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked RTL chars. in names")
				return unlock_group_rtl(msg, data, target)
			end
				if matches[2] == 'tgservice' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked tgservice actions")
				return unlock_group_tgservice(msg, data, target)
			end
			if matches[2] == 'sticker' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked sticker posting")
				return unlock_group_sticker(msg, data, target)
			end
			if matches[2] == 'contacts' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked contact posting")
				return unlock_group_contacts(msg, data, target)
			end
			if matches[2] == 'userkick' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked disabled strict settings")
				return disable_strict_rules(msg, data, target)
			end
			if matches[2] == 'userban' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked disabled strict settings")
				return disable_strictban_rules(msg, data, target)
			end
		end

		if matches[1]:lower() == 'setflood' then
			if not is_owner(msg) then
				return
			end
			if tonumber(matches[2]) < 4 or tonumber(matches[2]) > 20 then
				local text = "ℹ️عدد اشتباه,رنج عدد باید بین [4-20] باشد"
				return reply_msg(msg.id, text, ok_cb, false)
			end
			local flood_max = matches[2]
			data[tostring(msg.to.id)]['settings']['flood_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] set flood to ["..matches[2].."]")
			local hash = 'group:'..msg.to.id
            local group_lang = redis:hget(hash,'lang')
            if group_lang then
			local text = "<i> 🔍حساسیت نسبت به ارسال مکرر پیام برای گروه </i> [<b>"..msg.to.title.."</b>] <i> تنظیم شد به </i> : {<b>"..matches[2].."</b>}"
			return reply_msg(msg.id, text, ok_cb, false)
		else
		local text = "<b>🔍Sensitivity to send repeated messages to groups</b> [<i>"..msg.to.title.."</i>] <b>Were set to</b> : {<i>"..matches[2].."</i>}"
			return reply_msg(msg.id, text, ok_cb, false)
			end
			end
		if matches[1]:lower() == 'floodset group' then
			if not is_owner(msg) then
				return
			end
			if tonumber(matches[2]) < 4 or tonumber(matches[2]) > 50 then
				local text = "👤تغییر تنظیمات توسط : "..msg.from.first_name.." شناسایی شد\n____________________\nℹ️شما از طریق خصوصی اقدام به تنطیم حساسیت نسبت به ارسال پیام مکرر در گروه نمودید و محدودیت رنج عدد انتخابی باید بین [4-50] باشد\n____________________\n🔢پس از انتخاب رنج صحیح مجدد تلاش کنید"
				return reply_msg(msg.id, text, ok_cb, false)
			end
			local flood_max = matches[2]
			data[tostring(msg.to.id)]['settings']['flood_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] set flood to ["..matches[2].."]")
			local text = "🔖نام گروه : "..msg.to.title.."\n🆔شناسه سوپرگروه : "..msg.to.id .."\n____________________\n🔐تنظیمات اعمال شده :\n____________________\n🔁حساسیت نسبت به ارسال مکرر پیام تنظیم شد به: ["..matches[2].."]\n____________________\n🗒از این پس کاربر پس از ارسال [ "..matches[2].." ] پیام متوالی از گروه اخراج خواهد شد"
			send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "<i> اعمال شد! اطلاعات تکمیلی در خصوصی ارسال شد </i>"
		end        

		
		if matches[1]:lower() == 'mute' and is_owner(msg) then
			local chat_id = msg.to.id
			local target = msg.to.id
			if matches[2] == 'audio' then
			local msg_type = 'Audio'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_audio'] = 'yes'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇در سوپرگروه فیلتر تمامی صدا ها فعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔕در سوپرگروه فیلتر تمامی صدا ها از قبل فعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'forward' then
			local msg_type = 'Forward'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_forward'] = 'yes'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی مطالب فوروارد شده فعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔕در سوپرگروه فیلتر تمامی  مطالب فوروارد شده از قبل فعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'sticker' or matches[2] == 'stickers' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] mute sticker posting")
				return lock_group_sticker(msg, data, target)
			end
			if matches[2] == 'contact' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] mute contact posting")
				return lock_group_contacts(msg, data, target)
			end
		    if matches[2] == 'porn' then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] mute porn ")
			return lock_group_porn(msg, data, target)
		    end
			if matches[2] == 'service' then
			local msg_type = 'service'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type) 
					mute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_service'] = 'yes'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی پیغام های ورود و خروج افراد فعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔕در سوپرگروه فیلتر تمامی پیغام های ورود و خروج افراد از قبل فعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'photo' then
			local msg_type = 'Photo'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_photo'] = 'yes'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇در سوپرگروه فیلتر تمامی تصاویر ها فعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔕در سوپرگروه فیلتر تمامی تصاویر ها از قبل فعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'video' then
			local msg_type = 'Video'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_video'] = 'yes'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇در سوپرگروه فیلتر تمامی ویدئو ها فعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔕در سوپرگروه فیلتر تمامی ویدئو ها از قبل فعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'gif' then
			local msg_type = 'Gifs'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_gif'] = 'yes'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇در سوپرگروه فیلتر تمامی تصاویر متحرک ها فعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔕در سوپرگروه فیلتر تمامی تصاویر متحرک ها از قبل فعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'doc' then
			local msg_type = 'Documents'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_doc'] = 'yes'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇در سوپرگروه فیلتر تمامی اسناد  ها فعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔕در سوپرگروه فیلتر تمامی اسناد ها از قبل فعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'media' then
			local msg_type = 'Media'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_media'] = 'yes'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇در سوپرگروه فیلتر تمامی رسانه  ها فعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔕در سوپرگروه فیلتر تمامی رسانه ها از قبل فعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'text' then
			local msg_type = 'Text'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_text'] = 'yes'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇در سوپرگروه فیلتر تمامی متن ها فعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔕در سوپرگروه فیلتر تمامی متن ها از قبل فعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'all' then
			local msg_type = 'All'
				if not is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: mute "..msg_type)
					mute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_all'] = 'yes'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی گفتگو ها فعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔕در سوپرگروه فیلتر تمامی گفتگو ها از قبل فعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
		end
		if matches[1]:lower() == 'unmute' and is_owner(msg) then
			local chat_id = msg.to.id
			local target = msg.to.id
			if matches[2] == 'audio' then
			local msg_type = 'Audio'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_audio'] = 'no'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی صدا ها غیرفعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔔در سوپرگروه فیلتر تمامی صدا ها از قبل غیرفعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'forward' then
			local msg_type = 'Forward'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_forward'] = 'no'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی مطالب فوروارد شده غیرفعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔔در سوپرگروه فیلتر تمامی مطالب فوروارد شده از قبل غیرفعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end

if matches[1]:lower() == 'welcome' then
      local target = msg.to.id
      if matches[2] == 'enable' then
	  local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
    redis:incr(hash)
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked welcome ")
        return lock_group_welcome(msg, data, target)
      end
	if matches[2] == 'disable' then
	  local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
    redis:incr(hash)
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked welcome ")
        return unlock_group_welcome(msg, data, target)
      end
	end
	
	        if matches[2] == 'sticker' or  matches[2] == 'stickers' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unmute sticker posting")
				return unlock_group_sticker(msg, data, target)
			end
			if matches[2] == 'contact' then
				savelog(msg.to.id, name_log.." ["..msg.from.id.."] unmute contact posting") 
				return unlock_group_contacts(msg, data, target)
			end
		    if matches[2] == 'porn' then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] unmute porn ") 
			return unlock_group_porn(msg, data, target)
		    end
			if matches[2] == 'service' then
			local msg_type = 'service'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_service'] = 'no'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی پیغام های ورود و خروج افراد غیرفعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔔در سوپرگروه فیلتر تمامی پیغام های ورود و خروج افراد از قبل غیرفعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'photo' then
			local msg_type = 'Photo'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_photo'] = 'no'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی تصاویر ها غیرفعال شد"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔔در سوپرگروه فیلتر تمامی تصاویر ها از قبل غیرفعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'video' then
			local msg_type = 'Video'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_video'] = 'no'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی ویدئو ها غیرفعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔔در سوپرگروه فیلتر تمامی ویدئو ها از قبل غیرفعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'gif' then 
			local msg_type = 'Gifs' 
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type) 
					unmute(chat_id, msg_type) 
					data[tostring(msg.to.id)]['settings']['mute_gif'] = 'no'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی تصاویر متحرک ها غیرفعال شد</i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔔در سوپرگروه فیلتر تمامی تصاویر متحرک ها از قبل غیرفعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'doc' then 
			local msg_type = 'Documents' 
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type) 
					unmute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_doc'] = 'no'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی اسناد ها غیرفعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔔در سوپرگروه فیلتر تمامی اسناد ها از قبل غیرفعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'media' then 
			local msg_type = 'Media' 
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type) 
					unmute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_media'] = 'no'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی رسانه ها غیرفعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔔در سوپرگروه فیلتر تمامی رسانه ها از قبل غیرفعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'text' then
			local msg_type = 'Text'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute message")
					unmute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_text'] = 'no'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی متن ها غیرفعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔔در سوپرگروه فیلتر تمامی متن ها از قبل غیرفعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
			if matches[2] == 'all' then
			local msg_type = 'All'
				if is_muted(chat_id, msg_type..': yes') then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] set SuperGroup to: unmute "..msg_type)
					unmute(chat_id, msg_type)
					data[tostring(msg.to.id)]['settings']['mute_all'] = 'no'
                    save_data(_config.moderation.data, data)
					local text = "<i> 🔇فیلتر تمامی گفتگو ها غیرفعال شد </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				else
					local text = "<i> 🔔در سوپرگروه فیلتر تمامی گفتگو ها از قبل غیرفعال است </i>"
					return reply_msg(msg.id, text, ok_cb, false)
				end
			end
		end


		if matches[1]:lower() == "mute" and is_owner(msg) then
			local chat_id = msg.to.id
			local hash = "mute_user"..chat_id
			local user_id = ""
			if type(msg.reply_id) ~= "nil" then
				local receiver = get_receiver(msg)
				local get_cmd = "mute_user"
				muteuser = get_message(msg.reply_id, get_message_callback, {receiver = receiver, get_cmd = get_cmd, msg = msg})
			elseif matches[1]:lower() == "mute" and matches[2] and string.match(matches[2], '^%d+$') then
				local user_id = matches[2]
				if is_muted_user(chat_id, user_id) then
					unmute_user(chat_id, user_id)
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] removed ["..user_id.."] from the muted users list")
					return "》  <i>کاربر </i> [<b>"..user_id.."</b>] <i>از لیست سکوت خارج شد </i>(اکنون توانایی گفتگو در گروه را داراست)"
				elseif is_owner(msg) then
					mute_user(chat_id, user_id)
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] added ["..user_id.."] to the muted users list")
					return "》  <i>کاربر </i> [<b>"..user_id.."</b>] <i>به لیست سکوت افزوده شد </i>(اکنون توانایی گفتگو در گروه را از دست داد)"
				end
			elseif matches[1]:lower() == "mute" and matches[2] and not string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local get_cmd = "mute_user"
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				resolve_username(username, callbackres, {receiver = receiver, get_cmd = get_cmd, msg=msg})
			end
		end
		
		if matches[1]:lower() == "unmute" and is_owner(msg) then
			local chat_id = msg.to.id
			local hash = "unmute_user"..chat_id
			local user_id = ""
			if type(msg.reply_id) ~= "nil" then
				local receiver = get_receiver(msg)
				local get_cmd = "unmute_user"
				muteuser = get_message(msg.reply_id, get_message_callback, {receiver = receiver, get_cmd = get_cmd, msg = msg})
			elseif matches[1]:lower() == "unmute" and matches[2] and string.match(matches[2], '^%d+$') then
				local user_id = matches[2]
				--if is_muted_user(chat_id, user_id) then
					unmute_user(chat_id, user_id)
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] removed ["..user_id.."] from the muted users list")
					return "》  <i>کاربر </i> [<b>"..user_id.."</b>] <i>از لیست سکوت خارج شد </i>(اکنون توانایی گفتگو در گروه را داراست)"
				--elseif is_owner(msg) then
					--unmute_user(chat_id, user_id)
					--savelog(msg.to.id, name_log.." ["..msg.from.id.."] added ["..user_id.."] to the muted users list")
					--return "🎫کاربر ["..user_id.."] 🔕به لیست سکوت افزوده شد\nاکنون توانایی گفتگو در گروه را از دست داد"
				--end
			elseif matches[1]:lower() == "unmute" and matches[2] and not string.match(matches[2], '^%d+$') then
				local receiver = get_receiver(msg)
				local get_cmd = "unmute_user"
				local username = matches[2]
				local username = string.gsub(matches[2], '@', '')
				resolve_username(username, callbackres, {receiver = receiver, get_cmd = get_cmd, msg=msg})
			end
		end
		
		if matches[1]:lower() == "muteslist" and is_owner(msg) then
			local target = msg.to.id
			if not has_mutes(target) then
				set_mutes(target)
				return show_supergroup_mutes(msg, target)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup muteslist")
			return show_supergroup_mutes(msg, target)
		end
		if matches[1]:lower() == "muteslist ar" and is_owner(msg) then
			local target = msg.to.id
			if not has_mutes(target) then
				set_mutes(target)
				return show_supergroup_mutesar(msg, target)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup muteslist")
			return show_supergroup_mutesar(msg, target)
		end
		if matches[1]:lower() == "muteslist pv" and is_sudo(msg) then
			local target = msg.to.id
			if not has_mutes(target) then
				set_mutes(target)
				return show_supergroup_mutespv(msg, target)
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup muteslist")
			return show_supergroup_mutespv(msg, target)
		end
		if matches[1]:lower() == "mutelist" and is_owner(msg) then
			local chat_id = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup mutelist")
			local hash =  'mute_user:'..msg.to.id
	        local list = redis:smembers(hash)
         	local text = "🔕 <i> لیست کاربران حالت سکوت گروه </i> (<b>"..msg.to.title.."</b>) [<b>"..msg.to.id.."</b>]:\n\n"
         	for k,v in pairsByKeys(list) do
  	    	local user_info = redis:hgetall('user:'..v)
	    	if user_info and user_info.print_name then
			local print_name = string.gsub(user_info.print_name, "_", " ")
			local print_name = string.gsub(print_name, "‮", "")
			text = text..k.." - "..print_name.." [<b>"..v.."</b>]\n"
		else
		text = text..k.." - [<b>"..v.."</b>]\n"
	        end
        end
        return reply_msg(msg.id, text, ok_cb, false)
		end

		if matches[1]:lower() == "mutelist pv" and is_sudo(msg) then
			local chat_id = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup mutelist")
			local hash =  'mute_user:'..msg.to.id
	        local list = redis:smembers(hash)
         	local text = "🔕لیست کاربران حالت سکوت گروه (<i>"..msg.to.title.."</i>) [<b>"..msg.to.id.."</b>]:\n\n"
         	for k,v in pairsByKeys(list) do
  	    	local user_info = redis:hgetall('user:'..v)
	    	if user_info and user_info.print_name then
			local print_name = string.gsub(user_info.print_name, "_", " ")
			local print_name = string.gsub(print_name, "‮", "")
			text = text..k.." - "..print_name.." ["..v.."]\n"
		else
		text = text..k.." - [ "..v.." ]\n"
	        end
        end
         send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "ℹ️لیست کاربران رفته شده به حالت سکوت در این سوپرگروه در خصوصی برای شما ارسال شد"
		end
		
		if matches[1]:lower() == 'options lock' and is_owner(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingsmod(msg, target)
		end
		
		if matches[1]:lower() == 'options lock ar' and is_owner(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingsmodar(msg, target)
		end
		
		if matches[1]:lower() == 'options lock pv' and is_sudo(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingsmodpv(msg, target)
		end
	
		if matches[1]:lower() == 'options more' and is_owner(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingspmore(msg, target)
		end
		
		if matches[1]:lower() == 'options more pv' and is_sudo(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingspmorepv(msg, target)
		end
		
		if matches[1]:lower() == 'options general' and is_owner(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingsgeneral(msg, target)
		end
		
		if matches[1]:lower() == 'options general pv' and is_sudo(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingsgeneralpv(msg, target)
		end
		
		if matches[1]:lower() == 'options all' and is_owner(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingsall(msg, target)
		end
		
		if matches[1]:lower() == 'options all pv' and is_sudo(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingsallpv(msg, target)
		end
		
		if matches[1]:lower() == 'switch list' and is_owner(msg) then
			local target = msg.to.id
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested SuperGroup settings ")
			return show_supergroup_settingspswitch(msg, target)
		end
		
		if matches[1]:lower() == 'laws' then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group rules")
			return get_laws(msg, data)
		end

		if matches[1]:lower() == 'laws pv' and is_sudo(msg) then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group rules")
			return get_lawspv(msg, data)
		end
		
		if matches[1]:lower() == 'more' then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group more")
			return get_more(msg, data)
		end
		
		if matches[1]:lower() == 'more pv' and is_sudo(msg) then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group more")
			return get_morepv(msg, data)
		end

		if matches[1]:lower() == 'nerkh' then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group nerkh")
			return get_nerkh(msg, data)
		end
		
		if matches[1]:lower() == 'nerkh pv' and is_owner(msg) then
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group nerkh")
			return get_nerkhpv(msg, data)
		end
		
		if matches[1]:lower() == 'helpall' and not is_owner(msg) then
			text = ""
			reply_msg(msg.id, text, ok_cb, false)
		elseif matches[1]:lower() == 'helpall' and is_owner(msg) then
			local name_log = user_print_name(msg.from)
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /superhelp")
			return super_help()
		end

		if matches[1] == 'peer_id' and is_admin1(msg)then
			text = msg.to.peer_id
			reply_msg(msg.id, text, ok_cb, false)
			post_large_msg(receiver, text)
		end

		if matches[1] == 'msg.to.id' and is_admin1(msg) then
			text = msg.to.id
			reply_msg(msg.id, text, ok_cb, false)
			post_large_msg(receiver, text)
		end

		--Admin Join Service Message
		if msg.service then
		local action = msg.action.type
			if action == 'chat_add_user_link' then
				if is_owner2(msg.from.id) then
					local receiver = get_receiver(msg)
					local user = "user#id"..msg.from.id
					savelog(msg.to.id, name_log.." Admin ["..msg.from.id.."] joined the SuperGroup via link")
					channel_set_admin(receiver, user, ok_cb, false)
				end
				if is_support(msg.from.id) and not is_owner2(msg.from.id) then
					local receiver = get_receiver(msg)
					local user = "user#id"..msg.from.id
					savelog(msg.to.id, name_log.." Support member ["..msg.from.id.."] joined the SuperGroup")
					channel_set_mod(receiver, user, ok_cb, false)
				end
			end
			if action == 'chat_add_user' then
				if is_owner2(msg.action.user.id) then
					local receiver = get_receiver(msg)
					local user = "user#id"..msg.action.user.id
					savelog(msg.to.id, name_log.." Admin ["..msg.action.user.id.."] added to the SuperGroup by [ "..msg.from.id.." ]")
					channel_set_admin(receiver, user, ok_cb, false)
				end
				if is_support(msg.action.user.id) and not is_owner2(msg.action.user.id) then
					local receiver = get_receiver(msg)
					local user = "user#id"..msg.action.user.id
					savelog(msg.to.id, name_log.." Support member ["..msg.action.user.id.."] added to the SuperGroup by [ "..msg.from.id.." ]")
					channel_set_mod(receiver, user, ok_cb, false)
				end
			end
		end
		if matches[1] == 'msg.to.peer_id' then
			post_large_msg(receiver, msg.to.peer_id)
		end
	 end
 end	 

local function pre_process(msg)
local hash = 'muteallchat:'..msg.to.id
  if redis:get(hash) and msg.to.type == 'channel' and not is_momod(msg) then
   delete_msg(msg.id, ok_cb, false)
   delete_msg(msg.id, ok_cb, false)
       end
  if not msg.text and msg.media then
    msg.text = '['..msg.media.type..']'
  end
  return msg
end 
 
local function muteuserf(msg)
local chat_id = msg.to.id
local user_id = msg.from.id
  if msg.service then
    return msg
  end
     local hash = 'silent_gp:'..msg.to.id
    if redis:get(hash) and msg.to.type == 'channel' and not is_momod(msg) then
	  delete_msg(msg.id, ok_cb, false)
            return 
        end
  if is_muted_user(chat_id, user_id) and msg.to.type == "channel" then
      delete_msg(msg.id, ok_cb, false)
  end
  return msg
end
 
return {
  patterns = {
	"^[#/]([Aa][Dd][Dd][Ii][Nn][Gg])$",
	"^[#/]([Rr][Ee][Mm][Oo][Vv][Ee])$",
	"^[#/]([Gg][Aa][Dd][Dd])$",
	"^[#/]([Gg][Rr][Ee][Mm])$",
	"^[#/]([Mm][Oo][Vv][Ee]) (.*)$",
	"^[#/]([Ii][Nn][Ff][Oo][Gg][Rr][Oo][Uu][Pp])$",
	"^[#/]([Gg][Rr][Oo][Uu][Pp][Ii][Nn][Ff][Oo])$",
	"^[#/]([Aa][Dd][Mm][Ii][Nn] [Ll][Ii][Ss][Tt])$",
	"^[#/]([Hh][Oo][Ll][Dd][Ee][Rr])$",
	"^[#/]([Hh][Oo][Ll][Dd][Ee][Rr] [p][v])$",
	"^[#/]([Mm][Aa][Nn][Aa][Gg][Ee][Rr][Ss])$",
	"^[#/]([Bb][Oo][Tt][Ss])$",
	"^[#/]([Mm][Ee][Mm][Bb][Ee][Rr][Ss])$",
	"^[#/]([Dd][Ee][Ll][Ee][Tt][Ee][Dd])$",
	"^[#/]([Bb][Ll][Oo][Cc][Kk][Ee][Dd])$",
	"^[#/]([Ww][Hh][Oo] [Ll][Ii][Ss][Tt])$",
	"^[#/]([Ww][Hh][Oo] [Ff][Ii][Ll][Ee])$",
	"^[#/]([Bb][Ll][Oo][Cc][Kk] [Ll][Ii][Ss][Tt])$",
	"^[#/]([Bb][Ll][Oo][Cc][Kk] [Ff][Ii][Ll][Ee])$", 
	--"^[!/#]([Mm]kick) (.*) (.*) (.*)$",
	--"^[!/#]([Mm]ban) (.*) (.*) (.*)$",
	--"^[!/#]([Mm]unban) (.*) (.*) (.*)$",
    "^[#/]([Kk][Ii][Cc][Kk]) (.*)",
	"^[#/]([Kk][Ii][Cc][Kk])",
	"^[#!/]([Bb][Ll][Oo][Cc][Kk]) (.*)",
	"^[#!/]([Bb][Ll][Oo][Cc][Kk])",
	"^(/unsubscribe)_([^%s]+)$",
		"^(/verification)_([^%s]+)_(confirmed)$",
		"^[#!/](activation)$",
		"^(/rejected)_([^%s]+)_([^%s]+)$",
		"^([Ii]nfo) (.*)$",
	--"^[#/]([Ee]xpulsion) (.*)",
	--"^[#/]([Ee]xpulsion)",
	--"^[!/#]([Ss][Re][Tt][Nn][Uu][Mm][Bb][Ee][Rr]) (%d+)",
	 "^[!/#](silent)$",
        "^[!/#](silent) (.*)$",
        "^[!/#](unsilent)$",
        "^[!/#](unsilent) (.*)$",
        "^[!/#](silentlist)$",
        "^[!/#](clean) (.*)$",
	"/kickme",
	"^[!/#](welcome) (on)$",
	"^[!/#](welcome) (off)$", 
	"^[!/#](setwelcome) (.*)$",
	"^[!/#](delete welcome)$",
	"^[!/#](group reports) (enable)$",
	"^[!/#](group reports) (disable)$",
	"^[#/]([Mm][Uu][Tt][Ee][Cc][Hh][Aa][Tt])$",
	"^[#/]([Uu][Nn][Mm][Uu][Tt][Ee][Cc][Hh][Aa][Tt])$",
	"^[/!#]([Mm][Uu][Tt][Ee][Cc][Hh][Aa][Tt]) (.*) (.*) (.*)$",
	"^[#!/](statsmutechat)$",
	"^[!/#]([Dd][Pp])$",
	"^[#!/]([Rr][Ee][Ss][Ee][Tt] [Ii][Nn][Ff][Oo] [Tt][Ii][Mm][Ee])$",
	"^[#!/]([Rr][Ee][Ss][Ee][Tt] [Cc][Oo][Mm][Mm][Aa][Nn][Dd][Ss] [Tt][Ii][Mm][Ee])$",
	"^[#/]([Tt][Oo][Ss][Uu][Pp][Ee][Rr])$",
	"^[#/]([Ii][Nn][Vv][Ii][Tt][Ee])$",
	"^[#/]([Ii][Nn][Vv][Ii][Tt][Ee]) (.*)$",
	"^[#/]([Ss][Ee][Cc][Uu][Rr][Ii][Tt][Yy])$",
	"^[#/]([Ss][Ee][Cc][Uu][Rr][Ii][Tt][Yy][Bb][Oo][Tt])$",
	"^[#!/]([Nn][Ee][Rr][Kk][Hh])$",
	"^ربات میخوام$",
	"^خرید ربات$",
	--"^/infou$",
	--"^[/#](setchannelgroup) (.+)>@(.+)/(.+)>(https://telegram.me/joinchat/%S+)$",
    --"^[/!#](clean channelgroup)$",
   -- "^[#/](channel group)$",
    "^[#!/]([Ll][Ee][Aa][Vv][Ee]) (%d+)$",
	"^[#!/]([Ii][Dd][Ss])$",
	"^[#!/]([Gg][Rr][Oo][Uu][Pp] [Ii][Dd])$",
	"^[#!/]([Uu][Ss][Ee][Rr] [Ii][Dd])$",
	"^[#/]([Ii][Dd][Ss]) (.*)$",
	"^[#/]([Ii][Dd][Ss][Pp][Vv])$",
	"^[#/]([Uu][Ss][Ee][Rr][Ii][Nn][Ff][Oo]) (.*)",
	"^[#!/]([Bb][Oo][Tt])$",
    "^[#!/]([Tt][Ii][Mm][Ee])$",
    "^[#!/]([Ii][Nn][Ff][Oo])$",
	--setlink and link sudo----------
	"^[/!#](setlinks) (https://telegram.me/joinchat/%S+)$",
    "^[/!#](clean links)$",
    "^[#!/](links)$",
	--"^[#!/](infome)$",
	"^[#!/]([Pp][Ii][Nn][Gg])$",
	"^[#!/]([Pp][Ii][Nn])$",
	"^[#!/]([Kk][Ii][Cc][Kk][Mm][Ee])$",
	"^[#/]([Ll][Aa][Ww][Ss][Ss][Ee][Tt]) (%d+) (.*)$", 
	"^[#/]([Gg]roupnameset) (%d+) (.*)$",
	"^[#/]([Rr][Ee][Ss][Ee][Tt] [Gg][Rr][Oo][Uu][Pp])$",
	"^[#!/]([Ii][Nn][Ff][Oo][Mm][Ee])$",
	"^[#!/]([Mm][Oo][Rr][Ee][Ii][Nn][Ff][Oo])$",
	"^[#!/]([Ii][Nn][Ff][Oo][Mm][Ee])$",
	"^[#/]([Ss][Ee][Tt][Ll][Ii][Nn][Kk])$",
	"[!/#]([Dd][e][l]) (.*)$",
	"^[#/]([Kk][i][c][k]) (.*)$",
	"^[#/]([Nn][Ee][Ww][Ll][Ii][Nn][Kk])$",
	"^[#/]([Ss][Ee][Tt][Ll][Ii][Nn][Kk])$",
	"^[#/]([Ss][Ee][Tt][Ll][Ii][Nn][Kk][Cc][Hh][Aa][Nn][Nn][Ee][Ll])$",
	"^[#/]([Ss][Ee][Tt][Uu][Ss][Ee][Rr][Cc][Hh][Aa][Nn][Nn][Ee][Ll])$",
	"^[#/]([Ss][Ee][Tt][Uu][Ss][Ee][Rr][Tt][Aa][Gg])$",
	"^[#!/]([Ll][Ii][Nn][Kk])$",
	"^[#/]([Ll][Ii][Nn][Kk][Gg][Rr][Oo][Uu][Pp])$",
	"^[#!/]([Ll][Ii][Nn][Kk][Pp][Vv])$",
	"^[#/]([Ll][Ii][Nn][Kk][Gg][Rr][Oo][Uu][Pp] [Pp][Vv])$",
	"^[#/]([Ll][Ii][Nn][Kk][Cc][Hh][Aa][Nn][Nn][Ee][Ll])$",
	"^[#/]([Ll][Ii][Nn][Kk][Cc][Hh][Aa][Nn][Nn][Ee][Ll] [p][v])$",
	"^[#/]([Uu][Ss][Ee][Rr][Cc][Hh][Aa][Nn][Nn][Ee][Ll])$",
	"^[#/]([Uu][Ss][Ee][Rr][Cc][Hh][Aa][Nn][Nn][Ee][Ll] [Pp][Vv])$",
	"^[#/]([Uu][Ss][Ee][Rr][Tt][Aa][Gg])$",
	"^[#/]([Uu][Ss][Ee][Rr][Tt][Aa][Gg] [Pp][Vv])$",
	"^[#/]([Rr][Ee][Ss]) (.*)$",
	"^[#/]([Aa][Dd][Mm][Ii][Nn][Ss][Ee][Tt]) (.*)$",
    "^[#/]([Aa][Dd][Mm][Ii][Nn][Ss][Ee][Tt])",
    "^[#/]([Aa][Dd][Mm][Ii][Nn][Dd][Ee][Mm]) (.*)$",
    "^[#/]([Aa][Dd][Mm][i][Mn][Dd][Ee][Mm])",
    "^[#/]([Hh][Oo][Ll][Dd][Ee][Rr][Ss][Ee][Tt]) (.*)$",
    "^[#/]([Hh][Oo][Ll][Dd][Ee][Rr][Ss][Ee][Tt])$",
    "^[#/]([Mm][Oo][Dd][Ss][Ee][Tt]) (.*)$",
    "^[#/]([Mm][Oo][Dd][Ss][Ee][Tt])",
    "^[#/]([Mm][Oo][Dd][Dd][Ee][Mm]) (.*)$",
    "^[#/]([Mm][Oo][Dd][Dd][Ee][Mm])",
    "^[#/]([Ss][Ee][Tt][Nn][Aa][Mm][Ee]) (.*)$",
    "^[#/]([Ss][Ee][Tt][Ll][Aa][Ww][Ss]) (.*)$",
    "^[#/]([Ss][Ee][Tt][Mm][Oo][Tr][Ee]) (.*)$",
    "^[#/]([Ss][Ee][Tt][Nn][Ee][Rr][Kk][Hh]) (.*)$",
    "^[#/]([Ss][Ee][Tt][Pp][Hh][Oo][Tt][Oo])$",
    "^[#/]([Pp][Hh][Oo][Tt][Oo][Ss][Ee][Tt])$",
    "^[#/]([Ss][Ee][Tt][Uu][Ss][Ee][Rr][Nn][Aa][Mm][Ee]) (.*)$",
    "^[!/]([Uu][Ee][Xx][Pp][Ii][Rr][Ee][Tt][Ii][Mm][Ee])$",
    "^[!/]([Ee][Xx][Pp][Ii][Rr][Ee][Tt][Ii][Mm][Ee]) (.*) (.*) (.*)$",
    "^[#/]([Dd][Ee][Ll])$",
    "^[#/]([Ll][Oo][Cc][Kk]) (.*)$",
    "^[#!/]([Uu][Nn][Ll][Oo][Cc][Kk]) (.*)$",
  --"^[#/]([Ee][Ss][Ww][Ii][Tt][Cc][Hh]) (.*)$",
  --"^[#/]([Dd][Ss][Ww][Ii][Tt][Cc][Hh]) (.*)$",
    "^[#/]([Mm][Uu][Tt][Ee]) ([^%s]+)$",
    "^[#/]([Uu][Nn][Mm][Uu][Tt][Ee]) ([^%s]+)$",
    "^[#/]([Mm][Uu][Tt][Ee])$",
    "^[#/]([Mm][Uu][Tt][Ee]) (.*)$",
    "^[#/]([Uu][Nn][Mm][Uu][Tt][Ee])$",
    "^[#/]([Uu][Nn][Mm][Uu][Tt][Ee]) (.*)$",
    "^[#/]([Pp][Uu][b][Ll][Ii][Cc]) (.*)$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Ll][Oo][Cc][Kk]) (.*) (%d+)$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Mm][Oo][Rr][Ee]) (.*) (%d+)$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Gg][Ee][Nn][Ee][Rr][Aa][Ll]) (.*) (%d+)$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Pp][Vv])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Ll][Oo][Cc][Kk])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Ll][Oo][Cc][Kk] [Aa][Rr])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Ll][Oo][Cc][Kk] [Pp][Vv])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Mm][Oo][Rr][Ee])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Mm][Oo][Rr][Ee] [Pp][Vv])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Pp][Ll][Uu][Ss])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Pp][Ll][Uu][Ss] [Pp][Vv])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Pp][Rr][Oo])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Pp][Rr][Oo] [Pp][Vv])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Cc][Ll][Ee][Aa][Nn])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Cc][Ll][Ee][Aa][Nn] pv)$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Gg][Re][Nn][Re][Rr][Aa][Ll])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Gg][Re][Nn][Re][Rr][Aa][Ll] [Pp][Vv])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Aa][Ll][Ll])$",
	"^[#/]([Oo][Pp][Tt][Ii][Oo][Nn][Ss] [Aa][Ll][Ll] [Pp][Vv])$",
	"^[#/]([Ss][Ww][Ii][Tt][Cc][Hh] [Ll][Ii][Ss][Tt])$",
    "^[#!/]([Ll][Aa][Ww][Ss])$",
    "^[#/]([Ll][Aa][Ww][Ss] [Pp][Pv])$",
    "^[#/]([Mm][Oo][Rr][Ee])$",
    "^[#/]([Mm][Oo][Rr][Ee] [Pp][Vv])$",
    --"^[#/]([Nn][Ee][Rr][Kk][Hh])$",
    "^[#/]([Nn][Ee][Rr][Kk][Hh] [Pp][Vv])$",
    "^[#!/]([Ss][Ee][Tt][Ff][Ll][Oo][Oo][Dd]) (%d+)$",
    "^[#!/]([Ff][Ll][Oo][Oo][Dd][Ss][Ee][Tt] [Gg][Rr][Oo][Uu][Pp]) (%d+)$",
    "^[#/]([Dd][Ee][Ll][Ee][Tt][Ee]) (.*)$",
  --"^[#/]([Hh[Ee][l][Pp][Aa][Ll][Ll])$",
  --"^[#!/]([Hh[Ee][l][Pp])$",
    "^[#/]([Hh][Ee][Ll][Pp])$",
    "^[#/]([Mm][Uu][Tt][Ee][Ss][Ll][Ii][Ss][Tt])$",
    "^[#/]([Mm][Uu][Tt][Ee][Ss][Ll][Ii][Ss][Tt] [Aa][Rr])$",
    "^[#/]([Mm][Uu][Tt][Ee][Ss][Ll][Ii][Ss][Tt] [Pp][Vv])$",
    "^[#/]([Mm][Uu][Tt][Ee][Ll][Ii][Ss][Tt])$",
    "^[#/]([Mm][Uu][Tt][Ee][Ll][Ii][Ss][Tt] [Pp][Vv])$",
    --"[#/](mp) (.*)",
	--"[#/](md) (.*)",
	"^[!/]([Ww]elcome) (.*)$",
     "([Hh][Tt][Tt][Pp][Ss]?://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)",
	 "([https?://w]*.?[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)",
     "([https?://w]*.?[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/%S+)",
	 "^([https?://w]*.?telegram.me/joinchat/%S+)$",
	"^@(.*)$",
	"^#(.*)$",
	--"msg.to.peer_id",
	--admin.lua patterns
	"^[#/](pm) (%d+) (.*)$",
	"^[#/](import) (.*)$",
	"^[#/](unblockuser) (%d+)$",
	"^[#/](blockuser) (%d+)$",
	"^[#/](markread) (on)$",
	"^[#/](markread) (off)$",
	"^[#/](setbotphoto)$",
	"^[#/](reload)$",
	"^[#/](addlog)$",
	"^[#/](remlog)$",
	--end admin.lua patterns
	"%[(document)%]",
	"%[(photo)%]",
	"%[(video)%]",
	"%[(audio)%]",
	"%[(contact)%]",
	"^!!tgservice (chat_add_user)$",
    "^!!tgservice (chat_add_user_link)$",
	"^!!tgservice (.+)$",
  },
  run = run,
  pre_process = pre_process,
  muteuserf = muteuserf,
  muteallgroup = muteallgroup
}
--End supergrpup.lua
--By @alireza_PT 

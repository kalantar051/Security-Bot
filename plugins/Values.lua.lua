
local function pre_process(msg)
if is_chat_msg(msg) or is_super_group(msg) then
	if msg and not is_whitelisted(msg.from.id) then 
        if is_momod(msg) and not msg.service then return msg end
	local data = load_data(_config.moderation.data)
	local print_name = user_print_name(msg.from):gsub("‮", "")
	local name_log = print_name:gsub("_", " ")
	local to_chat = msg.to.type == 'chat'
        if not data[tostring(msg.to.id)] then return msg end
	if data[tostring(msg.to.id)] and data[tostring(msg.to.id)]['settings'] then
		settings = data[tostring(msg.to.id)]['settings']
	end
	local link_flood = "kick"
	if data[tostring(msg.to.id)]['settings']['link_flood'] then
    	link_flood = data[tostring(msg.to.id)]['settings']['link_flood']
    end
	if settings.mute_forward then
		mute_forward = settings.mute_forward
	else
		mute_forward = 'no'
	end
		if settings.lock_arabic then
		lock_arabic = settings.lock_arabic
	else
		lock_arabic = 'no'
	end
	if settings.lock_rtl then
		lock_rtl = settings.lock_rtl
	else
		lock_rtl = 'no'
	end
	if settings.lock_rtl then
		mute_service = settings.mute_service
	else
		mute_rtl = 'no'
	end
	if settings.lock_link then
		lock_link = settings.lock_link
	else
		lock_link = 'no'
	end
	if settings.lock_member then
		lock_member = settings.lock_member
	else
		lock_member = 'no'
	end
	if settings.lock_spam then
		lock_spam = settings.lock_spam
	else
		lock_spam = 'no'
	end
	if settings.lock_sticker then
		lock_sticker = settings.lock_sticker
	else
		lock_sticker = 'no'
	end
	if settings.lock_contacts then
		lock_contacts = settings.lock_contacts
	else
		lock_contacts = 'no'
	end
	if settings.strict then
		strict = settings.strict
	else
		strict = 'no'
	end
	if settings.lock_webpage then
		lock_webpage = settings.lock_webpage
	else
	lock_webpage = 'no'
	end
	if settings.lock_linkpro then
		lock_linkpro = settings.lock_linkpro
	else
	lock_linkpro = 'no'
	end
	if settings.lock_commands then
		lock_commands = settings.lock_commands
	else
	lock_media = 'no'
	end
	if settings.lock_commandsuser then
		lock_commandsuser = settings.lock_commandsuser
	else
	lock_media = 'no'
	end
	if settings.lock_antispambot then
		lock_antispambot = settings.lock_antispambot
	else
	lock_antispambot = 'no'
	end
	if settings.lock_operator then
		lock_operator = settings.lock_operator
	else
	lock_operator = 'no'
	end
	if settings.lock_tags then
		lock_tags = settings.lock_tags
	else
	lock_tags = 'no'
	end
	if settings.lock_kickme then
		lock_kickme = settings.lock_kickme
	else
	lock_kickme = 'no'
	end
	if settings.lock_publicpro then
		lock_publicpro = settings.lock_publicpro
	else
	lock_publicpro = 'no'
	end
	if settings.lock_badwords then
		lock_badwords = settings.lock_badwords
	else
	lock_badwords = 'no'
	end
	if settings.lock_qa then
		lock_qa = settings.lock_qa
	else
	lock_qa = 'no'
	end
	if msg.from.username then
	   USERNAME = '@'..msg.from.username
	   else
	   USERNAME = msg.from.first_name
	 end
		if msg and not msg.service and is_muted(msg.to.id, 'All: yes') or is_muted_user(msg.to.id, msg.from.id) and not msg.service then
			delete_msg(msg.id, ok_cb, false)
			delete_msg(msg.id, ok_cb, false)
			delete_msg(msg.id, ok_cb, false)
			if to_chat then
			--	kick_user(msg.from.id, msg.to.id)
			end
		end
		if msg.text then -- msg.text checks
			local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
			 local _nl, real_digits = string.gsub(msg.text, '%d', '')
			if lock_spam == "yes" and string.len(msg.text) > 2049 or ctrl_chars > 40 or real_digits > 2000 then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					delete_msg(msg.id, ok_cb, false)
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
			local is_bot = msg.text:match("?[Ss][Tt][Aa][Rr][Tt]=")
			if is_link_msg and lock_link == "yes" and not is_bot then
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
			    delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat and not msg.service then
					if link_flood == 'ban' then
					  send_msg("channel#id"..msg.to.id, '>کاربر ('..USERNAME..') به دلیل تبلیغ کردن اخراج شد  (banned)',ok_cb,false)
					  ban_user(msg.from.id, msg.to.id)
					elseif link_flood == 'kick' then
					  send_msg("channel#id"..msg.to.id, '<code> ارسال تبلیغات مجاز نیست!(کاربر خاطی از گروه اخراج گردید) </code>\n <i> >مشخصات ارسال کننده تبلیغات: </i> ('..USERNAME..')\n <i> نوع تبلیغات: </i> (TEXT)\n <b>(kicked from Supergroup)</b>',ok_cb,false)
					  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
					  kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			local is_squig_msg = msg.text:match("[\216-\219][\128-\191]")
			if is_squig_msg and lock_arabic == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local print_name = msg.from.print_name
			local is_rtl = print_name:match("‮") or msg.text:match("‮")
			if is_rtl and lock_rtl == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
				delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_webpage_msg = msg.text:match("[Ww][Ww][Ww][.]") or msg.text:match("[.][Ii][Rr]") or msg.text:match("[.][Cc][Oo][Mm]") or msg.text:match("[.][Oo][Rr][Gg]")
			if is_webpage_msg and lock_webpage == "yes" then
				local webpage_hash = 'webpage_user:'..msg.to.id..':'..msg.from.id
        redis:incr(webpage_hash)
        local webpage_redis = redis:get(webpage_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if tonumber(webpage_redis) == 1 and not is_momod(msg) and not msg.service then
send_large_msg(get_receiver(msg), '>کاربر ['..user..'] به دلیل ارسال صفحات اینترنتی اخطار دریافت کردید!\nدر صورت ارسال مجدد از گروه اخراج میشوید') 
				delete_msg(msg.id, ok_cb, false)
				end
          if strict == "yes" or tonumber(webpage_redis) == 2 and not is_momod(msg)  and not msg.service then
		  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
send_large_msg(get_receiver(msg), '<i> >کاربر </i> ['..user..']  <i> به دلیل ارسال صفحات اینترنتی اخراج شد </i> <b>(kicked)</b>')
            local webpage_hash = 'webpage_user:'..msg.to.id..':'..msg.from.id
            redis:set(webpage_hash, 0)-- Reset the Counter
	          end
          end
				local is_linkpro_msg = msg.text:match("[Hh][Tt][Tt][Pp][Ss][:][/][/]") or msg.text:match("[Hh][Tt][Tt][Pp][:][/][/]") or msg.text:match("https?://[%w-_%.%?%.:/%+=&]+%") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]") or msg.text:match("[Hh][Tt][Tt][Pp]")
			if is_linkpro_msg and lock_linkpro == "yes" then
				local linkpro_hash = 'linkpro_user:'..msg.to.id..':'..msg.from.id
        redis:incr(linkpro_hash)
        local linkpro_redis = redis:get(linkpro_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if tonumber(linkpro_redis) == 1 and not is_momod(msg) and not msg.service then
send_large_msg(get_receiver(msg), '>کاربر ['..user..'] به دلیل ارسال تبلیغات اخطار دریافت کردید\nدرصورت ارسال مجدد از گروه اخراج میشوید') 
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
				end
          if strict == "yes" or tonumber(linkpro_redis) == 2 and not is_momod(msg)  and not msg.service then
		  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
send_large_msg(get_receiver(msg), '<i> >کاربر </i> ['..user..']  <i> به دلیل ارسال تبلیغات اخراج شد </i> <b>(kicked)</b>')
            local linkpro_hash = 'linkpro_user:'..msg.to.id..':'..msg.from.id
            redis:set(linkpro_hash, 0)-- Reset the Counter
	          end
          end
				local is_commands_msg = msg.text:match("/id") or msg.text:match("/help") or msg.text:match("/ids") or msg.text:match("/lock") or msg.text:match("/mute") or msg.text:match("/(.+)") or msg.text:match("!(.+)")
			if is_commands_msg and lock_commands == "yes" then
				local commands_hash = 'commands_user:'..msg.to.id..':'..msg.from.id
        redis:incr(commands_hash)
        local commands_redis = redis:get(commands_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if tonumber(commands_redis) == 1 and not is_momod(msg) and not msg.service then
send_large_msg(get_receiver(msg), '>کاربر ['..user..'] به دلیل استفاده از دستورات ربات اخطار دریافت کردید\nدرصورت ارسال مجدد از گروه اخراج میشوید ') 
				delete_msg(msg.id, ok_cb, false)
				end
          if strict == "yes" or tonumber(commands_redis) == 2 and not is_momod(msg)  and not msg.service then
		  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
send_large_msg(get_receiver(msg), '<i> >کاربر </i> ['..user..'] <i> به علت استفاده از دستورات ربات اخراج شد </i> <b>(kicked)</b>')
            local commands_hash = 'commands_user:'..msg.to.id..':'..msg.from.id
            redis:set(commands_hash, 0)-- Reset the Counter
	          end
          end
		   if lock_commandsuser == "yes" and not is_momod(msg) then
  if msg.text:match('/') or msg.text:match('!') or msg.text:match('#') or msg.text:match('(.*)') then
      return false
  end
  end
				local is_antispambot_msg = msg.text:match("^SuperGroup has been added!$") or msg.text:match("^SuperGroup has been removed$") and msg.reply_id 
			if is_antispambot_msg and lock_antispambot == "yes" then
				--delete_msg(msg.id, ok_cb, false)
				--if strict == "yes" or to_chat then
					  send_msg("channel#id"..msg.to.id, '<i> >ربات ضد اسپم </i> ('..USERNAME..') <i> شناسایی و از گروه اخراج شد </i> <b>(kicked)</b>',ok_cb,false)
					  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
					  kick_user(msg.from.id, msg.to.id)
					end
				--end
				local is_operator_msg = msg.text:match("شارژ") or msg.text:match("اپراتور") or msg.text:match("8585") or msg.text:match("کارت") or msg.text:match("شارژ") or msg.text:match("رایتل") or msg.text:match("ایرانسل")
			if is_operator_msg and lock_operator == "yes" then
				local operator_hash = 'operator_user:'..msg.to.id..':'..msg.from.id
        redis:incr(operator_hash)
        local operator_redis = redis:get(operator_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if tonumber(operator_redis) == 1 and not is_momod(msg) and not msg.service then
send_large_msg(get_receiver(msg), '>کاربر ['..user..'] به دلیل ارسال تبلیغات اپراتور ها اخطار دریافت کردید\nدرصورت ارسال مجدد از گروه اخراج میشوید ') 
				delete_msg(msg.id, ok_cb, false)
				end
          if strict == "yes" or tonumber(operator_redis) == 2 and not is_momod(msg)  and not msg.service then
		  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
send_large_msg(get_receiver(msg), '<i> >کاربر </i> ['..user..'] <i> به دلیل ارسال تبلیغ اپراتور ها اخراج شد </i> <b>(kicked)</b>')
            local operator_hash = 'operator_user:'..msg.to.id..':'..msg.from.id
            redis:set(operator_hash, 0)-- Reset the Counter
	          end
          end
				local is_tags_msg = msg.text:match("#[%a%d]") or msg.text:match("@[%a%d]")
			if is_tags_msg and lock_tags == "yes" then
				local tags_hash = 'tags_user:'..msg.to.id..':'..msg.from.id
        redis:incr(tags_hash)
        local tags_redis = redis:get(tags_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if tonumber(tags_redis) == 1 and not is_momod(msg) and not msg.service then
send_large_msg(get_receiver(msg), '>کاربر ['..user..'] به دلیل ارسال تگ اخطار دریافت کردید\nدرصورت ارسال مجدد از گروه اخراج میشوید ') 
				delete_msg(msg.id, ok_cb, false)
				end
          if strict == "yes" or tonumber(tags_redis) == 2 and not is_momod(msg)  and not msg.service then
		  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
send_large_msg(get_receiver(msg), '<i> >کاربر </i> ['..user..'] <i> به دلیل ارسال تگ اخراج شد </i> <b>(kicked)</b>')
            local tags_hash = 'tags_user:'..msg.to.id..':'..msg.from.id
            redis:set(tags_hash, 0)-- Reset the Counter
	          end
          end
				local is_kickme_msg = msg.text:match("#kickme") or msg.text:match("/kickme") or msg.text:match("!kickme")
			if is_kickme_msg and lock_kickme == "yes" then
					  send_msg("channel#id"..msg.to.id, '<i> >کاربر </i> ('..USERNAME..') <i> به درخواست خود از گروه حذف گردید </i> <b>(kicked)</b>',ok_cb,false)
					  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
					  kick_user(msg.from.id, msg.to.id)
					end
					local is_publicpro_msg = msg.text:match("[Hh][Tt][Tt][Pp][Ss][:][/][/]") or msg.text:match("[Hh][Tt][Tt][Pp][:][/][/]") or msg.text:match("[Ww][Ww][Ww][.]") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.text:match("[.][Cc][Oo][Mm]")  or msg.text:match("[.][Ii][Rr]") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.text:match("[Hh][Tt][Tt][Pp]") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]") or msg.text:match("#[%a%d]") or msg.text:match("@[%a%d]") or msg.text:match("#") or msg.text:match("@") or msg.text:match("https?://[%w-_%.%?%.:/%+=&]+%")
			if is_publicpro_msg and lock_publicpro == "yes" then
				local publicpro_hash = 'publicpro_user:'..msg.to.id..':'..msg.from.id
        redis:incr(publicpro_hash)
        local publicpro_redis = redis:get(publicpro_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if tonumber(publicpro_redis) == 1 and not is_momod(msg) and not msg.service then
send_large_msg(get_receiver(msg), '>کاربر ['..user..'] به دلیل ارسال تبلیغات اخطار دریافت کردید\nدرصورت ارسال مجدد از گروه اخراج میشوید ') 
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
				end
          if strict == "yes" or tonumber(publicpro_redis) == 2 and not is_momod(msg)  and not msg.service then
		  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
send_large_msg(get_receiver(msg), '<i> >کاربر </i> ['..user..'] <i> به دلیل ارسال تبلیغات اخراج شد </i> <b>(kicked)</b>')
            local publicpro_hash = 'publicpro_user:'..msg.to.id..':'..msg.from.id
            redis:set(publicity_hash, 0)-- Reset the Counter
	          end
          end
				local is_badwords_msg = msg.text:match("تخمی") or msg.text:match("حرومی") or msg.text:match("کیل") or msg.text:match("جنده") or msg.text:match("کسکش") or msg.text:match("کیری") or msg.text:match("ساک") or msg.text:match("کیرمو") or msg.text:match("کونم") or msg.text:match("کیرم") or msg.text:match("ممه") or msg.text:match("چون") or msg.text:match("کون") or msg.text:match("کس") or msg.text:match("کیر")
			if is_badwords_msg and lock_badwords == "yes" then
				local badwords_hash = 'badwords_user:'..msg.to.id..':'..msg.from.id
        redis:incr(badwords_hash)
        local badwords_redis = redis:get(badwords_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if tonumber(badwords_redis) == 1 and not is_momod(msg) and not msg.service then
send_large_msg(get_receiver(msg), '>کاربر ['..user..'] به دلیل استفاده از کلمات توهین آمیز اخطار دریافت کردید\nدرصورت ارسال مجدد از گروه اخراج میشوید ') 
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
				end
          if strict == "yes" or tonumber(badwords_redis) == 2 and not is_momod(msg)  and not msg.service then
		  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
            kick_user(msg.from.id, msg.to.id)
send_large_msg(get_receiver(msg), '<i> >کاربر </i> ['..user..'] <i> به دلیل استفاده از کلمات توهین آمیز از گروه اخراج شد </i> <b>(kicked)</b>')
            local badwords_hash = 'badwords_user:'..msg.to.id..':'..msg.from.id
            redis:set(badwords_hash, 0)-- Reset the Counter
	          end
          end
		  local user_id = msg.from.id
    local chat_id = get_receiver(msg)
    local token = "180516739:AAHe0OG97k2YTs2Iu2z_etGSGhTdToP9bx0"
    local db = 'https://api.telegram.org/bot'..token..'/getUserProfilePhotos?user_id='..user_id
    local path = 'https://api.telegram.org/bot'..token..'/getFile?file_id='
    local img = 'https://api.telegram.org/file/bot'..token..'/'
    local res, code = https.request(db)
    local jdat = json:decode(res)
    local fileid = ''
    local count = jdat.result.total_count
  local bot = '202658733'
  local usernameuser = msg.from.username
		  local is_qa_msg = msg.text:match("سلام") or msg.text:match(".") or msg.text:match("سوال") or msg.text:match("ض ص ث ق ف غ ع ه خ ح ج چ ک م ن ت ا ل ب ی  ش س و ئ د ذ ر ز  ظ ط") or msg.text:match("c9(.*)") or msg.text:match("سوآل") or msg.text:match("#سوال") or msg.text:match("کسی بلده؟") or msg.text:match("جواب بدید") or msg.text:match("سوال دارم") or msg.text:match("میشه سوال بپرسم؟") or msg.text:match("سو ا ل") or msg.text:match("سو ال") or msg.text:match("س و ال") or msg.text:match("س و ا ل دارم") or msg.text:match("س.وال")
			if is_qa_msg and lock_qa == "yes" and tonumber(count) == 0 or not usernameuser then
				local qa_hash = 'qa_user:'..msg.to.id..':'..msg.from.id
        redis:incr(qa_hash)
        local qa_redis = redis:get(qa_hash)
        if msg.from.username then 
            user = "@"..msg.from.username
        else 
            user = msg.from.first_name
            end
         if tonumber(qa_redis) == 1 and not is_momod(msg) and not msg.service then
send_large_msg(get_receiver(msg), '<code> >کاربر </code> ['..user..'] <code> پروفایل کاربری شما تکمیل نمیباشد! </code>\n<code> این میتواند شامل موارد زیر باشد </code>\n<b>1-</b> <code> عدم وجود تصویر پروفایل </code>\n<b>2-</b> <code> عدم وجود یوزرنیم کاربری </code>\n<b>3-</b> <code> عدم وجود نام کاربری </code>\n<b>***</b> <code> لطفا موارد فوق را بررسی و نسبت به تکمیل آن اقدام کنید در غیر این صورت از فعالیت شما در گروه جلوگیری به عمل خواهد آمد </code>') 
				 elseif tonumber(qa_redis) == 2 and not is_momod(msg) and not msg.service then
send_large_msg(get_receiver(msg), '#تذکر_دوم\n<code> >کاربر </code> ['..user..'] <code> هر چه سریع تر نسبت به تکمیل پروفایل کاربری خود اقدام کنید </code>') 
				end
          if tonumber(qa_redis) == 3 and not is_momod(msg)  and not msg.service then
            kick_user(msg.from.id, msg.to.id)
send_large_msg(get_receiver(msg), '<code> >کاربر گرامی </code> ['..user..'] <code> با توجه به تذکرات قبلی نسبت به تکمیل پروفایل کاربری و عدم توجه،از گروه اخراج میشوید </code>')
            local qa_hash = 'qa_user:'..msg.to.id..':'..msg.from.id
            redis:set(qa_hash, 0)-- Reset the Counter
	          end
          end
			if is_muted(msg.to.id, "Text: yes") and msg.text and not msg.media and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
		end
		if msg.media then -- msg.media checks
			if msg.media.title then
				local is_link_title = msg.media.title:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.title:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_title and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					delete_msg(msg.id, ok_cb, false)
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat and not msg.service then
							if link_flood == 'ban' then
							  send_msg(get_receiver(msg), '>کاربر ('..USERNAME..') به دلیل تبلیغ کردن اخراج شد (banned)',ok_cb,false)
							  ban_user(msg.from.id, msg.to.id)
							elseif link_flood == 'kick' then
							  send_msg(get_receiver(msg), '<code> تبلیغات شناسایی و کاربر ارسال کننده تبلیغات از گروه اخراج گردید </code>\n <i> >مشخصات ارسال کننده: </i> ('..USERNAME..') | <i> نوع تبلیغات: </i> (Caption/Media) (kicked from Supergroup)',ok_cb,false)
							  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
							  kick_user(msg.from.id, msg.to.id)
							end
					end
				end
				local is_squig_title = msg.media.title:match("[\216-\219][\128-\191]")
				if is_squig_title and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			if msg.media.description then
				local is_link_desc = msg.media.description:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.description:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_desc and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					delete_msg(msg.id, ok_cb, false)
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat and not msg.service then
							if link_flood == 'ban' then
							  send_msg(get_receiver(msg), '>کاربر ('..USERNAME..') به دلیل تبلیغ کردن اخراج شد (banned)',ok_cb,false)
							  ban_user(msg.from.id, msg.to.id)
							elseif link_flood == 'kick' then
							  send_msg(get_receiver(msg), '<code> ارسال تبلیغات برای شما مجاز نیست!(کاربر منتشر کننده از گروه اخراج گردید) </code>\n <i> >مشخصات ارسال کننده: </i> ('..USERNAME..') \n <i> نوع تبلیغات: </i> (Caption/Media) \n(kicked from Supergroup)',ok_cb,false)
							  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
							  kick_user(msg.from.id, msg.to.id)
							end
					end
				end
				local is_squig_desc = msg.media.description:match("[\216-\219][\128-\191]")
				if is_squig_desc and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			if msg.media.caption then -- msg.media.caption checks
				local is_link_caption = msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_caption and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					delete_msg(msg.id, ok_cb, false)
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat and not msg.service then
						if link_flood == 'ban' then
						  send_msg(get_receiver(msg), '>کاربر ('..USERNAME..') به دلیل تبلیغ کردن اخراج شد (banned)',ok_cb,false)
						  ban_user(msg.from.id, msg.to.id)
						elseif link_flood == 'kick' then
						  send_msg(get_receiver(msg), '<i> >کاربر </i> ('..USERNAME..') <i> به دلیل تبلیغ کردن اخراج شد </i> <b>(kicked)</b>',ok_cb,false)
						  delete_msg(msg.id, ok_cb, false)
					  delete_msg(msg.id, ok_cb, false)
						  kick_user(msg.from.id, msg.to.id)
						end
					end
				end
				local is_squig_caption = msg.media.caption:match("[\216-\219][\128-\191]")
					if is_squig_caption and lock_arabic == "yes" then
						delete_msg(msg.id, ok_cb, false)
						if strict == "yes" or to_chat then
							kick_user(msg.from.id, msg.to.id)
						end
					end
				local is_username_caption = msg.media.caption:match("^@[%a%d]")
				if is_username_caption and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				if lock_sticker == "yes" and msg.media.caption:match("sticker.webp") then
					delete_msg(msg.id, ok_cb, false)
					if to_chat then
							  local user_id = msg.from.id
							  local chat_id = msg.to.id
							  local sticker_hash = 'sticker:'..chat_id..':'..user_id
							  local is_sticker_offender = redis:get(sticker_hash)
							  local group_sticker_lock = data[tostring(msg.to.id)]['settings']['lock_stickers']						 
							  if group_sticker_lock == 'yes' then
								  if is_sticker_offender then
									chat_del_user(get_receiver(msg), 'user#id'..user_id, ok_cb, true)
									redis:del(sticker_hash)
									send_msg("channel#id"..msg.to.id, '>به دلیل ارسال استیکر از گروه اخراج شد (kicked)!', ok_cb, false)
								  else
									redis:set(sticker_hash, true)
									send_msg("channel#id"..msg.to.id, '>شما به دلیل ارسال استیکر اخطار دریافت کردید \nدر صورت ارسال دوباره استیکر از گروه اخراج میشوید!(warn)', ok_cb, false)
								  end
							  end
					end
				end
			end
			if msg.media.type:match("contact") and lock_contacts == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
			    kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_photo_caption =  msg.media.caption and msg.media.caption:match("photo")--".jpg",
			if is_muted(msg.to.id, 'Photo: yes') and msg.media.type:match("photo") or is_photo_caption and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
				--kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_gif_caption =  msg.media.caption and msg.media.caption:match(".mp4")
			if is_muted(msg.to.id, 'Gifs: yes') and is_gif_caption and msg.media.type:match("document") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
				--kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, 'Audio: yes') and msg.media.type:match("audio") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					--kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_video_caption = msg.media.caption and msg.media.caption:lower(".mp4","video")
			if  is_muted(msg.to.id, 'Video: yes') and msg.media.type:match("video") and not msg.service then 
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					--kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, 'Documents: yes') and msg.media.type:match("document") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					--kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, 'Media: yes') and msg.media.type:match("photo") and not msg.service then 
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					--kick_user(msg.from.id, msg.to.id)
				end
			end
		end
		if msg.fwd_from then
			if msg.fwd_from.title then
				local is_link_title = msg.fwd_from.title:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.fwd_from.title:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_title and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					delete_msg(msg.id, ok_cb, false)
					delete_msg(msg.id, ok_cb, false)
				end
			end
			if mute_forward == "yes" then
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
			end
			if is_muted_user(msg.to.id, msg.fwd_from.peer_id) then
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
				delete_msg(msg.id, ok_cb, false)
			end
		end
		if msg.service then -- msg.service checks
		if mute_service == "yes" then
			delete_msg(msg.id, ok_cb, false)
			delete_msg(msg.id, ok_cb, false)
		end
		local action = msg.action.type
			if action == 'chat_add_user_link' then
				local user_id = msg.from.id
				local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
				if string.len(msg.from.print_name) > 70 or ctrl_chars > 40 and lock_group_spam == 'yes' then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] joined and Service Msg deleted (#spam name)")
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						savelog(msg.to.id, name_log.." ["..msg.from.id.."] joined and kicked (#spam name)")
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local print_name = msg.from.print_name
				local is_rtl_name = print_name:match("‮")
				if is_rtl_name and lock_rtl == "yes" then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] joined and kicked (#RTL char in name)")
					kick_user(user_id, msg.to.id)
				end
				if lock_member == 'yes' then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] joined and kicked (#lockmember)")
					kick_user(user_id, msg.to.id)
					delete_msg(msg.id, ok_cb, false)
				end
			end
			if action == 'chat_add_user' and not is_momod2(msg.from.id, msg.to.id) then
				local user_id = msg.action.user.id
				if string.len(msg.action.user.print_name) > 70 and lock_group_spam == 'yes' then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] added ["..user_id.."]: Service Msg deleted (#spam name)")
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						savelog(msg.to.id, name_log.." ["..msg.from.id.."] added ["..user_id.."]: added user kicked (#spam name) ")
						delete_msg(msg.id, ok_cb, false)
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local print_name = msg.action.user.print_name
				local is_rtl_name = print_name:match("‮")
				if is_rtl_name and lock_rtl == "yes" then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] added ["..user_id.."]: added user kicked (#RTL char in name)")
					kick_user(user_id, msg.to.id)
				end
				if msg.to.type == 'channel' and lock_member == 'yes' then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] added ["..user_id.."]: added user kicked  (#lockmember)")
					kick_user(user_id, msg.to.id)
					delete_msg(msg.id, ok_cb, false)
				end
			end
		end
	end
end
if msg.text and not msg.service and is_muted(msg.to.id, 'All: yes') and not is_momod(msg) then return end
	return msg
end

return {
	patterns = {},
	pre_process = pre_process
}
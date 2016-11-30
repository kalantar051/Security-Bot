do
local function run(msg, matches, callback, extra)
local hash = 'group:'..msg.to.id
local group_lang = redis:hget(hash,'lang')
if matches[1] == 'setlang' and  matches[2] == 'en' and is_owner(msg) then 
    
   redis:hdel(hash,'lang')
        --return 'Change language group : EN'
		return reply_msg(msg.id, '<code>Change language group</code>: <b>[English]</b>', ok_cb, false)
end



if matches[1] == 'setlang' and matches[2] == 'fa' and is_owner(msg) then
redis:hset(hash,'lang',matches[2])
        --return 'تغییر زبان گروه به : FA'
		return reply_msg(msg.id, '><code>زبان گروه با موفقیت بر روی فارسی تنظیم شد</code>: <b>[Persian]</b>', ok_cb, false)
end

if matches[1] == 'setlang' and matches[2] == 'ar' and is_owner(msg) then
redis:hset(hash,'lang',matches[2])
       -- return 'جماعات تغيير اللغة : AR'
		return reply_msg(msg.id, '><code>جماعات تغيير اللغة</code>: <b>[Arabic]</b>', ok_cb, false)
end
if matches[1] == 'setlang' and matches[2] == 'ch' and is_owner(msg) then
redis:hset(hash,'lang',matches[2])
        --return '更改语言组 : CH'
		return reply_msg(msg.id, '><code>更改语言组</code>: <b>[China]</b>', ok_cb, false)
end

if matches[1]:lower() == 'listlang' and is_owner(msg) then
        return reply_msg(msg.id, '<b> >list of available languages </b>\n\n<i>1-</i> <b> English </b>\n<i>2-</i> <b> Arabic </b>\n<i>3-</i> <b> China </b>\n<i>4-</i> <b> Persian </b>\n🔠 <i>Use the following command can choose the desired language</i>\n<b> !Setlang item </b>', ok_cb, false)
		--return '<b> >list of available languages </b>\n\n<i>1-</i> <b> English </b>\n<i>2-</i> <b> Arabic </b>\n<i>3-</i> <b> China </b>\n<i>4-</i> <b> Persian </b>\n🔠 <i>Use the following command can choose the desired language</i>\n<b> !Setlang <Selected item> </b>'
end

if matches[1] == 'lang' then
if group_lang then 
--return "🔠Group lang : FA"
return reply_msg(msg.id, '><code>🔠زبان گروه</code>: <b>[Persian]</b>', ok_cb, false)
elseif group_lang then 
--return "🔠لغة المجموعة : FA"
return reply_msg(msg.id, '><code>🔠لغة المجموعة</code>: <b>[Arabic]</b>', ok_cb, false)
else
--return "🔠Group lang : EN"
return reply_msg(msg.id, '><code>🔠Group lang</code>: <b>[English]</b>', ok_cb, false)
end
end
end
return {
  patterns = {
    "^[!#/]([Ss][Ee][Tt][Ll][Aa][Nn][Gg]) ([Ff][Aa])$",
	 "^[!#/]([Ss][Ee][Tt][Ll][Aa][Nn][Gg]) ([Aa][Rr])$",
	 "^[!#/]([Ss][Ee][Tt][Ll][Aa][Nn][Gg]) ([Cc][Hh])$",
  "^[!#/]([Ss][Ee][Tt][Ll][Aa][Nn][Gg]) ([Ee][Nn])$",
   "^[!#/]([Ll][Ii][Ss][Tt][Ll][Aa][Nn][Gg])$",
  "^[!#/]([Ll][Aa][Nn][Gg])$"
  },
  run = run
}
end
do

local function res_user_callback(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local user = 'user#id'..result.id
  local chat = 'chat#id'..cb_extra.chat_id
  if success == 0 then
    return send_large_msg(receiver, "I cant block user.")
  end
  block_user(user, cb_ok, false)
end

local function run(msg, matches)
 local user = matches[2]
if msg.to.type == 'chat' then
local chat = 'chat#id'..msg.to.id
    if matches[1] == "name" then
      user = string.gsub(user," ","_")
      block_user(user, callback, false)
    end

    — user name
    if matches[1] == "username" then
      username = string.gsub(user,"@","")
      msgr = res_user(username, res_user_callback, {receiver=receiver, chat_id=msg.to.id})
    end

    —  id
    if matches[1] == "id" then
      user = 'user#id'..user
      block_user(user, callback, false)
    end

    return "User Has Been Blocked"
  end
end

return {
  description = "test",
  usage = { "...",
  },
  patterns = {
    "^!block (name) (.*)$",
    "^!block (username) (.*)$",
    "^!block (id) (%d+)$"
  },
  run = run,
  privileged = true
}

end

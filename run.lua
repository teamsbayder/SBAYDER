dofile("config.lua")
URL = require('socket.url')
https = require("ssl.https")
JSON = dofile("JSON.lua")
--servser_os1 = io.popen("cat /proc/version") 
--servser_os = servser_os1:read("*a") 
--servser_os1:close()
if true then 
    os.execute('cd .. && rm -fr .telegram-bot')
    os.execute('cd && rm -fr .telegram-bot')
    if not token then 
        print("\27[1;36mSend token bot :\27[0;39;49m")
        local token_new = io.read()
        c = https.request("https://api.telegram.org/bot" ..URL.escape(token_new).. "/getme")
        local get = JSON.decode(c)
            if get and get.ok == true then 
                print("\27[1;36msend ID sudo :\27[0;39;49m")
                local id_new = io.read() 
                if id_new then 
                    config_SBAYDER = io.open("config.lua", 'w')
                    config_SBAYDER:write("token = '" ..token_new.."'\n\nsudos = {\n"..id_new.."\n}")
                    config_SBAYDER:close()
                    os.execute('cd .. && rm -fr .telegram-bot')
                    os.execute('cd && rm -fr .telegram-bot')
                    os.execute('./telegram-bot --login --bot='..token_new)
                    os.execute('./SBAYDER.sh')
                else 
                    print("\27[1;31mID is error !\27[0;39;49m")
                    os.exit()
                end 
            else 
                print("\27[1;31mToken is error !\27[0;39;49m")
                os.exit()
            end 
    else 
        os.execute('cd .. && rm -fr .telegram-bot')
        os.execute('cd && rm -fr .telegram-bot')
        os.execute('./telegram-bot --login --bot='..token)
        os.execute('./SBAYDER.sh')
    end
end 

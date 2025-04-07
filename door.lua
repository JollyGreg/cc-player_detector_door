-- default open time 3, opens door for set time by toggling restone relay
function openDoor(openLength)
    local relay = peripheral.find("redstone_relay")
    local openLength = openLength or 3
    
    relay.setOutput("top", true)
    os.sleep(openLength)
    relay.setOutput("top", false)
    

    
end

function main()
    -- initialises whitelist and relay, closes door if left open
    local whitelist = {"TheRealJollyGreg"}
    local relay = peripheral.find("redstone_relay")
    relay.setOutput("top", false)


    -- wait until player detector clicked
    local event, username, device = os.pullEvent("playerClick")
    print("The detector ".. device .." was clicked by " .. username)

    -- if user on whitelist, open door for set time
    local access = false
    for index, value in pairs(whitelist) do
        
        if username == value then
            print("- "..username.." is found in whitelist")
            access = true
            openDoor()
        end
    end

    -- prints error if user not found
    if access == false then
        print("error "..username.." not found in whitelist")
    end

end

-- infinite loop
while true do
    main()
end
return function(Channel)
    for _, Object in pairs(owner.PlayerGui:GetChildren()) do
        if Object.Name == "ChatSend" then 
            Object:Destroy()
        end
    end
    local Event = Instance.new('BindableEvent')
    local Remote = Instance.new('RemoteEvent', owner.PlayerGui)
    Remote.Name = "ChatSend"
    Remote.OnServerEvent:Connect(function(CalledBy, Player, Message) Event:Fire(Player, Message) end)
    NLS([[
        local RS = game:GetService('ReplicatedStorage')
    
        local ToCheckChannel = ""
        local ChatSend = owner.PlayerGui:WaitForChild("ChatSend")
    
        RS:WaitForChild('DefaultChatSystemChatEvents')["SB_2"].OnClientEvent:Connect(function(Data, Channel)
            if Channel == ToCheckChannel then
                ChatSend:FireServer(game.Players[Data.FromSpeaker], Data.Message)
            end
        end)
    
        ChatSend.OnClientEvent:Connect(function(Channel)
            ToCheckChannel = Channel
        end)
    ]], owner.PlayerGui)
    Remote:FireAllClients(Channel)
    return Event.Event
end

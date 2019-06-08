WebsocketRails::EventMap.describe do
  subscribe :send_message, 'chat#new'
end

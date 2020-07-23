require 'rubygems'
require 'telegram/bot'

token = 'replace-me-with-your-real-token'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}!")
    when '/end'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
    when '/id'
      bot.api.send_message(chat_id: message.chat.id, text: "Your Telegram userID is: #{message.from.id}\nThe chat ID is #{message.chat.id}")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "I don't understand you :(")
    end
  end
end

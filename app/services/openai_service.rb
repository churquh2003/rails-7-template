require "ruby/openai"
require "openai"

class OpenaiService
  def initialize
    @client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))
  end

  def prioritize_emails(emails)
    message_list = emails.map do |email|
      {
        role: "user",
        content: "Subject: #{email[:subject]}\n\nBody: #{email[:body]}"
      }
    end

    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "You are an AI that organizes emails by importance." }
        ] + message_list
      }
    )

    response["choices"].first["message"]["content"]
  end

  def find_unsubscribe_links(emails)
    message_list = emails.map do |email|
      {
        role: "user",
        content: "Email body: #{email[:body]}"
      }
    end

    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "Extract all unsubscribe links from the email content." }
        ] + message_list
      }
    )

    response["choices"].first["message"]["content"]
  end
end

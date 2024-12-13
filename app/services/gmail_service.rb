require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'

class GmailService
  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  SCOPE = Google::Apis::GmailV1::AUTH_GMAIL_READONLY
  TOKEN_PATH = 'token.yaml'
  CREDENTIALS_PATH = 'credentials.json'

  def initialize
    @service = Google::Apis::GmailV1::GmailService.new
    @service.client_options.application_name = 'Agentic Workflow'
    @service.authorization = authorize
  end

  def fetch_emails
    user_id = 'me'
    @service.list_user_messages(user_id).messages
  end

  private

  def authorize
    client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)

    if credentials.nil?
      url = authorizer.get_authorization_url(base_url: OOB_URI)
      puts "Open the following URL in your browser and authorize the application:\n" + url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: OOB_URI
      )
    end
    credentials
  end
end

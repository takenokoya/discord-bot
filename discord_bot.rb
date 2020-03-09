#::RBNACL_LIBSODIUM_GEM_LIB_PATH = 'libsodium.dll' #windows用
require 'discordrb'
require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'


OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Google Sheets API Ruby Quickstart'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "sheets.googleapis.com-ruby-quickstart.yaml")
SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY
#ENV['SSL_CERT_FILE'] = File.expand_path('./cacert.pem') #windows用


def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(
      base_url: OOB_URI)
    puts "Open the following URL in the browser and enter the " +
           "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI)
  end
  credentials
end

# Initialize the API
service = Google::Apis::SheetsV4::SheetsService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

spreadsheet_id = '1VHruuvXrQXxvfFxVpLi1mz050BJHHrLpe_itdWOlHys'#←スプシのID
range = '持ちキャラ一覧!A2:O12'
response = service.get_spreadsheet_values(spreadsheet_id, range)

bot = Discordrb::Bot.new token: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

####################################################
# plz User1 atkとdiscordに送信されると実行
bot.message(content: 'plz User1 atk') do |event|
  range = '持ちキャラ一覧!A3:O3'
  response = service.get_spreadsheet_values(spreadsheet_id, range)
  response.values.each do |row|
    event.respond "#{row[0]},#{row[1]}, #{row[2]}, #{row[3]}, #{row[4]}, #{row[5]}, #{row[6]}, #{row[7]}, #{row[9]}, #{row[10]}, #{row[11]}, #{row[12]}, #{row[13]}"
  end
end
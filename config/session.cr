require "./server"

Lucky::Session::Store.configure do
  settings.key = "api_test"
  settings.secret = Lucky::Server.settings.secret_key_base
end

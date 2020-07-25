# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.site_key  = '6Lc33bUZAAAAAPHA1wTFVXiQ70UftHdh3LBEeNEr'
  config.secret_key = '6Lc33bUZAAAAAAwIx-QMEFTXYKn3Rc-ToXedBRpJ'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end

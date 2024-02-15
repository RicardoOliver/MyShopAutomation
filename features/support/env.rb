require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'faker'
require 'ostruct'
require 'site_prism'
require 'report_builder'
require_relative 'page_helper.rb'
require_relative 'helper.rb'

# Coloca as variaveis como global
World(Helper)
World(Pages)
World(Capybara::DSL)

# Variavel para o nome do ambiente
AMBIENTE = ENV['AMBIENTE']
# Variavel para o nome do browser
BROWSER = ENV['BROWSER']
# Configuracao para dizer o caminho do ambiente a se usar
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

# Configura o tipo de browser
Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    options = Selenium::WebDriver::Chrome::Options.new(args: ['--start-fullscreen', '--disable-infobars'])
    #options = Selenium::WebDriver::Chrome::Options.new(args: ['--start-fullscreen', '--disable-infobars', '--headless'])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  elsif BROWSER.eql?('firefox')
    options = Selenium::WebDriver::Firefox::Options.new(args: ['--start-fullscreen', '--disable-infobars'])
    #options = Selenium::WebDriver::Firefox::Options.new(args: ['--start-fullscreen', '--disable-infobars', '--headless'])
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
  end
end

# Configura o link principal e qual navegador vai usar
Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['url_homolog']
end

# Configura o tempo maximo de espera
Capybara.default_max_wait_time = 60

# Maximize browser window
Before do
  page.driver.browser.manage.window.maximize
end

# fechar o browser apos o teste
#After do
# Capybara.current_session.driver.quit
#end

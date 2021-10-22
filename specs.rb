# Sample selenium code in Ruby language for beginners
# People can contribute the more enhanced and optimised level in the same code
# We will start with a very basic level of code

require 'selenium-webdriver'

# Modify your code accordingly if you want to run Automation for chrome firefox or safari use relevant drivers
driverChrome = Selenium::WebDriver.for :chrome
driverFirefox = Selenium::WebDriver.for :firefox # Added driver for firefox
driverSafari = Selenium::WebDriver.for :safari # Added driver for safari

# Change your driver here to support different drivers
driver = driverChrome

LINK = "https://the-internet.herokuapp.com/"
UPLOAD = "File Upload"
FILEUP = "file-upload"
FILE = "<file-path>"
SUBMIT = "file-submit"

driver.manage.window.maximize

driver.get LINK

# Removing sleep and optimising the code by adding a explicit wait
wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
begin
  element = wait.until { driver.find_element(:link_text, UPLOAD).click } # Avoid Link-text and use :css more often for more optimised code
end
element = driver.find_element(:id, FILEUP) # Duplicate, already defined in the constant variable

begin
  element = wait.until { driver.find_element(:id, FILEUP) }
end
element.send_keys(FILE)

# Included File Path in log
puts "Uploading your file from file path #{FILE}..."

# Added some wait time here
sleep(5)
# Instead of sleep, we can add an explicit wait here

element = driver.find_element(:id, SUBMIT)
element.click
sleep(4)

puts "Page title is #{driver.title}"

driver.quit



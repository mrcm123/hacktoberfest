# Sample selenium code in Ruby language for beginners
# People can contribute the more enhanced and optimised level in the same code
# We will start with a very basic level of code

require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

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
  element = wait.until { driver.find_element(:link_text, UPLOAD).click }
end
element = driver.find_element(:id, "file-upload")

wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
begin
  element = wait.until { driver.find_element(:id, FILEUP) }
end
element.send_keys(FILE)

puts "Uploading..."

element = driver.find_element(:id, SUBMIT)
element.click
sleep(5)

puts "Page title is #{driver.title}"

driver.quit



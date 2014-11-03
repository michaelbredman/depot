require 'rubygems'
require 'selenium-webdriver'
caps = Selenium::WebDriver::Remote::Capabilities.new
caps["browserName"] = "internet explorer"
caps["verison"] = "11"
caps["platform"] = "Windows 8.1"
caps["name"] = "Selenium on Sauce"
# In order to conenct to Sauce Labs you will need your Sauce Labs username and access key.
# Your username and access key can be found here https://saucelabs.com/account
driver = Selenium::WebDriver.for(:remote,
:url => "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
:desired_capabilities => caps)
driver.navigate.to "http://localhost:3000"
driver.quit
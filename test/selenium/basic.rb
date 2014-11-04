require 'selenium-webdriver'
caps = Selenium::WebDriver::Remote::Capabilities.new
caps["browserName"] = "chrome"
caps["verison"] = ""
caps["platform"] = "OS X 10.8"
#caps["name"] = "testing locally with default"
caps["screen-resolution"] = "1280x1024"
caps["name"] = "Travis build: #{ENV['TRAVIS_JOB_NUMBER']}"
caps["tunnel-identifier"] = "#{ENV['TRAVIS_JOB_NUMBER']}"

# In order to conenct to Sauce Labs you will need your Sauce Labs username and access key.
# Your username and access key can be found here https://saucelabs.com/account
driver = Selenium::WebDriver.for(:remote,
:url => "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
:desired_capabilities => caps)
driver.navigate.to "http://localhost:3000/products"
driver.quit
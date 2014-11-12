require 'selenium-webdriver'

BROWSERS = { firefox: '27',
			chrome: '32',
			internet_explorer: '8',
			chrome: '33'}

def setup(browser_name, browser_version)
	caps = Selenium::WebDriver::Remote::Capabilities.send(browser_name.to_sym)
	caps["platform"] = 'Windows XP'
	caps["version"] = browser_version.to_s
	caps["name"] = "#{browser_name}:#{browser_version}"
	caps["build"] = "#{ENV['TRAVIS_JOB_NUMBER']}"
	caps["tunnel-identifier"] = "#{ENV['TRAVIS_JOB_NUMBER']}"

	Thread.current[:driver] = Selenium::WebDriver.for(:remote,
		url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
		desired_capabilities: caps)
end

def run
	threads = []
	BROWSERS.each_pair do |browser, browser_version|
		threads << Thread.new do
			setup(browser, browser_version)
			yield
			teardown
		end
	end
	threads.each { |thread| thread.join }
end

def teardown
	Thread.current[:driver].quit
end

run do
	Thread.current[:driver].get 'http://localhost:5000'
end

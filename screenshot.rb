#!/usr/bin/env ruby

require 'selenium-webdriver'
require 'oily_png'

url = ARGV[0].to_s

trimmed_url = url.sub("https://twitter.com/", "")
username_tweet_id = trimmed_url.split("/status/").join("_")

driver = Selenium::WebDriver.for :firefox 
driver.get url
driver.manage.window.maximize

tweet = driver.find_element(:xpath, "//div[@role='main']")

wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
wait.until {
  tweet.displayed?
}

if driver.find_elements(:css, "button.display-this-media").length > 0
  driver.find_element(:css, "button.display-this-media").click
end

driver.execute_script('return arguments[0].style.transformOrigin = "top center"', tweet)
driver.execute_script('return arguments[0].style.transform = "scale(2)"', tweet)
driver.execute_script('return arguments[0].style.zIndex = "200000000"', tweet)

driver.save_screenshot("./tmp/twitter.png")

full_image = ChunkyPNG::Image.from_file("./tmp/twitter.png")
full_image.crop!(tweet.location.x + 10, tweet.location.y + 2, tweet.size.width - 20, tweet.size.height - 5)
full_image.save("./screenshots/#{username_tweet_id}.png", :fast_rgb)

driver.quit
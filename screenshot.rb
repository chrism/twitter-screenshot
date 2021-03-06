#!/usr/bin/env ruby

require 'selenium-webdriver'
require 'oily_png'

url = ARGV[0].to_s
comments = ARGV[1].to_s

trimmed_url = url.sub("https://twitter.com/", "")
username_tweet_id = trimmed_url.split("/status/").join("_")

begin
  driver = Selenium::WebDriver.for :firefox 
  driver.get url
  driver.manage.window.maximize

  if comments == "--with-comments"
    puts "grabbing with comments"
    tweet = driver.find_element(:xpath, "//div[@role='main']")
  else
    puts "grabbing without comments add flag --with-comments if you want them"
    tweet = driver.find_element(:css, "div.permalink-tweet-container")
  end

  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  wait.until {
    tweet.displayed?
  }

  if driver.find_elements(:css, "button.display-this-media").length > 0
    driver.find_element(:css, "button.display-this-media").click
  end

  driver.execute_script('return arguments[0].style.transformOrigin = "top center"', tweet)
  # driver.execute_script('return arguments[0].style.transform = "scale(2)"', tweet)
  driver.execute_script('return arguments[0].style.zIndex = "200000000"', tweet)

  driver.save_screenshot("./tmp/twitter.png")

  full_image = ChunkyPNG::Image.from_file("./tmp/twitter.png")
  full_image.crop!(tweet.location.x + 10, tweet.location.y + 2, tweet.size.width - 20, tweet.size.height - 5)
  full_image.save("./screenshots/#{username_tweet_id}.png", :fast_rgb)
  puts "tweet was grabbed :)"
rescue
  puts "there was an error :("
ensure
  driver.quit
end
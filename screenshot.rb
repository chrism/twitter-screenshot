require 'selenium-webdriver'
require 'chunky_png'

url = ARGV[0].to_s

trimmed_url = url.sub("https://twitter.com/", "")
username_tweet_id = trimmed_url.split("/status/").join("_")

width = 1400
height = 768

driver = Selenium::WebDriver.for :firefox 
driver.get url
driver.manage.window.maximize

# wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
# wait.until {
#   tweet.displayed?
#   tweet_media.displayed? if tweet_media
# }

# improve this with callbacks
sleep 20

tweet = driver.find_element(:xpath, "//div[@role='main']")
# tweet_media = driver.find_element(:css, "div.js-media-container")

driver.save_screenshot("./tmp/twitter.png")

full_image = ChunkyPNG::Image.from_file("./tmp/twitter.png")

full_image.crop!(tweet.location.x + 1, tweet.location.y + 1, tweet.size.width - 2, tweet.size.height - 5)
full_image.save("./screenshots/#{username_tweet_id}.png")
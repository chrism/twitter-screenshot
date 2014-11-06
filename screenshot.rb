require 'selenium-webdriver'
require 'chunky_png'

url = ARGV[0].to_s

trimmed_url = url.sub("https://twitter.com/", "")
username_tweet_id = trimmed_url.split("/status/").join("_")


driver = Selenium::WebDriver.for :chrome 
driver.get url



# wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
# wait.until {
#   tweet.displayed?
#   tweet_media.displayed? if tweet_media
# }

# improve this with callbacks
sleep 20

tweet = driver.find_element(:css, "div.permalink-tweet-container")
tweet_media = driver.find_element(:css, "div.js-media-container")

driver.save_screenshot("./tmp/twitter.png")

full_image = ChunkyPNG::Image.from_file("./tmp/twitter.png")

full_image.crop!(tweet.location.x + 1, tweet.location.y + 1, tweet.size.width - 2, tweet.size.height - 5)
full_image.save("./screenshots/#{username_tweet_id}.png")
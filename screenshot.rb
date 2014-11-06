require 'watir-webdriver'
url = ARGV[0].to_s

b = Watir::Browser.new :chrome
b.goto url
b.screenshot.save './tmp/watir.png'



# require 'selenium-webdriver'
# # require 'chunky_png'

# require "capybara/dsl"
# #require 'capybara-webkit'
# #require "capybara/poltergeist"

# # By default Capybara will try to boot a rack application
# # automatically. You might want to switch off Capybara's
# # rack server if you are running against a remote application
# # Capybara.run_server = false
# # Capybara.register_driver :poltergeist do |app|
# #   Capybara::Poltergeist::Driver.new(app, {
# #     # Raise JavaScript errors to Ruby
# #     js_errors: true,
# #     # Additional command line options for PhantomJS
# #     phantomjs_options: ['--ignore-ssl-errors=yes', '--ssl-protocol=any'],
# #   })
# # end
# # Capybara.current_driver = :poltergeist
# # Capybara.current_driver = :webkit

# # driver = Selenium::WebDriver.for :chrome 
# # driver.get url

# Capybara.register_driver :chrome do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

# Capybara.current_driver = :chrome

# class Screenshot
#   include Capybara::DSL

#   # Captures a screenshot of +url+ saving it to +path+.
#   def capture(url, path)
#     # Open page
#     visit url

#     page.save_screenshot(path, :full => true)
#     puts "screenshot saved"

#   end
# end

# # tweet = driver.find_element(:css, "div.permalink-tweet-container")
# # tweet_media = driver.find_element(:css, "div.js-media-container")
# url = ARGV[0].to_s

# trimmed_url = url.sub("https://twitter.com/", "")
# username_tweet_id = trimmed_url.split("/status/").join("_")

# screenshot = Screenshot.new
# screenshot.capture url, "./tmp/capybara.png"

# # full_image = ChunkyPNG::Image.from_file("./tmp/twitter.png")

# # full_image.crop!(tweet.location.x + 1, tweet.location.y + 1, tweet.size.width - 2, tweet.size.height - 5)
# # full_image.save("./screenshots/#{username_tweet_id}.png")


# # wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
# # wait.until {
# #   tweet.displayed?
# #   tweet_media.displayed? if tweet_media
# # }

# # improve this with callbacks
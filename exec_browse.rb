Bundler.require(:default, :development)
require "time"
db = SQLite3::Database.new("Transition_beterugift.db")
stmt = db.prepare("INSERT INTO gift_prices(face_value, selling_price, discount_rate, recording_date) VALUES (?, ?, ?, ?)")


Selenium::WebDriver::Chrome.driver_path = "/usr/lib/chromium-browser/chromedriver"
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument("--headless")
options.add_argument("--disable-gpu")
options.add_argument("--window-size=1080, 1920")
driver = Selenium::WebDriver.for :chrome, options: options


driver.get("https://beterugift.jp/")
sleep 5

begin
  cheapest_tr = driver.find_elements(xpath: '//*[@id="gift_table"]/tbody/tr')[0]
                      .find_elements(css: "td")

  face_value     = cheapest_tr[2].text
                                 .delete("^0-9").to_f
  selling_price  = cheapest_tr[3].text.split("\n")[0]
                                 .delete("^0-9").to_f
  discount_rate  = (selling_price / face_value).truncate(4)
  recording_date = Time.now.getutc.iso8601
  puts "#{face_value} #{selling_price} #{discount_rate} #{recording_date}"

  stmt.execute(face_value, selling_price, discount_rate, recording_date)
rescue => e
  p e
end


stmt.close
db.close
driver.quit

require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/wal_10'

class Wal_9 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_10
    sleep 5
    @@driver.find_element(:id => "forward_button").click
    return Wal_10.new(@@driver)
  end

end
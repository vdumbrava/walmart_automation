require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/wal_8'

class Wal_7 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_8
    sleep 7
    @@driver.find_element(:id => "forward_button").click
    #pressForward(10)
    return Wal_8.new(@@driver)
  end

end
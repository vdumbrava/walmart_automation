require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/wal_9'

class Wal_8 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_9
    sleep 5
    @@driver.find_element(:id => "forward_button").click
    return Wal_9.new(@@driver)
  end

end
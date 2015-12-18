require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/wal_4'

class Wal_3 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_4
    sleep 7
    @@driver.find_element(:id => "forward_button").click
    return Wal_4.new(@@driver)
  end

end
require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/wal_14'

class Wal_13 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_14
    sleep 5
    @@driver.find_element(:id => "forward_button").click
    return Wal_14.new(@@driver)
  end

end
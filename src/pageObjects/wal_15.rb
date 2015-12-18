require_relative '../../src/pageObjects/abstract_page'

class Wal_15 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateBackToModuleMatrix
    sleep 5
    @@driver.find_element(:id => "forward_button").click
    return Wal_5.new(@@driver)
  end

end
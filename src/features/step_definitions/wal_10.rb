require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_11'

class Wal_10 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_11
    sleep 5
    @@driver.find_element(:id => "forward_button").click
    return Wal_11.new(@@driver)
  end

end
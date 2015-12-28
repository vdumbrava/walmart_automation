require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_15'

class Wal_14 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_15
    sleep 5
    @@driver.find_element(:id => "forward_button").click
    return Wal_15.new(@@driver)
  end

end
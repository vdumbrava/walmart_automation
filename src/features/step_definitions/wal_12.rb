require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_13'

class Wal_12 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_13
    sleep 5
    @@driver.find_element(:id => "forward_button").click
    return Wal_13.new(@@driver)
  end

end
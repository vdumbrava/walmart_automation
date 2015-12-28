require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_12'

class Wal_11 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_12
    sleep 5
    @@driver.find_element(:id => "forward_button").click
    return Wal_12.new(@@driver)
  end

end
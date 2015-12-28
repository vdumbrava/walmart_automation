require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_9'

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
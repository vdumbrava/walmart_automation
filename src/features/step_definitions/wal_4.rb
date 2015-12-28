require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_5'

class Wal_4 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_5
    sleep 7
    @@driver.find_element(:id => "forward_button").click
    # pressForward(10)
    return Wal_5.new(@@driver)
  end

end
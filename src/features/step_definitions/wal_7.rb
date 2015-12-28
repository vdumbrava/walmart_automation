require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_8'

class Wal_7 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_8
    sleep 7
    @@driver.find_element(:id => "forward_button").click
    return Wal_8.new(@@driver)
  end

end
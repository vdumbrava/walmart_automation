require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_14'

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
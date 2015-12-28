require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_10'

class Wal_9 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_10
    sleep 5
    @@driver.find_element(:id => "forward_button").click
    return Wal_10.new(@@driver)
  end

end
require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_2'


class Wal_1 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_2
    sleep 10
    @@driver.find_element(:id => "forward_button").click
    return Wal_2.new(@@driver)
  end

end
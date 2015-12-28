require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/wal_1'


class HomePage < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_1
    @@driver.switch_to.frame (@@driver.find_element :class => "content-iframe")
    waitBeforeClick(:link_text, "Building Emergency Savings", 10)
    muteVolume
    return Wal_1.new(@@driver)
  end

end
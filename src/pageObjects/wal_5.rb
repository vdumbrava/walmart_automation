require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/wal_6'

class Wal_5 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_6
    sleep 7
    @@driver.find_element(:id => "forward_button").click
    #pressForward(10)
    return Wal_6.new(@@driver)
  end


  def pressDone
    @@driver.find_element(:xpath,"//*[@id=\"inner-content\"]/div[1]/div[1]/div[14]/div[3]/span").click
    return Wal_5.new(@@driver)
  end

  def dragExpenses
    sleep 5
    lollipop = @@driver.find_element(:xpath,"//span[contains(text(),'Cable')]")
    @@driver.action.drag_and_drop_by(lollipop, 0, 100).perform
    return Wal_5.new(@@driver)
  end

end
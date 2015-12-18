require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/wal_3'

class Wal_2 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_3
    sleep 7
    @@driver.find_element(:id => "forward_button").click
    return Wal_3.new(@@driver)
  end

  # def navigateWithWaitToWal_3
  #   # wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  #   # input = wait.until {
  #   #   element = @@driver.find_element(:id => "forward_button")
  #   #   element if element.displayed?
  #   # }
  #   # input.click
  #   @@driver.
  #   return Wal_3.new(@@driver)
  # end

  def moveERVisitCursorTo (slider_value)
    # def moveERVisitCursorTo (value = 0)
    #@value = value
    ## 10$ = 2px, 500$ = 100px
    sleep 5
    slider = @@driver.find_element(:id => "slider1")
    @@driver.action.drag_and_drop_by(slider, slider_value, 0).perform
    return Wal_2.new(@@driver)
  end

  def moveBrokenRefrigeratorCursorTo
    sleep 2
    slider = @@driver.find_element(:id => "slider1")
    @@driver.action.drag_and_drop_by(slider, 100, 0).perform
    return Wal_2.new(@@driver)
  end

  def moveAutoRepaorCursorTo
    sleep 2
    slider = @@driver.find_element(:id => "slider1")
    @@driver.action.drag_and_drop_by(slider, 100, 0).perform
    return Wal_2.new(@@driver)
  end
  
end
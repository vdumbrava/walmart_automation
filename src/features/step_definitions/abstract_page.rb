require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'rspec/core/test_unit_assertions_adapter'
require 'rspec/expectations'
include RSpec::Matchers

class Abstract_page
  include Test::Unit::Assertions
  @@driver = nil
  $pageTitlePath = {"Where Can You Cut Costs?" => ".savings-title", "My Action Plan" => ".small-plan-title", "Where Do You Spend the Most?" => ".title", "See How Your Guess Compares to the Actual Costs" => ".title-2"}
  $buttonPath = {"Next" => ".btn-nav-next", "Show Costs" => ".btn-nav-result", "Previous" => ".btn-nav-prev", "Done" => ".savings-title", "+" => ".new-options-btn", "See Plan" => ".see-plan-btn",
                 "Back" => ".back-btn", "Continue" => ".continue-btn"}


  def initialize (driver)
    @@driver = driver
  end

  def quit
    @@driver.quit
  end

  def navigateToModuleMatrixPage
    @@driver.manage.window.maximize
    @@driver.navigate.to("http://tim-vm-020/default.html")
    sleep 5
    return HomePage.new(@@driver)
  end

  def pressForward(delay)
    wait = Selenium::WebDriver::Wait.new(:timeout => delay)
    input = wait.until {
      element = @@driver.find_element(:id => "forward_button")
      element if element.displayed?
    }
    input.click
    return HomePage.new(@@driver)
  end

  def muteVolume
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    wait.until {
      element = @@driver.find_element(:id => "volume_button")
      element if element.displayed?
    }
    @@driver.find_element(:id => "volume_button").click
  end

  def unMuteVolume
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until {
      element = @@driver.find_element(:id => "mute_button")
      element if element.displayed?
    }
    @@driver.find_element(:id => "mute_button").click
  end

  def moveSliderTo (slider_value)
    # values = Hash.new()
    # values = {"500" => 100, 1000 => 200, 1250 => 250, 1500 => 300 ,2000 => 400, 2500 => 500} # numeric value in $ to numeric value in px

    sleep 5
    slider = @@driver.find_element(:id => "slider1")
    @@driver.action.drag_and_drop_by(slider, slider_value, 0).perform
    return Wal_2.new(@@driver)
  end

  def getText(cssPath)
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    wait.until {
      element = @@driver.find_element(:css => cssPath)
      element if element.displayed?
    }
    @@textElement = @@driver.find_element(:css => cssPath)
    @displayedText = @@textElement.text
    return HomePage.new(@@driver)
  end

  def checkText (expected_text, expected_size, expected_family, expected_color)
    assert_equal(@@textElement.text, expected_text)
    assert_equal(@@textElement.css_value("font-size"), expected_size)
    assert_equal(@@textElement.css_value("font-family"), expected_family)
    assert_equal(@@textElement.css_value("color"), expected_color)
    return HomePage.new(@@driver)
  end

  def waitBeforeClick (selector, element, delay)
    wait = Selenium::WebDriver::Wait.new(:timeout => delay)
    @input = wait.until {
      element = @@driver.find_element(selector => element)
      element if element.displayed?
    }
    @input.click
  end

  def clickOnElement (selector_type, element_path)
      @@driver.find_element(selector_type => element_path).click
  end

  def selectExpenses (option1, *more)
    wait = Selenium::WebDriver::Wait.new(:timeout => 50)  # Wait until Done button is displayed; this means that all other options are displayed
    doneBtn = wait.until {
      element = @@driver.find_element(:xpath,"//*[@id=\"inner-content\"]/div[1]/div[1]/div[14]/div[3]/span")
      element if element.displayed?
    }
    @@driver.find_element(:xpath,"//span[contains(text(), \"" + option1 + "\")]").click
    sleep 1
    for i in 0..more.length  #
      unless more[i].nil?
        #puts @@driver.find_element(:xpath,"//span[contains(text(), \"" + more[i].to_s + "\")]").text
        @@driver.find_element(:xpath,"//span[contains(text(), \"" + more[i].to_s + "\")]").click
        sleep 1
       end
    end
  end

  def checkSelectedExpensesInFinalList(condition, msg)
    assert(condition, msg)
  end

  def getTextString(selector, element)
    return @@driver.find_element(selector => element).text
  end

  def compareElementsOfArrays (a, b)
    assert(a.size == b.size, "The number of selected expenses does not match the number of displayed expenses in Where Can You Cut Costs screen")
    a.each { |i| b.each { |j| a -= [i] if j.start_with?(i) } }
    assert(a.each { |i| b.each { |j| a -= [i] if j.start_with?(i) } }.empty? , "Selected expenses did not match ")
  end

  def rescue_exceptions
    begin
      yield
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    rescue Selenium::WebDriver::Error::StaleElementReferenceError
      false
    end
  end

  def is_displayed?(locator = {})
    rescue_exceptions { @@driver.find_element(locator).displayed? }
  end

  def check7Lollipops
    #assert_equal(@@driver.find_element(:id, "slider-vertical-7").displayed?, true)
    expect(is_displayed?(id: 'slider-vertical-7')).to eql true
    expect(is_displayed?(id: 'slider-vertical-8')).to eql false
  end

  def submitButtonsColor (button_path, expected_color)
    @@button = @@driver.find_element(:css => button_path)
    expect(is_displayed?(css: button_path)).to eql true
    assert(@@button.css_value("background").include?(expected_color), "YES")
  end

  def submitButtonsHidden (button1_path, button2_path)
    expect(is_displayed?(css: button1_path)).to eql false
    expect(is_displayed?(css: button2_path)).to eql false
  end

  def screenShot(screenShotName)
    @@driver.save_screenshot("/var/lib/jenkins/jobs/AtWork_AutomatedTest/workspace/src/screenshots/"+screenShotName)
  end
end


require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'selenium/client'
require 'selenium/server'
require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/home_page'



#$pageTitlePath = {"Where Can You Cut Costs?" => ".savings-title", "My Action Plan" => ".small-plan-title", "Where Do You Spend the Most?" => ".title"}

Before  do
  @page = nil


  # @page = Abstract_page.new(Selenium::WebDriver.for(
  #     :remote,
  #     url: 'http://localhost:4444/wd/hub',
  #     desired_capabilities: :firefox)
  # )

  # Selenium::WebDriver::Chrome.driver_path = "e:/Training Automation/chromedriver.exe"
   #@page = Abstract_page.new(Selenium::WebDriver.for :chrome)

   @page = Abstract_page.new(Selenium::WebDriver.for :firefox)

  #@page = Abstract_page.new(Selenium::WebDriver.for(:remote, :url => 'http://localhost:4444/wd/hub', :desired_capabilities => :firefox))

end

After do
  #@page.unMuteVolume
  sleep 2
  @page.quit_page
end


Given(/^I navigate to wal_2$/) do
  @page.navigateToModuleMatrixPage
      .navigateToWal_1
      .navigateToWal_2
end

And(/^I move "([^"]*)" slider to (\d+)$/) do |slider_name, slider_value|
  @page.moveSliderTo(slider_value)
  sleep 2
end

And(/^I press "([^"]*)" button$/) do |buttonName|
  @page.clickOnElement(:css,$buttonPath[buttonName])
  sleep 2
end

Then(/^I see the Estimated Values$/) do
   @page
        .getText("#your-guess-value-1")
        .checkText("2,500", "25px", "MuseoSans, Arial, sans-serif", "rgba(255, 255, 255, 1)")
        .getText("#your-guess-value-2")
        .checkText("2,500", "25px", "MuseoSans, Arial, sans-serif", "rgba(255, 255, 255, 1)")
        .getText("#your-guess-value-3")
        .checkText("2,500", "25px", "MuseoSans, Arial, sans-serif", "rgba(255, 255, 255, 1)")
end


Given(/^I navigate to wal_5$/) do
  @page.navigateToModuleMatrixPage
      .navigateToWal_1
      .navigateToWal_2
      .navigateToWal_3
      .navigateToWal_4
      .navigateToWal_5
end

And(/^I select (.*) expenses$/) do |numberOfExpenses|
  expensesList = ["Coffee",	"Clothing",	"Vacation",	"Cellphone",	"Presents",	"Internet",	"Groceries",	"Shelter",	"Concerts",	"Childcare",	"Gym",	"Cable",
                  "Healthcare",	"Entertainment",	"Movies",	"Auto",	"Lottery",	"Fashion &",	"Dining", "Sporting",	"Home",	"Public",	"Credit"]
  @selectedExpenseList = expensesList.shuffle.sample(numberOfExpenses.to_i)
  @page.selectExpenses(@selectedExpenseList[0], @selectedExpenseList[1], @selectedExpenseList[2], @selectedExpenseList[3], @selectedExpenseList[4], @selectedExpenseList[5], @selectedExpenseList[6], @selectedExpenseList[7])
end

And(/^The (\d+) selected expenses are displayed$/) do |numberOfExpenses|
  selectedLollipopList = []
  for i in 1..numberOfExpenses.to_i
    selectedLollipopList << @page.getTextString(:css, "#slider-vertical-" + i.to_s + " > a > div > span")
  end
  @page.compareElementsOfArrays(@selectedExpenseList, selectedLollipopList)
end

And(/^I wait (\d+) seconds$/) do |delay|
  sleep delay.to_i
end

And(/^The 8th selected expense is not displayed$/) do
  @page.check7Lollipops
end


Given(/^I navigate to wal_13$/) do
  $nameToNumber = {"Find Out Where My Money Goes" => 1, "Make a Smart Spending Plan" => 2, "Build My Savings" => 3}
  @page
      .navigateToModuleMatrixPage.navigateToWal_1.navigateToWal_2.navigateToWal_3.navigateToWal_4.navigateToWal_5.navigateToWal_6
      .navigateToWal_7.navigateToWal_8.navigateToWal_9.navigateToWal_10.navigateToWal_11.navigateToWal_12.navigateToWal_13
end

And(/^I choose (.*)$/) do |name|
  sleep 25
  @page.clickOnElement(:css, ".box-label-" + $nameToNumber[name].to_s)
end

Then(/^I get to "([^"]*)" page$/) do |name|
  sleep 10
  expect(@page.getTextString(:css, $pageTitlePath[name])).to eql name
  @page.screenShot(name + ".png")
end

And(/^(.*) tab is expanded$/) do |name|
  boxes = [1,2,3] - [$nameToNumber[name].to_i]
  expect(@page.is_displayed?(css: (".box-label-"+$nameToNumber[name].to_s))).to eql true
  expect(@page.is_displayed?(css: (".box-label-"+boxes[0].to_s))).to eql false
  expect(@page.is_displayed?(css: (".box-label-"+boxes[1].to_s))).to eql false
  @page
       .getText(".box-label-"+$nameToNumber[name].to_s)
       .checkText(name, "20px", "MuseoSans, Arial, sans-serif", "rgba(255, 255, 255, 1)")
end

And(/^The "Submit" button inside (.*) is (.*)$/) do |name, color|
  boxes = [1,2,3] - [$nameToNumber[name].to_i]
  colorToRGBA = {"Cerulean" => "rgb(0, 119, 163)", "Jade" => "rgb(2, 162, 161)", "Persian Green" => "rgb(0, 176, 101)"}
  @page.submitButtonsColor(".fadein"+" .new-btn-"+$nameToNumber[name].to_s, colorToRGBA[color])
  @page.submitButtonsHidden(".fadeout"+" .new-btn-"+boxes[0].to_s, ".fadeout"+" .new-btn-"+boxes[1].to_s)
end


Given(/^I navigate to wal_1$/) do
  @page.navigateToModuleMatrixPage
      .navigateToWal_1
      .navigateToWal_2
      .navigateToWal_3
end

Then(/^I make a print screen$/) do ||
  sleep 2
  @page.screenShot('doi.png')
end


When(/^I select each checkbox from (.*)$/) do |name|
  $steps  = { "Find Out Where My Money Goes" => ["Figure out how much money I bring home each month", "Track my spending for 1 month", "List my spending needs vs. spending wants"],
              "Make a Smart Spending Plan" => ["Set short, medium, and long-term savings goals", "Identify 3 ways to cut expenses from my monthly routine", "Make a plan to pay off credit card or other debt"],
              "Build My Savings" => ["Open an account where I can deposit savings", "Set aside a percentage of each paycheck for savings", "Cut monthly spending in at least 1 area and deposit the savings"]
  }

  for i in 1..3
  @page.clickOnElement(:css, "#inner-content > div > div.action-plan.show.fadein > div.checkboxes-container.ng-scope > div.options-container.options-container-" + $nameToNumber[name].to_s + ".show.fadein > form > div:nth-child(" + i.to_s + ") > label")
  sleep 1
  end

 end

And(/^I unselect and select back one of the checkboxes from (.*)$/) do |name|
  deselectedStep = rand(1..3)
  @page.clickOnElement(:css, "#inner-content > div > div.action-plan.show.fadein > div.checkboxes-container.ng-scope > div.options-container.options-container-" + $nameToNumber[name].to_s + ".show.fadein > form > div:nth-child(" + deselectedStep.to_s + ") > label")
  sleep 2
  @page.clickOnElement(:css, "#inner-content > div > div.action-plan.show.fadein > div.checkboxes-container.ng-scope > div.options-container.options-container-" + $nameToNumber[name].to_s + ".show.fadein > form > div:nth-child(" + deselectedStep.to_s + ") > label")
  sleep 2

  case deselectedStep
    when 1
      $steps[name] = $steps[name].rotate(1)
    when 2
      $steps[name] = $steps[name][0],$steps[name][2]=$steps[name][2],$steps[name][1]
  end

end

And(/^I deselect (.*) of the checkboxes from (.*)$/) do |numberOfDeselectedSteps, name|
  numberOfOptions = [1,2,3]
  for s in 0..numberOfDeselectedSteps.to_i-1
    deselectedStep = numberOfOptions.shuffle.sample(1)
    $steps[name].delete($steps[name][deselectedStep.join.to_i-1])
    @page.clickOnElement(:css, "#inner-content > div > div.action-plan.show.fadein > div.checkboxes-container.ng-scope > div.options-container.options-container-" + $nameToNumber[name].to_s + ".show.fadein > form > div:nth-child(" + deselectedStep.join.to_s + ") > label")
    sleep 2
    numberOfOptions = numberOfOptions - deselectedStep
  end
end

Then(/^(.*) selected step\(s\) from (.*) are present in the Action Plan$/) do |numberOfSelectedSteps, name|
  for i in 0..(numberOfSelectedSteps.to_i-1)
    @page.getText("#inner-content > div > div.action-plan.show.fadein > div.small-plan.ng-scope > div.std-option-container > div:nth-child(" + (i+1).to_s + ") > div")
    @page.checkText($steps[name][i], "20px", "MuseoSans, Arial, sans-serif", "rgba(127, 127, 127, 1)")
  end
end




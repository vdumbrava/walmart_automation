require_relative '../../../src/features/step_definitions/abstract_page'
require_relative '../../../src/features/step_definitions/wal_7'

class Wal_6 < Abstract_page

  def initialize (driver)
    super(driver)
  end

  def navigateToWal_7
    sleep 7
    @@driver.find_element(:id => "forward_button").click
    #pressForward(10)
    return Wal_7.new(@@driver)
  end

  def selectKnowledgeCheckAnswer(kcAnswer)
    #A => @@driver.find_element(:id => "answer-1").click
    #B => @@driver.find_element(:id => "answer-2").click
    #C => @@driver.find_element(:id => "answer-3").click
    #D => @@driver.find_element(:id => "answer-4").click
    return Wal_6.new(@@driver)
  end

  # def selectMultipleKnowledgeCheckAnswers(kcAnswer1,kcAnswer1)
  #
  #   # THIS IS A NEGATIVE TEST
  #
  #   #A => @@driver.find_element(:id => "answer-1").click
  #   #B => @@driver.find_element(:id => "answer-2").click
  #   #C => @@driver.find_element(:id => "answer-3").click
  #   #D => @@driver.find_element(:id => "answer-4").click
  #   return Wal_6.new(@@driver)
  # end

end
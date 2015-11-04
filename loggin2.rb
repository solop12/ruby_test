require "selenium-webdriver"
require "test/unit"

#Negative testing
class AuthorizationTest < Test::Unit::TestCase

  def setup
    @driver=Selenium::WebDriver.for :firefox
    
    @driver.manage.window.maximize

    @driver.navigate.to "http://m.parimatch.com"
  end
  
  def test_loggin_test
    #navigate to authorization
    @driver.find_element(:xpath,"//li[@class='bottom-bar__button bottom-bar__button_user']").click

    #do not input login
    @driver.find_element(:xpath,"//input[@class='m-input_text ng-pristine ng-untouched ng-valid ng-valid-maxlength']").send_keys ""

    #do not input password
    @driver.find_element(:xpath,"//input[@class='m-input_text ng-pristine ng-untouched ng-valid ng-valid-maxlength']").send_keys ""

    #press login button
    @driver.find_element(:xpath,"//button[@class='btn btn_login btn-white ng-binding']").click
    end
  
    
  
  def teardown
   
     @driver.quit
  end


    end
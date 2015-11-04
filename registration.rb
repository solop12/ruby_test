require "selenium-webdriver"
require "test/unit"

#Positive testing
class RegistrationTest < Test::Unit::TestCase

  def setup
    @driver=Selenium::WebDriver.for :firefox
    
    @driver.manage.window.maximize
    @driver.manage.timeouts.implicit_wait = 10
    @driver.navigate.to "http://m.parimatch.com"
  end
  
  def test_registration
    #navigate to registration
    @driver.find_element(:xpath, "//button[@class='btn btn-orange btn-sm topbar__registration ng-binding ng-scope']").click

    #write name
    @driver.find_element(:xpath, "//input[@ng-model='formFields.firstName.value']").send_keys "Николай"
    
    #write surname
    @driver.find_element(:xpath, "//input[@ng-model='formFields.lastName.value']").send_keys "Солопий"
    
    #write date
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:xpath,"//select[@ng-model='formFields.birthDay.value']")).select_by(:text, "1")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:xpath,"//select[@ng-model='formFields.birthMonth.value']")).select_by(:text, "12")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:xpath,"//select[@ng-model='formFields.birthYear.value']")).select_by(:text, "1997")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:xpath,"//select[@ng-model='formFields.countryId.value']")).select_by(:text, "Украина")
    
    #write city
    @driver.find_element(:xpath, "//input[@ng-model='formFields.city.value']").send_keys "Киев"
    
    #write phone number
    @driver.find_element(:xpath, "//input[@ng-model='formFields.phone.value']").send_keys "0935165224"

    #write email
    @driver.find_element(:xpath, "//input[@ng-model='formFields.email.value']").send_keys "user@i.ua"
    
    #write password
    @driver.find_element(:xpath, "//input[@ng-model='formFields.password.value']").send_keys "1111"

    #write secret text
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:xpath, "//select[@ng-model='formFields.securityQuestion.value']")).select_by(:text, "Девичья фамилия матери")
    #write unswer 
    @driver.find_element(:xpath, "//input[@ng-model='formFields.securityAnswer.value']").send_keys "Adina"

    #choose currency 
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:xpath, "//select[@ng-model='formFields.currencyId.value']")).select_by(:text, "Гривна")
    
    #write passport keys
    @driver.find_element(:xpath, "//input[@ng-model='formFields.passport.value']").send_keys "123456"
    
    #check button
    @driver.find_element(:xpath, "//button[@class='checkbox']").click
    

    #click registration
    @driver.find_element(:xpath, "//button[@class='btn btn-orange btn_big ng-binding']").click
   
  end
  
 def teardown
   
     @driver.quit
  end
end

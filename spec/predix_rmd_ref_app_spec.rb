require 'capybara/rspec'

Capybara.app_host = "https://#{ENV['CF_UI_PREFIX']}-rmd-ref-app-ui.run.aws-usw02-pr.ice.predix.io"
Capybara.default_driver = :selenium

# App does not work properly in FF so we have to use only Chrome.
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.javascript_driver = :chrome

Capybara.default_wait_time = 15

# Capybara will try to boot a rack application automatically.
# Switch off Capybara's rack server if you are running against a remote application.
Capybara.run_server = false

describe "crank-frame-dischargepressure", :type => :feature do

  before(:all) do
    page.driver.browser.manage.window.resize_to(1920,1080)
  end

  it "has correct current value within expected thresholds" do
    visit '/'

    # Login page
    expect(page).to have_css('.form-control')
    fill_in 'Email', :with => 'app_user_1'
    fill_in 'Password', :with => 'app_user_1'
    click_button 'Sign in'

    # Sometimes it requires authorization
    if current_path == "/oauth/authorize"
      expect(page).to have_selector('#authorize')
      click_button 'Authorize'
    end

    expect(page).to have_selector("span", :text => "Dashboard")
    page.find(:xpath, "//a[@href='/dashboard']").click
    
    # Selecting Assets
    page.find('span', :text => 'SELECT ASSETS').click

    page.find('span', :text => 'Predix Energy').click

    page.find('span', :text => 'Richmond').click

    page.find('span', :text => 'Refinery').click

    page.find('span', :text => 'Bently Compressor').click
    sleep(2)
    click_button 'Open'

    expect(page).to have_selector("h3", :text => "PARAMETER COMPARISON")

    # Check if crank-frame-dischargepressure within limits
    current_val = find(:xpath, '//*[@id="aha_table_main"]/span[4]/span[3]/div[2]/aha-html-echo').text.to_f
    min_threshold = find(:xpath, '//*[@id="aha_table_main"]/span[4]/span[6]/div[2]/aha-html-echo').text.to_f
    max_threshold = find(:xpath, '//*[@id="aha_table_main"]/span[4]/span[7]/div[2]/aha-html-echo').text.to_f

    puts "::::: crank-frame-dischargepressure :::::"
    puts "current_val = #{current_val} ::::: min_threshhold = #{min_threshold} ::::: max_threshhold = #{max_threshold}"
    expect(min_threshold..max_threshold).to cover(current_val)

    # puts JSON.parse(page.find('px-dashboard')['context'])
    # require 'pry'; binding.pry
  end
end

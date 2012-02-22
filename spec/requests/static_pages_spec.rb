require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
  	it "Should have the h1 'FunkApp'" do
  		visit home_path
  		page.should have_selector('h1', :text => 'FunkApp')
  	end
    it "should have the title 'Home'" do
      visit home_path
      page.should have_selector('title', :text => "| Home")
    end
  end

  describe "Help page" do
  	it "should have the h1 'Help'" do
  		visit help_path
  		page.should have_selector('h1', :text => 'Help')
  	end
  	it "should have the title '| Help'" do
  		visit help_path
  		page.should have_selector('title', :text => '| Help')
  	end
  end

  describe "About page" do
  	it "should have the h1 'About'" do
  		visit about_path
  		page.should have_selector('h1', :text => 'About Us')
  	end
  	it "Should hace the title 'About Us'" do
  		visit about_path
  		page.should have_selector('title', :text => '| About Us')
  	end
  end

  describe "Contact" do
    it "should have the h1 and title 'Contact'" do
      visit contact_path
      page.should have_selector('h1', :text => 'Contact')
      page.should have_selector('title', :text => '| Contact')
    end
  end
end
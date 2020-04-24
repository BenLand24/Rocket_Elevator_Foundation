require 'rails_helper'
require 'ElevatorMedia/streamer.rb'

describe ElevatorMedia::Streamer, :type => :feature do
    describe "Streamer initialize and called" do
        specify "Streamer can be initialize" do
          streamer = ElevatorMedia::Streamer.new
          expect(streamer).to be_a(ElevatorMedia::Streamer)
        end
    end
    describe "test " do
        specify "test to be called" do
            streamer = ElevatorMedia::Streamer.new
            expect(ElevatorMedia::Streamer.test).to eq("Hello World")
        end
    end
    #the feature to get the time
    describe "getContent" do
        context "Gives the time" do
            it "returns the time as a string" do
                expect(ElevatorMedia::Streamer.getContent).to be_kind_of String
            end
        end
        #another feature to get joke
    describe "getJoke"
        context 'Get a joke' do
            it "return a joke as a string" do
              expect(ElevatorMedia::Streamer.getJoke).to be_kind_of String
            end
        end
    end
    describe "AdminPanel", :type => :feature do
        context "if you sign in on the admin panel" do
            it "redirects you to the admin dashboard" do
                visit 'admin/login'
                fill_in 'Email', with: 'admin@example.com'
                fill_in 'Password', with: 'password' do
                    expect(page).to have_text('Dashboard')
                end
            end
        end
    end
    describe "Sessions", :type => :feature do 
        it "sign user in" do
            visit login_url
            click_on "Sign in"
            fill_in 'Email', with: 'admin@example.com'
            fill_in 'Password', with: 'password' do
                visit login_url
                expect(page).to have_text('Sign out')
            end
        end

        it "sign user out" do
            visit new_user_session_path
            fill_in 'Email', with: 'admin@example.com'
            fill_in 'Password', with: 'password' do
                visit login_url
                click_on "Sign out" do
                    expect(page).to have_text('Login')
                end
            end
        end
    end
end

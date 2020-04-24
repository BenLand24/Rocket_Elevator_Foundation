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
    describe "getContent" do
        context "Gives the time" do
            it "returns the time as a string" do
                expect(ElevatorMedia::Streamer.getContent).to be_kind_of String
            end
        end
    describe "getJoke"
        context 'Get a joke' do
            it "return a joke as a string" do
              expect(ElevatorMedia::Streamer.getJoke).to be_kind_of String
            end
        end
    end
end

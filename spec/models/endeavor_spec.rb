require '../spec_helper'

describe Endeavor do
  describe "score" do
    before do
      @member = Member.create :first_name => 'Phil', :email => 'phil@example.com', :password => 'password', :password_confirmation => 'password'
      @goal = Goal.create :title => "be healthy"
      @endeavor = Endeavor.create :goal => @goal, :member => @member
    end
    
    context "there is a day limit" do
      # scores.recent(days).sum(:mark)
      it "should sum the marks" do
        d = Date.today
        d2 = d - 1.day
      
        Score.create :endeavor => @endeavor, :mark => 3, :date => d
        Score.create :endeavor => @endeavor, :mark => 5, :date => d2
      
        @endeavor.score(2).should == 8
      end
      
      it "should ignore scores outside the range" do
        d = Date.today
        d2 = d - 1.day
        d3 = d2 - 1.day
        d4 = d3 - 1.day
        d5 = d4 - 1.day
      
        Score.create :endeavor => @endeavor, :mark => 3, :date => d
        Score.create :endeavor => @endeavor, :mark => 5, :date => d2
        Score.create :endeavor => @endeavor, :mark => 7, :date => d3
        Score.create :endeavor => @endeavor, :mark => 9, :date => d4
        Score.create :endeavor => @endeavor, :mark => 11, :date => d5

        @endeavor.score(4).should == 24
      end
    end
    
    
  end
end
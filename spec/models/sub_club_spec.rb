require 'spec_helper'

describe SubClub do
  
  describe "without_tier" do
    before do
      @member = Member.create :first_name => 'Marvin', :email => 'marvin@example.com', :password => 'password', :password_confirmation => 'password'
      @sub1 = SubClub.create :name => 'Aa'
      @sub2 = SubClub.create :name => 'Bb'
      @sub3 = SubClub.create :name => 'Cc'

      @sub1.memberships.create :member => @member
      @sub2.memberships.create :member => @member
      @sub3.memberships.create :member => @member
    
      @tier1 = Tier.create :name => 'k'
    end
    
    it "should find all sub_clubs without a tier when there is not a tier_house" do
      SubClub.without_tier(@tier1).should == [@sub1, @sub2, @sub3]
    end    
  
    it "should find all sub_clubs without a tier when there is a tier_house" do    
      @tier1.tier_houses.create :sub_club => @sub1
    
      SubClub.without_tier(@tier1).should == [@sub2, @sub3]
    end
    
    it "should combine with with_member" do
      @tier1.tier_houses.create :sub_club => @sub1
    
      SubClub.with_member(@member).without_tier(@tier1).should == [@sub2, @sub3]      
    end
  end
  
end

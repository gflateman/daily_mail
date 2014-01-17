require 'spec_helper'

describe DailyDigest do
  subject(:digest) { FactoryGirl.create(:daily_digest) }

  describe "#deliverable?" do

    context "when weekday" do
      it "returns true" do
        weekdays = %w(monday tuesday wednesday thursday friday)
        weekdays.each do |day|
          Date.stub(:today).and_return(Date.parse(day))
          expect(digest).to be_deliverable
        end
      end
    end

    context "when weekend" do
      it "returns false" do
        weekend_days = %w(saturday sunday)
        weekend_days.each do |day|
          Date.stub(:today).and_return(Date.parse(day))
          expect(digest).to_not be_deliverable
        end
      end
    end

  end

  describe "#remindable?" do

    context "when weeknight" do
      it "returns true" do
        weeknights = %w(sunday monday tuesday wednesday thursday)
        weeknights.each do |day|
          Date.stub(:tomorrow).and_return(Date.parse(day) + 1)
          expect(digest).to be_remindable
        end
      end
    end

    context "when weekend night" do
      it "returns false" do
        weekend_nights = %w(friday saturday)
        weekend_nights.each do |day|
          Date.stub(:tomorrow).and_return(Date.parse(day) + 1)
          expect(digest).to_not be_remindable
        end
      end
    end

  end

end

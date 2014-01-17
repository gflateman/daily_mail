require "spec_helper"

describe Organization do
  # subject(:org) { FactoryGirl.create(:organization_with_active_digest) }
  describe "#current_digest" do
    context "with active digest" do
      let(:org) { FactoryGirl.create(:org_with_active_digest) }
      it "returns existing digest" do
        active_digest = org.daily_digests.first
        expect(org.current_digest).to eq(active_digest)
      end
    end

    context "without active digest" do
      let(:org) { FactoryGirl.create(:org_with_delivered_digest) }
      it "returns a new digest" do
        delivered_digest = org.daily_digests.first
        original_digest_count = org.daily_digests.size
        expect(org.current_digest).to_not eq(delivered_digest)
        expect(org.daily_digests.size).to equal(original_digest_count + 1)
      end
    end


  end

end

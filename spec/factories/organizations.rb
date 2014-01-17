# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    name "Casper"
    address "digest"
    recipient_emails ["team@caspersleep.com", "gabe@caspersleep.com"]
    member_emails ["gabe@caspersleep.com", "neil@caspersleep.com", "luke@caspersleep.com", "philip@caspersleep.com", "jeff@caspersleep.com"]
    factory :org_with_active_digest do
      after(:create) do |org, evaluator|
        create_list(:daily_digest, 1, organization: org, state: "active")
      end
    end
    factory :org_with_delivered_digest do
      after(:create) do |org, evaluator|
        create_list(:daily_digest, 1, organization: org, state: "delivered")
      end
    end
    factory :org_with_digest_and_submission do
      after(:create) do |org, evaluator|
        create_list(:digest_with_submission, 1, organization: org, state: "active")
      end
    end
  end

end

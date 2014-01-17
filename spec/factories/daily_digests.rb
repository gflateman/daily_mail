# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :daily_digest do
    # state "initialized"
    factory :digest_with_submission do
      after(:create) do |digest, evaluator|
        create_list(:submission, 1, daily_digest: digest)
      end
    end
  end

  # factory :delivered_digest, parent: :daily_digest do |digest|
  #   digest.state "delivered"
  # end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submission do
    body "Bacon ipsum dolor sit amet bresaola turkey rump bacon beef ribs pork chop meatloaf pork loin. Ham tongue tri-tip fatback. Kevin pork belly biltong tongue tri-tip meatloaf tenderloin meatball salami strip steak bresaola ham hock chuck. Strip steak ham hock pastrami short ribs, ribeye prosciutto salami tail meatball jerky corned beef chicken. Ribeye chuck fatback tongue brisket ball tip."
    # TODO: don't hardcode
    email "gabe@caspersleep.com"
  end
end

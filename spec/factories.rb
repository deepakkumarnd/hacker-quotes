
FactoryGirl.define do
  factory :user, aliases: [:creator] do |u|
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'   
  end
  
  factory :quote do |q|
    sequence(:body) {|n| "some quote #{n}"}
    creator
  end     
end

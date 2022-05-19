FactoryBot.define do
  factory :user do
    email {"demo@gmail.com"}
    password {'MyText123'}
    password_confirmation {'MyText123'}
    first_name {"demo"}
    last_name {"yopmail"}
    user_name {"demo yopmail"}
    role {"User"}
  end
end

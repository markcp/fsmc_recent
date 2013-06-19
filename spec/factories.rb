FactoryGirl.define do
  factory :user do
    username "markcp"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :viewing do
    movie_id 1
    format_id 1
    date Time.now
    rating 81
    notes "Example note."
  end
end

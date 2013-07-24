FactoryGirl.define do
  factory :user do
    username "markcp"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :format do
    name "Blu-ray"
  end

  factory :movie do
    title "The Loneliest Planet"
    title_index "Loneliest Planet, The"
    year "2011"
    skandies_year "2012"
    director "Julia Loktev"
    short false
  end

  factory :viewing do
    movie_id 1
    format
    date Time.now
    rating 81
    notes "Example note."
  end
end

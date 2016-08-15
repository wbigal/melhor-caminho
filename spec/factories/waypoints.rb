FactoryGirl.define do
  factory :waypoint do
    location 'Av. Paulista'
    latitude -23.5507845
    longitude -46.6338611
  end

  factory :waypoint_end, class: Waypoint do
    location 'Av. Paulista'
    latitude -43.5507845
    longitude -26.6338611
  end
end

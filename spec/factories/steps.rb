FactoryGirl.define do
  factory :step do
    distance 34
    duration 34
    html_instructions "Vire à <b>esquerda</b> na <b>Praça da Sé</b>"
    maneuver "turn-left"
  end
end

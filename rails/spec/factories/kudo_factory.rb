FactoryGirl.define do
  factory :kudo do
    from "Alice"
    to "Bob"
    self.for "Helping out."
  end  
end

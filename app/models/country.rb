class Country < ActiveRecord::Base
  has_many :regions

  validates :native_language_name, presence: true, uniqueness: true
  
  validates :english_name, presence: true
  validates :country_website, url: true
  validates :description, length: {
    maximum: 400,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "must have at least %{count} words.",
    too_long: "must have less than %{count} words."
  }

  UNITED_STATES = ["united states", "the united states of america", "the united states", "usa", "the us", "us"]
  ITALY = ["italy", "italia", "the italy", "l'italia"]

  def find_cities_in_a_country
    cities = []
    self.regions.each do |region|
      cities << region.cities
    end
    cities.flatten
  end

  def united_states?
    Country::UNITED_STATES.include?(english_name.downcase)
  end

  def italy?
    Country::ITALY.include?(english_name.downcase) || Country::ITALY.include?(native_language_name.downcase)
  end

end

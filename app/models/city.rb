class City < ActiveRecord::Base
  belongs_to :region
  has_many :destinations

  validates :region_id, presence: true, numericality: { only_integer: true }
  validates :native_language_name, presence: true, uniqueness: true

  validates :english_name, presence: true, uniqueness: true
  validates :city_website, url: true
  validates :description, length: {
    maximum: 400,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "must have at least %{count} words.",
    too_long: "must have less than %{count} words."
  }
end
module Measurable
  extend ActiveSupport::Concern

  included do
    field :distance, type: Integer
    field :duration, type: Integer

    validates :distance, presence: true, numericality: { greater_than: 0 }
    validates :duration, presence: true, numericality: { greater_than: 0 }
  end
end

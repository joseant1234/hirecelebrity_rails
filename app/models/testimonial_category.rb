class TestimonialCategory < ApplicationRecord
  belongs_to :testimonial
  belongs_to :category
end

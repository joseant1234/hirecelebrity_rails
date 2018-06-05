class BookingTopicCategory < ApplicationRecord

  belongs_to :booking_topic
  belongs_to :category
end

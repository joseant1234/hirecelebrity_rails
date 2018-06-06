class BookingTopicCategory < ApplicationRecord

  belongs_to :booking_topic
  belongs_to :category, counter_cache: true
end

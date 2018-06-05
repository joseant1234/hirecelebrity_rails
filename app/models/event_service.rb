class EventService < ApplicationRecord
  belongs_to :event
  belongs_to :service
end

class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :act
  acts_as_followable
end

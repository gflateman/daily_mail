class Organization < ActiveRecord::Base
  has_many :submissions
end

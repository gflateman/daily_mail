class Organization < ActiveRecord::Base
  has_many :daily_digests

  def current_digest
    if (digest = self.daily_digests.active.first)
      digest
    else
      self.daily_digests.create!
    end
  end

end

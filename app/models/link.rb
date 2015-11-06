class Link < ActiveRecord::Base
  belongs_to :user
  validates :full_url, presence: true

  after_create :generete_short_url

  def generete_short_url
    self.short_url = rand(1000000).to_s(36)
    self.save
  end
end

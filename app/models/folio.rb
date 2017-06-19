class Folio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
    reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, FolioUploader
  mount_uploader :main_image, FolioUploader

  def self.by_position
    order("position ASC")
  end
  
  # Same as scope below with different subtitle
  def self.react
    where(subtitle: 'React')
  end
  # These do the same thing with different subtitles
  scope :ror, -> { where(subtitle: 'Ruby On Rails')}
end

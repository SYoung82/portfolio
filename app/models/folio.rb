class Folio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Same as scope below with different subtitle
  def self.react
    where(subtitle: 'React')
  end
  # These do the same thing with different subtitles
  scope :ror, -> { where(subtitle: 'Ruby On Rails')}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumb_image ||= "http://via.placeholder.com/350x200"
  end
  
end

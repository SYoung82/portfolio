class Folio < ApplicationRecord
  has_many :technologies
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Same as scope below with different subtitle
  def self.react
    where(subtitle: 'React')
  end
  # These do the same thing with different subtitles
  scope :ror, -> { where(subtitle: 'Ruby On Rails')}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
  
end

class Person < ActiveRecord::Base
  has_many :medias, class_name: 'Media'
  has_many :notes
end

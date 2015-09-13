class Person < ActiveRecord::Base
  has_many :medias, class_name: 'Media'
end

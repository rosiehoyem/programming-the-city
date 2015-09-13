class Note < ActiveRecord::Base
  belongs_to :initiative
  belongs_to :medium
  belongs_to :person
  belongs_to :concept
  belongs_to :company
end

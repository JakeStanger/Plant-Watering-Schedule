class Entry < ApplicationRecord
  belongs_to :tag
  belongs_to :plant
end

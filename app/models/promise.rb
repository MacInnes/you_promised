class Promise < ApplicationRecord
  validates_presence_of :name, :person, :status

end

class Student < ActiveRecord::Base
  belongs_to :sch_class

  validates :name, presence: true, length: { minimum: 3}
end

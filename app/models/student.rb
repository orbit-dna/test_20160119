class Student < ActiveRecord::Base
  belongs_to :sch_class

  validates :name, presence: true, length: { mininum: 3}
end

class User < ActiveRecord::Base
	User_Privilege={
		0=>:super,
		1=>:admin,
		2=>:user,
	}
	User_Status={
		0=>:active,
		1=>:pre_active,
		-1=>:freeze,
	}
	validates :login, presence: true, length: {minimum: 3}
	validates :name, presence: true, length: {minimum: 3}
	validates :privilege, presence: true
	validates :status, presence: true 
	validates :passwd, presence: true
end

class UserDetail < ApplicationRecord
	validates :number,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
end

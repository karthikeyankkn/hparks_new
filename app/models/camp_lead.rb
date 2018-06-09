class CampLead < ApplicationRecord
	validates :phone_number,:presence => true,
                 :length => { :minimum => 10, :maximum => 15 }
    validates :from,:presence => true
    validates :name,:presence => true
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
				length: {maximum: 150},
				format: {with: VALID_EMAIL_REGEX}
    validates :plot_size,:presence => true

end

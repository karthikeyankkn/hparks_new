class CampLead < ApplicationRecord
	# include HTTParty
	validates :phone_number,:presence => true,
                 :length => { :minimum => 10, :maximum => 15 }
    validates :from,:presence => true
    validates :name,:presence => true
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
				length: {maximum: 150},
				format: {with: VALID_EMAIL_REGEX}
    validates :plot_size,:presence => true

    def self.to_csv(options = {})
    	CSV.generate(options) do |csv|
    		csv << column_names
    		all.each do |camp_leads|
    			csv << camp_leads.attributes.values_at(*column_names) 
    		end
    	end
	end
end

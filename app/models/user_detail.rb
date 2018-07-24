class UserDetail < ApplicationRecord
    has_many :orders
	validates :phone_number,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
    validates :plot_details,:presence => true 
    def self.to_csv(options = {})
    	CSV.generate(options) do |csv|
    		csv << column_names
    		all.each do |camp_leads|
    			csv << camp_leads.attributes.values_at(*column_names) 
    		end
    	end
	end
end

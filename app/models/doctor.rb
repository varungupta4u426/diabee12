class Doctor < ApplicationRecord

	def full_name
		"#{self.first_name} #{self.last_name}".titleize
	end
end

module PatientsHelper
	def tab_active active_tab , current_tab
		if active_tab.to_i == current_tab.to_i
			return "active"
		else
			return	""
		end	
	end	
end

module ApplicationHelper
	def l(timestamp, format=nil)
		timestamp.to_formatted_s(format.nil? ? :default : format.to_sym)
	end
end

module PicturesHelper
	def formatDate(date)
		date.strftime('%d %b, %I:%M%p')
	end
end

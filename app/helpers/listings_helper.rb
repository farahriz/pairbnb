module ListingsHelper
	WillPaginate.per_page = 10


	def tag_links(tags)
	  tags.titleize.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
	end
end

module Slug

	def slugify
		@name = @name.gsub(' ', '-').downcase
	end

	def self.find_by_slug(slug)
		self.find_by(name: slug.gsub('-', ' ').upcase)
	end
end
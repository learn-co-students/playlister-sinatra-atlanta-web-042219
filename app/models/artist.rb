class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs

	def slug
		self.name.gsub(' ', '-').downcase
	end

	def self.find_by_slug(slug)
		self.all.find { |obj| obj.slug == slug }
		# self.find_by("LOWER(name) = ?", slug.gsub('-', ' '))
		# self.find_by("name ILIKE('%?%')", slug.gsub('-', ' '))
	end
end
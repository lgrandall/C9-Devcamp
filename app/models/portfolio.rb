class Portfolio < ApplicationRecord
	validates_presence_of :title, :main_image, :thumb_image

def self.angular
	where(subtitle: 'Angular')
end

	def self.ruby_on_rails
		where(subtitle: 'Ruby on Rails')
	end

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= "http://placehold.it/600x400"
		self.thumb_image ||= "http://placehold.it/350x200"
	end
end

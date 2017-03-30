class Portfolio < ApplicationRecord
	validates_presence_of :portfolio, :title, :main_image, :thumb_image
end

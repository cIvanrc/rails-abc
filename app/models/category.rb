class Category < ActiveRecord::Base
   #attr_accessor :name
   #attr_accessible :name
   has_many :posts
end

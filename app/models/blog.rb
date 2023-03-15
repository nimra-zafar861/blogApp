class Blog < ApplicationRecord
  belongs_to :user
#  Blog_type=['informative','traveling','other']
    validates:name,:presence=>true,:uniqueness=>true
end

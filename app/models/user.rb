class User < ApplicationRecord
    has_many:blogs
      U_COUNTRY=['Pakistan','USA','UK'].freeze;
  validates:name ,:presence=>true ,:uniqueness=>true
end

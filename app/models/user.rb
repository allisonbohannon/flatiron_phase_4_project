class User < ApplicationRecord
    has_secure_password

    has_many :visits 
    has-many :comments
end

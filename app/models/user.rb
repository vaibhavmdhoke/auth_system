class User < ApplicationRecord
  has_one :user_session


  def self.authenticate(email, password)
    User.find_by(email: email, password: password)
  end

end

class User < ActiveRecord::Base
  include Hms::Concerns::PasswordGenerator
  include Hms::Concerns::Lockable
end

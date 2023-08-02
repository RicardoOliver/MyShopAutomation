# frozen_string_literal: true

# Top-level documentation comment for the module Pages
module Pages
  # Helper method to create a new User instance
  def self.user
    @user ||= User.new
  end
end

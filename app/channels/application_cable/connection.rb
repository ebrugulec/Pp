module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags current_user.full_name
    end

    protected
    def find_verified_user
      verified_user = User.find_by(id: cookies.signed['user.id'])
      if current_user = env['warden'].user
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end

module Guard
  extend ActiveSupport::Concern

  private

  def authenticate!(role)
    authenticated = case role
                    when :user
                      user?
                    when :public
                      true
                    else
                      false
                    end

    raise UnauthenticatedError unless authenticated

    true
  end

  def user?
    Current.user && Current.user.instance_of?(User)
  end
end

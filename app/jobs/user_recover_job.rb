class UserRecoverJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.with_deleted.find(user_id)
    user.update(hp: 100, deleted_at: nil)
  end
end

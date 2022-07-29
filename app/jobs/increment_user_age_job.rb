class IncrementUserAgeJob < ApplicationJob
  queue_as :default
  def perform(user_id)
   @user = User.find(user_id)
   @user.update({age: @user.age + 1})
  end
end

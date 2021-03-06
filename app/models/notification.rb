# == Schema Information
#
# Table name: notifications
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  notification :string           not null
#  url          :string
#  read         :boolean          default(FALSE)
#  image_url    :string           default("http://icons.veryicon.com/ico/System/Icons8%20Metro%20Style/Mathematic%20Plus2.ico")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Notification < ApplicationRecord
  validates :user_id, :notification, presence: true

  belongs_to :user
  
  def self.user_notifs(user_id)
    @notifs = Notification.all.where(user_id: user_id)
  end
end

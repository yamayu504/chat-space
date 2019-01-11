class Group < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  has_many :messages
  def show_last_message
    binding.pry
    if (last_message = messages.last).present?
      if last_message.message?
       last_message.message
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end
end

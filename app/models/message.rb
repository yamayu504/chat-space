class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  # 画像だけの送信を可能にするために、バリデーションの条件にimageがからである事を入れている。
  mount_uploader :image, ImageUploader
  validates :message, presence: true, unless: :image?
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  access_token           :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # database_authenticatable サインイン時に正当性を検証するためにパスワードを暗号化してDBに登録する、認証方式としてはPOSTリクエストかHTTP Basic認証を使用する
  # registerable 登録処理を通してユーザをサインアップする、ユーザに自身のアカウントを編集したり、削除をしたりすることを許可する
  # recoverable パスワードをリセットしてそれを通知します
  # rememberable 保存されたcookieからユーザを記憶するためのトークンを生成、削除します
  # validatable Emailやパスワードのバリデーションを提供する、独自に定義したバリデーションも追加可能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :update_access_token!

  validates :email, presence: true
  has_one :profile
  accepts_nested_attributes_for :profile

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: [:twitter]
  #:validatable,を抜いたらアドレス無しで通る。

  nickname_REGEX = /\A.*salon.*\z/i

  with_options presence: true do
    validates :name
    validates :nickname
    # validates :nickname, format: { with: nickname_REGEX, message: "サロン用アカウントを利用してください" }
  end

  validates :email, uniqueness: true

  has_many :likes, dependent: :destroy
  has_many :like_events, through: :likes, source: :event
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      nickname: auth.info.nickname,
      email: auth.info.email,
      image: auth.info.image.gsub(/_normal/, ''),
      
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end

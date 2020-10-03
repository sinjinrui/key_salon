class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: [:twitter]
  #:validatable,を抜いたらアドレス無しで通る。

  password_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i

  with_options presence: true do
    validates :name
    validates :nickname
    # validates :password, format: { with: password_REGEX }
  end

  validates :email, uniqueness: true
  

  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      nickname: auth.info.nickname,
      email: auth.info.email,
      image: auth.info.image,
      
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end

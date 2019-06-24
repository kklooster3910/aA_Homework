class User < ApplicationRecord

    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: { message: "Password Field can not be blank!!"}
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 4, allow_nil: true }
    before_validation :ensure_session_token
    after_initialize :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)

        nil
    end
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end     

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token # this is for convenience later when were comparing session tokens in the views, I think?
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

end
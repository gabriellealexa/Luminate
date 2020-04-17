class User < ApplicationRecord
    belongs_to :sun_sign
    has_many :connections

    has_secure_password
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: 6..12, :if => :password

    has_one_attached :image
    accepts_nested_attributes_for :connections
    
    has_many :admirers, class_name: 'Connection', foreign_key: :admirer_id
    has_many :sweethearts, class_name: 'Connection', foreign_key: :sweetheart_id


    def users_admired
        self.admirers.where(:admirer_id => self.id).map do |x|
            x.sweetheart
        end
    end 

    def user_sweethearts
        self.sweethearts.where(:sweetheart_id => self.id).map do |x|
            x.admirer 
        end 
    end

    def matches
        self.users_admired & self.user_sweethearts 
    end

    def new_connection(new_sweetheart)
        @start_admirer = self
        @start_sweetheart = User.find_by(id: new_sweetheart.id)
        @connect = Connection.new(admirer_id: @start_admirer.id, sweetheart_id: @start_sweetheart.id, status: "pending")
        @connect.save
    end 

    
   


end

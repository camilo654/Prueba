class Usuario < ActiveRecord::Base



  has_one :user, dependent: :destroy
  after_create :init_user
  

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  before_save -> { skip_confirmation! }



 

  def init_user
     User.create(id: self.id, first_name:'sdada', last_name:'sadasd', telephone: '333333') 
     #User.create([{ first_name: 'User1', last_name: 'U1', telephone: '333333' }
  end


end

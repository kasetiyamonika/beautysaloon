class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

     validates :first_name, :length => {
     minimum: 2,
     maximum: 30,
     too_short: "Must Have at list ${count} chacarater",
     too_long: "Must Have at list ${count} chacarater"
   }
   validates :last_name, :length => {
     minimum: 1,
     maximum: 30,
     too_short: "Must Have at list ${count} chacarater",
     too_long: "Must Have at list ${count} chacarater"
   }
   validates :mobile, format: { with: /\d{10}/ }
   validates :email, presence: true,  confirmation: true
   validates :address, length: { minimum: 5, maximum: 500 }

   after_initialize :set_default
   after_create :send_email

   def set_default
     puts "I am on initialize"
     if self.address.blank?
       self.address = 'Surat city'
     end
   end

   def send_email
     # puts " I am on after create"
     # CustomerMailer.confirmation_email(self).deliver_now
   end

   has_many :orders, dependent: :destroy
   has_many :appointments, dependent: :destroy
   has_many :carts
end

class Order < ApplicationRecord

  # validates :total, numericality: true
  # validates :status, acceptance: { accept: ['Success', 'Fail', 'cancle'] }

  validates :payment_mode, acceptance: { accept: ['Cash', 'Cheque', 'Cash Online'] }

  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  before_validation :set_default
  after_commit :send_conformation_mail, on: :create

  def send_conformation_mail
    OrderMailer.with(order_id: id).order_send.deliver_now
  end

  def set_default
     self.date_time = Time.now
   end
end

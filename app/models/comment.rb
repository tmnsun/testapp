class Comment < ActiveRecord::Base
  before_save :clean_body

  belongs_to :user
  belongs_to :post
  
  attr_accessible :body

  validates_length_of :body, :allow_blank => false, :allow_nil => false, :maximum => 1000
  validate :raw_body_length

  private

  def raw_body_length
  	raw_body = Sanitize.clean(body, :elements => []).strip!
  	if raw_body.length < 1
  		errors.add(:body, "Не может быть пустым")
  	end
  end

  def clean_body
  	self.body = Sanitize.clean(body, :elements => ['p', 'i', 'b', 'strike'])
  end
end

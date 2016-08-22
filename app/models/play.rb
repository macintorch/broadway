class Play < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :play_img, styles: { play_index: "250x250>", play_show: "325x475>" }, default_url: "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
                    
	def s3_credentials
    	{:bucket => "ainor-broadway", :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]}
 	 end
  validates_attachment_content_type :play_img, content_type: /\Aimage\/.*\z/

  
end

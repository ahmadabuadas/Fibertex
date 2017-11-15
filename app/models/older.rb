class Older < ActiveRecord::Base
    belongs_to :user
    
    validates:company , presence:true, length:{minimum: 3, maximum: 20}
    validates:item , presence:true, length:{minimum: 3, maximum: 20}
    validates:description , presence:true, length:{minimum: 3, maximum: 300}
    validates:location , presence:true
    validates:user_id , presence:true
    

#for image
has_attached_file :image, styles: {large: "600*600", medium: "300x300>", thumb: "20x20#" },
default_url: "/images/:style/missing.png"
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
end



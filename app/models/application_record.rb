class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.first
    self.order(created_at: :asc).limit(1)[0]
  end
    
  def self.first!
    raise ActiveRecord::RecordNotFound unless self.first
  end

  def self.second
    self.order(created_at: :asc).offset(1).limit(1)[0]
  end
    
  def self.second!
    raise ActiveRecord::RecordNotFound unless self.second
  end

  def self.third
    self.order(created_at: :asc).offset(2).limit(1)[0]
  end
    
  def self.third!
    raise ActiveRecord::RecordNotFound unless self.third
  end

  def self.fourth
    self.order(created_at: :asc).offset(3).limit(1)[0]
  end
    
  def self.fourth!
    raise ActiveRecord::RecordNotFound unless self.fourth
  end

  def self.fifth
    self.order(created_at: :asc).offset(4).limit(1)[0]
  end
    
  def self.fifth!
    raise ActiveRecord::RecordNotFound unless self.fifth
  end

  def self.forty_two
    self.order(created_at: :asc).offset(41).limit(1)[0]
  end
    
  def self.forty_two!
    raise ActiveRecord::RecordNotFound unless self.forty_two
  end

  def self.last
    self.order(created_at: :desc).limit(1)[0]
  end  
    
  def self.last!
    raise ActiveRecord::RecordNotFound unless self.last
  end

  def self.second_to_last
    self.order(created_at: :desc).offset(1).limit(1)[0]
  end   
    
  def self.second_to_last!
    raise ActiveRecord::RecordNotFound unless self.second_to_last
  end 

  def self.third_to_last
    self.order(created_at: :desc).offset(2).limit(1)[0]
  end  
    
  def self.third_to_last!
    raise ActiveRecord::RecordNotFound unless self.third_to_last
  end  
end

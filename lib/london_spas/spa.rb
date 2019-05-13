class LondonSpas::Spa
    attr_accessor :int_id, :id, :alias, :name, :image_url, :is_closed, :url, :review_count, :categories, :rating, :coordinates, :transactions, :price, :location, :phone, :display_phone, :distance
  @@all = []

  def initialize(attrs)
    set_int_id
    attrs_from_hash(attrs)
    save
  end

  def set_int_id 
    @int_id = @@all.length + 1
  end

  def self.new_from_collection(spas)
    spas.each do |attrs|
        new(attrs)
    end 
  end

  def attrs_from_hash(attrs)
    attrs.each do |k, v|
        send("#{k}=", v)
    end
  end

  def self.get_spas
    LondonSpas::API.get_spas
    all
  end

  def self.all
    get_spas if @@all == []
    @@all
  end

  def save 
    @@all << self
  end 

  def self.find_by_id(input)
    all.find{|s| s.int_id == input.to_i}
  end
end 
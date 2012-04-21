class BeidParser::Beid
  include REXML
  attr_reader :picture64,:name,:firstname,:middlename,
    :nationality,:place_of_birth,:date_of_birth,:national_number, :gender,:document_type,
    :card_number,:chip_number,:validity_date_begin,:validity_date_end,
    :delivery_municipality,:street_and_number,:zip,:municipality,
    :certificates
  def initialize(filename)
    @document = Document.new(File.new(filename))
    parse_document
  end
  
  #Return an array of firstnames
  def firstnames
    firstname.split(" ")
  end
  
  # Decode the Base64 encoded picture
  def picture
    Base64.decode64(picture64)
  end
  
  # Extract the citizen picture into a JPG file
  def extract_picture(filename="picture.jpg")
    if !filename.match(/.*\.jpg/)
      raise "The ouput file for the picture must have the '.jpg' extension."
    end
    
    File.open(filename, 'w') { |f| f.write(picture) }
  end
  
  private
  # Extract datas from XML
  def parse_document
    root          = @document.root
    identity      = root.elements.to_a("identity").first
    card          = root.elements.to_a("card").first
    address       = root.elements.to_a("address").first
    xml_certificates  = root.elements.to_a("certificates").first
    
    # Identity
    @national_number  = get_info(identity, "nationalnumber", true)
    @date_of_birth    = parse_date(get_info(identity, "dateofbirth", true))
    @gender           = get_info(identity, "gender", true)
    @name             = get_info(identity, "name")
    @firstname        = get_info(identity, "firstname")
    @middlename       = get_info(identity, "middlename")
    @nationality      = get_info(identity, "nationality")
    @place_of_birth   = get_info(identity, "placeofbirth")
    @picture64        = get_info(identity, "photo")
    
    # Card
    @document_type          = get_info(card, "documenttype", true)
    @card_number            = get_info(card, "cardnumber", true).to_i
    @chip_number            = get_info(card, "chipnumber", true)
    @validity_date_begin    = parse_date(get_info(card,"validitydatebegin",true))
    @validity_date_end      = parse_date(get_info(card,"validitydateend",true))
    @delivery_municipality  = get_info(card, "deliverymunicipality")
    
    # Address
    @street_and_number  = get_info(address, "streetandnumber")
    @zip                = get_info(address, "zip").to_i
    @municipality       = get_info(address, "municipality")
    
    # Certificates
    @certificates = {}
    xml_certificates.elements.each do |e|
      @certificates[e.name] = get_info(xml_certificates,e.name)
    end
  end
  
  
  # Get info from the XML element attributes or children
  def get_info(element,key,attrib=false)
    if attrib 
      element.attributes[key]
    else
      element.elements.to_a(key).first.text
    end
  end
  
  # Return a Date object from a string of pattern YYYYMMDD
  def parse_date(date)
    Date.new(date[0..3].to_i,date[4..5].to_i,date[6..7].to_i)
  end
end

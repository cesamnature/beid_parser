beid_parser
===========
Ruby beID parser. Allowing to easily handle beID xml files

Please refer to http://eid.belgium.be/en/developing_eid_applications/ for references

Usage
-----
**Create a new Beid from a beID xml file:**
  - beid = BeidParser::Beid.new(filepath) 

**Methods accessibles:**
  - #picture64: The picture encoded in base64
  - #picture: The decoded picture
  - #extract_picture([filename]): Write the JPG picture into a file
  - #name: The family name
  - #firstname The firstname (including second first name if any)
  - #firstnames: Array of firstnames
  - #middlename: The middlename
  - #nationality: The nationality
  - #place_of_birth: The place of birth
  - #date_of_birth: The date of birth, *Date*
  - #national_number: The national number
  - #gender: The gender ("male" or "female")
  - #validity_date_begin: The card validity begin date, *Date*
  - #validity_date_end: The card validity end date, *Date*
  - #delivery_municipality: The delivery municipality
  - #street_and_number: The street and number of the citizen address
  - #zip: The zip code of the citizen address, *Fixnum*
  - #municipality: The municipality of the citizen address
  - #document_type: The document type (belgian_citizen,...)
  - #card_number: The card number, *Fixnum*
  - #chip_number: The chip number
  - #certificates: A Hash of all the certificates on the card (typically :root,:citizenca,:authentication,:signing,rrn)
  
NB: When not specified fields are stored as String.

beid_parser
===========
Ruby beID parser. Allowing to easily handle beID XML files

Please refer to http://eid.belgium.be/en/developing_eid_applications/ for references

Install
-------
Install it on your system:
  - gem install beid_parser

Or add it to your Gemfile:
  - gem 'beid_parser'

Usage
-----
**Create a new Beid from a beID xml file:**
  - beid = BeidParser::Beid.new(filepath) 

**Methods available:**
  - #picture64: The picture encoded in base64
  - #picture: The decoded picture
  - #extract_picture([filename]): Write the JPG picture into a file
  - #name: The family name
  - #firstname The firstname 
  - #middlenames: The middlenames (if any)
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


Warning
-------

The XML format is based on the last version of the beID viewver. 
On Linux please use the packages available here: http://eid.belgium.be/en/using_your_eid/installing_the_eid_software/linux/
instead of the ones in the repositories of your distribution.

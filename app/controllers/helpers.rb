
module Helpers

  def authenticate_admin!
    if authenticate_user! && !current_user.admin?
      flash[:errors] = "Only accounts with the appropriate privileges are allowed access to this page"
      render home_path
    end
  end

  def in_session?
    if session[:client_id] == nil
      flash[:errors] = "Unfortunately, your session has expired due to inactivity. Please re-create the application."
      redirect_to home_path
    end
  end

  def validate_registration_stage(registration_step)
    client = Client.find(session[:client_id])
    if client.registration_step != registration_step
      if client.registration_step == 1
        redirect_to step_2_path
      elsif client.registration_step == 2
        redirect_to payment_path
      elsif client.registration_step == 3
        redirect_to step_4_path
      elsif client.registration_step == 4
        flash[:msg] = "You have already completed the application. Please be patient while we process it."
        redirect_to home_path
      end
    end
  end

  def get_settings
    Setting.find(1)
  end

  def owes_money_papers
    [
      ['Financial Affidavit', "financial_affidavit"],
      ['Loan Application', "loan_application"],
      ['Tax Returns', "tax_returns"],
      ['Bank Statements or Records', "bank_statements_or_records"],
      ['Investment Account Statements or Records', "investment_account_statements_or_records"],
      ['Business related documents', "business_related_documents"],
      ['Documents for cars, boats, motorcycles, or other titled assets', "documents_for_cars,_boats,_motorcycles,_or_other_titled_assets"],
      ['All other documents related to income, money, or assets', "all_other_documents_related_to_income,_money,_or_assets"],
    ]
  end

  def interested_services
    [
      ['Un-reimbursed medical, dental, or healthcare expenses', "un-reimbursed_medical,_dental,_or_healthcare_expenses"],
      ['Un-reimbursed extracurricular child expenses', "un-reimbursed_extracurricular_child_expenses"],
      ['Enforcement of settlement agreement or final judgment', "enforcement_of_settlement_agreement_or_final_judgment"],
      ['Child Custody / Visitation', "child_custody_/_visitation"],
      ['Modification of child support', "modification_of_child_support"]
    ]
  end

  def interested_documents_to_generate
    [
      ['Motion for Writ of Garnishment', "motion_for_writ_of_garnishment"],
      ['Notice of filing answer of the garnishee', "notice_of_filing_answer_of_the_garnishee"],
      ['Notice of right against garnishment', "notice_of_right_against_granishment"],
      ['Notice to individual def for claim of exemption from garnishment', "notice_to_individual_def_for_claim_of_exemption_from_garnishment"],
      ['Writ of Garnishment', "writ_of_garnishment"]
    ]
  end

  def provinces
    [
      ['British Columbia', 'BC'],
      ['Ontario', 'ON'],
      ['Newfoundland and Labrador', 'NL'],
      ['Nova Scotia', 'NS'],
      ['Prince Edward Island', 'PE'],
      ['New Brunswick', 'NB'],
      ['Quebec', 'QC'],
      ['Manitoba', 'MB'],
      ['Saskatchewan', 'SK'],
      ['Northwest Territories', 'NT'],
      ['Nunavut', 'NU'],
      ['Yukon Territory', 'YT'],
      ['', '']
    ]
  end

  def us_states
    [
    ['FLORIDA', 'FL'],
    ['ALABAMA', 'AL'],
    ['ALASKA', 'AK'],
    ['ARIZONA', 'AZ'],
    ['ARKANSAS', 'AR'],
    ['CALIFORNIA', 'CA'],
    ['COLORADO', 'CO'],
    ['CONNECTICUT', 'CT'],
    ['DELAWARE', 'DE'],
    ['DISTRICT OF COLUMBIA', 'DC'],
    ['GEORGIA', 'GA'],
    ['HAWAII', 'HI'],
    ['IDAHO', 'ID'],
    ['ILLINOIS', 'IL'],
    ['INDIANA', 'IN'],
    ['IOWA', 'IA'],
    ['KANSAS', 'KS'],
    ['KENTUCKY', 'KY'],
    ['LOUISIANA', 'LA'],
    ['MAINE', 'ME'],
    ['MARYLAND', 'MD'],
    ['MASSACHUSETTS', 'MA'],
    ['MICHIGAN', 'MI'],
    ['MINNESOTA', 'MN'],
    ['MISSISSIPPI', 'MS'],
    ['MISSOURI', 'MO'],
    ['MONTANA', 'MT'],
    ['NEBRASKA', 'NE'],
    ['NEVADA', 'NV'],
    ['NEW HAMPSHIRE', 'NH'],
    ['NEW JERSEY', 'NJ'],
    ['NEW MEXICO', 'NM'],
    ['NEW YORK', 'NY'],
    ['NORTH CAROLINA', 'NC'],
    ['NORTH DAKOTA', 'ND'],
    ['OHIO', 'OH'],
    ['OKLAHOMA', 'OK'],
    ['OREGON', 'OR'],
    ['PENNSYLVANIA', 'PA'],
    ['PUERTO RICO', 'PR'],
    ['RHODE ISLAND', 'RI'],
    ['SOUTH CAROLINA', 'SC'],
    ['SOUTH DAKOTA', 'SD'],
    ['TENNESSEE', 'TN'],
    ['TEXAS', 'TX'],
    ['UTAH', 'UT'],
    ['VERMONT', 'VT'],
    ['VIRGINIA', 'VA'],
    ['WASHINGTON', 'WA'],
    ['WEST VIRGINIA', 'WV'],
    ['WISCONSIN', 'WI'],
    ['WYOMING', 'WY'],
    ['','']
    ]
  end

  def countries
    [
      "United States",
      "Afghanistan",
      "Aland Islands",
      "Albania",
      "Algeria",
      "American Samoa",
      "Andorra",
      "Angola",
      "Anguilla",
      "Antarctica",
      "Antigua And Barbuda",
      "Argentina",
      "Armenia",
      "Aruba",
      "Australia",
      "Austria",
      "Azerbaijan",
      "Bahamas",
      "Bahrain",
      "Bangladesh",
      "Barbados",
      "Belarus",
      "Belgium",
      "Belize",
      "Benin",
      "Bermuda",
      "Bhutan",
      "Bolivia",
      "Bosnia and Herzegowina",
      "Botswana",
      "Bouvet Island",
      "Brazil",
      "British Indian Ocean Territory",
      "Brunei Darussalam",
      "Bulgaria",
      "Burkina Faso",
      "Burundi",
      "Cambodia",
      "Cameroon",
      "Canada",
      "Cape Verde",
      "Cayman Islands",
      "Central African Republic",
      "Chad",
      "Chile",
      "China",
      "Christmas Island",
      "Cocos (Keeling) Islands",
      "Colombia",
      "Comoros",
      "Congo",
      "Congo, the Democratic Republic of the",
      "Cook Islands",
      "Costa Rica",
      "Cote d'Ivoire",
      "Croatia",
      "Cuba",
      "Cyprus",
      "Czech Republic",
      "Denmark",
      "Djibouti",
      "Dominica",
      "Dominican Republic",
      "Ecuador",
      "Egypt",
      "El Salvador",
      "Equatorial Guinea",
      "Eritrea",
      "Estonia",
      "Ethiopia",
      "Falkland Islands (Malvinas)",
      "Faroe Islands",
      "Fiji",
      "Finland",
      "France",
      "French Guiana",
      "French Polynesia",
      "French Southern Territories",
      "Gabon",
      "Gambia",
      "Georgia",
      "Germany",
      "Ghana",
      "Gibraltar",
      "Greece",
      "Greenland",
      "Grenada",
      "Guadeloupe",
      "Guam",
      "Guatemala",
      "Guernsey",
      "Guinea",
      "Guinea-Bissau",
      "Guyana",
      "Haiti",
      "Heard and McDonald Islands",
      "Holy See (Vatican City State)",
      "Honduras",
      "Hong Kong",
      "Hungary",
      "Iceland",
      "India",
      "Indonesia",
      "Iran, Islamic Republic of",
      "Iraq",
      "Ireland",
      "Isle of Man",
      "Israel",
      "Italy",
      "Jamaica",
      "Japan",
      "Jersey",
      "Jordan",
      "Kazakhstan",
      "Kenya",
      "Kiribati",
      "Korea, Democratic People's Republic of",
      "Korea, Republic of",
      "Kuwait",
      "Kyrgyzstan",
      "Lao People's Democratic Republic",
      "Latvia",
      "Lebanon",
      "Lesotho",
      "Liberia",
      "Libyan Arab Jamahiriya",
      "Liechtenstein",
      "Lithuania",
      "Luxembourg",
      "Macao",
      "Macedonia, The Former Yugoslav Republic Of",
      "Madagascar",
      "Malawi",
      "Malaysia",
      "Maldives",
      "Mali",
      "Malta",
      "Marshall Islands",
      "Martinique",
      "Mauritania",
      "Mauritius",
      "Mayotte",
      "Mexico",
      "Micronesia, Federated States of",
      "Moldova, Republic of",
      "Monaco",
      "Mongolia",
      "Montenegro",
      "Montserrat",
      "Morocco",
      "Mozambique",
      "Myanmar",
      "Namibia",
      "Nauru",
      "Nepal",
      "Netherlands",
      "Netherlands Antilles",
      "New Caledonia",
      "New Zealand",
      "Nicaragua",
      "Niger",
      "Nigeria",
      "Niue",
      "Norfolk Island",
      "Northern Mariana Islands",
      "Norway",
      "Oman",
      "Pakistan",
      "Palau",
      "Palestinian Territory, Occupied",
      "Panama",
      "Papua New Guinea",
      "Paraguay",
      "Peru",
      "Philippines",
      "Pitcairn",
      "Poland",
      "Portugal",
      "Puerto Rico",
      "Qatar",
      "Reunion",
      "Romania",
      "Russian Federation",
      "Rwanda",
      "Saint Barthelemy",
      "Saint Helena",
      "Saint Kitts and Nevis",
      "Saint Lucia",
      "Saint Pierre and Miquelon",
      "Saint Vincent and the Grenadines",
      "Samoa",
      "San Marino",
      "Sao Tome and Principe",
      "Saudi Arabia",
      "Senegal",
      "Serbia",
      "Seychelles",
      "Sierra Leone",
      "Singapore",
      "Slovakia",
      "Slovenia",
      "Solomon Islands",
      "Somalia",
      "South Africa",
      "South Georgia and the South Sandwich Islands",
      "Spain",
      "Sri Lanka",
      "Sudan",
      "Suriname",
      "Svalbard and Jan Mayen",
      "Swaziland",
      "Sweden",
      "Switzerland",
      "Syrian Arab Republic",
      "Taiwan, Province of China",
      "Tajikistan",
      "Tanzania, United Republic of",
      "Thailand",
      "Timor-Leste",
      "Togo",
      "Tokelau",
      "Tonga",
      "Trinidad and Tobago",
      "Tunisia",
      "Turkey",
      "Turkmenistan",
      "Turks and Caicos Islands",
      "Tuvalu",
      "Uganda",
      "Ukraine",
      "United Arab Emirates",
      "United Kingdom",
      "United States Minor Outlying Islands",
      "Uruguay",
      "Uzbekistan",
      "Vanuatu",
      "Venezuela",
      "Viet Nam",
      "Virgin Islands, British",
      "Virgin Islands, U.S.",
      "Wallis and Futuna",
      "Western Sahara",
      "Yemen",
      "Zambia",
      "Zimbabwe"
    ]
  end

  def suffixes
    [
      "Mr.",
      "Ms.",
      "Mrs."
    ]
  end

end

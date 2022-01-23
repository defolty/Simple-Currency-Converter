//
//  ConvertCurrency.swift
//  Converter
//
//  Created by Nikita Nesporov on 20.12.2021.
//

import Foundation

struct ConvertCurrensy: Codable {
    var baseCurrencyCode: String
    let baseCurrencyName: String
    var amount: String
    let updatedDate: String
    var rates: [String: Rates]?
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case status,amount,rates
        case baseCurrencyCode = "base_currency_code"
        case baseCurrencyName = "base_currency_name"
        case updatedDate = "updated_date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        baseCurrencyCode = try container.decode(String.self, forKey: .baseCurrencyCode)
        baseCurrencyName = try container.decode(String.self, forKey: .baseCurrencyName)
        updatedDate = try container.decode(String.self, forKey: .updatedDate)
        status = try container.decode(String.self, forKey: .status)
        amount = try container.decode(String.self, forKey: .amount)
        rates = try? container.decode([String: Rates].self, forKey: .rates)
    }
}

struct Rates: Codable {
    var currency_name: String?
    var rate: String?
    var rate_for_amount: String?
}
 
struct DataCurrency: Codable {
    let currencies : [String: String]
}


/*
var currencies: Array = [
   "STN", "XAG", "XAU", "PLN", "UGX", "GGP", "MWK", "NAD", "ALL", "BHD",
   "JEP", "BWP", "MRU", "BMD", "MNT", "FKP", "PYG", "AUD", "KYD", "RWF",
   "WST", "SHP", "SOS", "SSP", "BIF", "SEK", "CUC", "BTN", "MOP", "XDR",
   "IMP", "INR", "BYN", "BOB", "SRD", "GEL", "ZWL", "EUR", "BBD", "RSD",
   "SDG", "VND", "VES", "ZMW", "KGS", "HUF", "BND", "BAM", "CVE", "BGN",
   "NOK", "BRL", "JPY", "HRK", "HKD", "ISK", "IDR", "KRW", "KHR", "XAF",
   "CHF", "MXN", "PHP", "RON", "RUB", "SGD", "AED", "KWD", "CAD", "PKR",
   "CLP", "CNY", "COP", "AOA", "KMF", "CRC", "CUP", "GNF", "NZD", "EGP",
   "DJF", "ANG", "DOP", "JOD", "AZN", "SVC", "NGN", "ERN", "SZL", "DKK",
   "ETB", "FJD", "XPF", "GMD", "AFN", "GHS", "GIP", "GTQ", "HNL", "GYD",
   "HTG", "XCD", "GBP", "AMD", "IRR", "JMD", "IQD", "KZT", "KES", "ILS",
   "LYD", "LSL", "LBP", "LRD", "AWG", "MKD", "LAK", "MGA", "ZAR", "MDL",
   "MVR", "MUR", "MMK", "MAD", "XOF", "MZN", "MYR", "OMR", "NIO", "NPR",
   "PAB", "PGK", "PEN", "ARS", "SAR", "QAR", "SCR", "SLL", "LKR", "SBD",
   "VUV", "USD", "DZD", "BDT", "BSD", "BZD", "CDF", "UAH", "YER", "TMT",
   "UZS", "UYU", "CZK", "SYP", "TJS", "TWD", "TZS", "TOP", "TTD", "THB",
   "TRY", "TND"
]

var valutesTwo = ["LRD": "Liberian dollar", "XPF": "CFP franc", "PGK": "Papua New Guinean kina", "PEN": "Peruvian sol", "BND": "Brunei dollar",
                 "AMD": "Armenian dram", "CRC": "Costa Rican colón", "CNY": "Renminbi", "MYR": "Malaysian ringgit", "MDL": "Moldovan leu",
                 "SCR": "Seychellois rupee", "GYD": "Guyanese dollar", "CAD": "Canadian dollar", "WST": "Samoan tālā", "XAU": "Gold (troy ounce)",
                 "XDR": "Special drawing rights", "LBP": "Lebanese pound", "TWD": "New Taiwan dollar", "MUR": "Mauritian rupee",
                 "BYN": "Belarusian ruble", "BSD": "Bahamian dollar", "ANG": "Netherlands Antillean guilder", "UYU": "Uruguayan peso",
                 "CUP": "Cuban peso", "BTN": "Bhutanese ngultrum", "PKR": "Pakistani rupee", "STN": "São Tomé and Príncipe dobra",
                 "PAB": "Panamanian balboa", "KGS": "Kyrgyzstani som", "BGN": "Bulgarian lev", "TOP": "Tongan paʻanga", "MNT": "Mongolian tögrög",
                 "SOS": "Somali shilling", "KHR": "Cambodian riel", "BHD": "Bahraini dinar", "THB": "Thai baht", "BRL": "Brazilian real",
                 "AOA": "Angolan kwanza", "DKK": "Danish krone", "TTD": "Trinidad and Tobago dollar", "GHS": "Ghanaian cedi",
                 "TZS": "Tanzanian shilling", "ETB": "Ethiopian birr", "RUB": "Russian ruble", "GBP": "Pound sterling", "FJD": "Fijian dollar",
                 "GGP": "Guernsey pound", "MRU": "Mauritanian ouguiya", "HTG": "Haitian gourde", "AUD": "Australian dollar",
                 "MVR": "Maldivian rufiyaa", "KZT": "Kazakhstani tenge", "FKP": "Falkland Islands pound", "PHP": "Philippine peso",
                 "TRY": "Turkish lira", "OMR": "Omani rial", "BWP": "Botswana pula", "HRK": "Croatian kuna", "AZN": "Azerbaijani manat",
                 "BDT": "Bangladeshi taka", "BAM": "Bosnia and Herzegovina convertible mark", "IMP": "Manx pound", "AFN": "Afghan afghani",
                 "CZK": "Czech koruna", "NGN": "Nigerian naira", "ZWL": "Zimbabwean dollar", "IQD": "Iraqi dinar", "GNF": "Guinean franc",
                 "KYD": "Cayman Islands dollar", "AED": "United Arab Emirates dirham", "ZMW": "Zambian kwacha", "HUF": "Hungarian forint",
                 "QAR": "Qatari riyal", "YER": "Yemeni rial", "CLP": "Chilean peso", "LKR": "Sri Lankan rupee", "GEL": "Georgian lari",
                 "SDG": "Sudanese pound", "USD": "United States dollar", "MXN": "Mexican peso", "KMF": "Comorian franc", "ISK": "Icelandic króna",
                 "MWK": "Malawian kwacha", "NIO": "Nicaraguan córdoba", "EUR": "Euro", "XAG": "Silver (troy ounce)", "MAD": "Moroccan dirham",
                 "SYP": "Syrian pound", "MOP": "Macanese pataca", "MGA": "Malagasy ariary", "XOF": "West African CFA franc",
                 "VND": "Vietnamese đồng", "ZAR": "South African rand", "SEK": "Swedish krona", "GIP": "Gibraltar pound",
                 "UZS": "Uzbekistani soʻm", "MMK": "Burmese kyat", "HNL": "Honduran lempira", "DOP": "Dominican peso", "ALL": "Albanian lek",
                 "RSD": "Serbian dinar", "KWD": "Kuwaiti dinar", "LSL": "Lesotho loti", "SLL": "Sierra Leonean leone", "ERN": "Eritrean nakfa",
                 "JPY": "Japanese yen", "IRR": "Iranian rial", "BIF": "Burundian franc", "SVC": "Salvadoran colón", "KRW": "South Korean won",
                 "SGD": "Singapore dollar", "JOD": "Jordanian dinar", "COP": "Colombian peso", "PYG": "Paraguayan guaraní",
                 "DZD": "Algerian dinar", "SHP": "Saint Helena pound", "JEP": "Jersey pound", "JMD": "Jamaican dollar",
                 "VUV": "Vanuatu vatu", "XCD": "Eastern Caribbean dollar", "IDR": "Indonesian rupiah", "SBD": "Solomon Islands dollar",
                 "CHF": "Swiss franc", "BBD": "Barbadian dollar", "BOB": "Bolivian boliviano", "CVE": "Cape Verdean escudo",
                 "UAH": "Ukrainian hryvnia", "KES": "Kenyan shilling", "NAD": "Namibian dollar", "TND": "Tunisian dinar",
                 "SAR": "Saudi riyal", "SZL": "Swazi lilangeni", "AWG": "Aruban florin", "LYD": "Libyan dinar", "NPR": "Nepalese rupee",
                 "MKD": "Macedonian denar", "SRD": "Surinamese dollar", "BMD": "Bermudian dollar", "SSP": "South Sudanese pound",
                 "EGP": "Egyptian pound", "TJS": "Tajikistani somoni", "HKD": "Hong Kong dollar", "BZD": "Belize dollar", "LAK": "Lao kip",
                 "GTQ": "Guatemalan quetzal", "RON": "Romanian leu", "CUC": "Cuban convertible peso", "ILS": "Israeli new shekel",
                 "DJF": "Djiboutian franc", "TMT": "Turkmenistan manat", "NZD": "New Zealand dollar", "UGX": "Ugandan shilling",
                 "NOK": "Norwegian krone", "GMD": "Gambian dalasi", "RWF": "Rwandan franc", "XAF": "Central African CFA franc",
                 "PLN": "Polish złoty", "MZN": "Mozambican metical", "CDF": "Congolese franc", "VES": "Venezuelan bolívar",
                 "INR": "Indian rupee", "ARS": "Argentine peso"]
*/
/*
let STN: String?
let XAG: String?
let XAU: String?
let PLN: String?
let UGX: String?
let GGP: String?
let MWK: String?
let NAD: String?
let ALL: String?
let BHD: String?
let JEP: String?
let BWP: String?
let MRU: String?
let BMD: String?
let MNT: String?
let FKP: String?
let PYG: String?
let AUD: String?
let KYD: String?
let RWF: String?
let WST: String?
let SHP: String?
let SOS: String?
let SSP: String?
let BIF: String?
let SEK: String?
let CUC: String?
let BTN: String?
let MOP: String?
let XDR: String?
let IMP: String?
let INR: String?
let BYN: String?
let BOB: String?
let SRD: String?
let GEL: String?
let ZWL: String?
let EUR: String?
let BBD: String?
let RSD: String?
let SDG: String?
let VND: String?
let VES: String?
let ZMW: String?
let KGS: String?
let HUF: String?
let BND: String?
let BAM: String?
let CVE: String?
let BGN: String?
let NOK: String?
let BRL: String?
let JPY: String?
let HRK: String?
let HKD: String?
let ISK: String?
let IDR: String?
let KRW: String?
let KHR: String?
let XAF: String?
let CHF: String?
let MXN: String?
let PHP: String?
let RON: String?
let RUB: String?
let SGD: String?
let AED: String?
let KWD: String?
let CAD: String?
let PKR: String?
let CLP: String?
let CNY: String?
let COP: String?
let AOA: String?
let KMF: String?
let CRC: String?
let CUP: String?
let GNF: String?
let NZD: String?
let EGP: String?
let DJF: String?
let ANG: String?
let DOP: String?
let JOD: String?
let AZN: String?
let SVC: String?
let NGN: String?
let ERN: String?
let SZL: String?
let DKK: String?
let ETB: String?
let FJD: String?
let XPF: String?
let GMD: String?
let AFN: String?
let GHS: String?
let GIP: String?
let GTQ: String?
let HNL: String?
let GYD: String?
let HTG: String?
let XCD: String?
let GBP: String?
let AMD: String?
let IRR: String?
let JMD: String?
let IQD: String?
let KZT: String?
let KES: String?
let ILS: String?
let LYD: String?
let LSL: String?
let LBP: String?
let LRD: String?
let AWG: String?
let MKD: String?
let LAK: String?
let MGA: String?
let ZAR: String?
let MDL: String?
let MVR: String?
let MUR: String?
let MMK: String?
let MAD: String?
let XOF: String?
let MZN: String?
let MYR: String?
let OMR: String?
let NIO: String?
let NPR: String?
let PAB: String?
let PGK: String?
let PEN: String?
let ARS: String?
let SAR: String?
let QAR: String?
let SCR: String?
let SLL: String?
let LKR: String?
let SBD: String?
let VUV: String?
let USD: String?
let DZD: String?
let BDT: String?
let BSD: String?
let BZD: String?
let CDF: String?
let UAH: String?
let YER: String?
let TMT: String?
let UZS: String?
let UYU: String?
let CZK: String?
let SYP: String?
let TJS: String?
let TWD: String?
let TZS: String?
let TOP: String?
let TTD: String?
let THB: String?
let TRY: String?
let TND: String?
*/

/* хлам, на резерв
 https://free.currconv.com/api/v7/convert?q=USD_PHP&compact=ultra&apiKey=14876e481985d202f496
 {"USD_PHP":49.849499}
 JSON
    USD_PHP : 46.211
    PHP_USD : 0.02163987
  
 https://free.currconv.com/api/v7/currencies?apiKey=14876e481985d202f496
 *** огромный набор символов ***
 JSON
    results
        ALL
            currencyName : "Albanian Lek"
            currencySymbol : "Lek"
            id : "ALL"
        etc...
  
 https://free.currconv.com/api/v7/countries?apiKey=14876e481985d202f496
 *** огромный набор символов ***
 JSON
    results
        AF
            alpha3 : "AFG"
            currencyId : "AFN"
            currencyName : "Afghan afghani"
            currencySymbol : "؋"
            id : "AF"
            name : "Afghanistan"
        etc...
 
 https://free.currconv.com/others/usage?apiKey=14876e481985d202f496
 {"timestamp":"2021-12-20T15:53:38.334Z","usage":3}
 JSON
    timestamp : "2021-12-20T15:53:38.334Z"
    usage : 3
 */

/*
 var flag: String {
     switch currencySymbol {
     case "AED":
         return "🇦🇪"
     case "AFN":
         return "🇦🇫"
     case "ALL":
         return "🇦🇱"
     case "AMD":
         return "🇦🇲"
     case "ANG":
         return "🇨🇼"
     case "AOA":
         return "🇦🇴"
     case "ARS":
         return "🇦🇷"
     case "AUD":
         return "🇦🇺"
     case "AWG":
         return "🇦🇼"
     case "AZN":
         return "🇦🇿"
     case "BAM":
         return "🇧🇦"
     case "BBD":
         return "🇧🇧"
     case "BDT":
         return "🇧🇩"
     case "BGN":
         return "🇧🇬"
     case "BHD":
         return "🇧🇭"
     case "BIF":
         return "🇧🇮"
     case "BMD":
         return "🇧🇲"
     case "BND":
         return "🇧🇳"
     case "BOB":
         return "🇧🇴"
     case "BRL":
         return "🇧🇷"
     case "BSD":
         return "🇧🇸"
     case "BTC":
         return "🟡"
     case "BTN":
         return "🇧🇹"
     case "BWP":
         return "🇧🇼"
     case "BYN":
         return "🇧🇾"
     case "BZD":
         return "🇧🇿"
     case "CAD":
         return "🇨🇦"
     case "CDF":
         return "🇨🇩"
     case "CHF":
         return "🇨🇭"
     case "CLF":
         return "🇨🇱"
     case "CLP":
         return "🇨🇱"
     case "CNH":
         return "🇨🇳"
     case "CNY":
         return "🇨🇳"
     case "COP":
         return "🇨🇴"
     case "CRC":
         return "🇨🇷"
     case "CUC":
         return "🇨🇺"
     case "CUP":
         return "🇨🇺"
     case "CVE":
         return "🇨🇻"
     case "CZK":
         return "🇨🇿"
     case "DJF":
         return "🇩🇯"
     case "DKK":
         return "🇩🇰"
     case "DOP":
         return "🇩🇴"
     case "DZD":
         return "🇩🇿"
     case "EGP":
         return "🇪🇬"
     case "ERN":
         return "🇪🇷"
     case "ETB":
         return "🇪🇹"
     case "EUR":
         return "🇪🇺"
     case "FJD":
         return "🇫🇯"
     case "FKP":
         return "🇫🇰"
     case "GBP":
         return "🇬🇧"
     case "GEL":
         return "🇬🇪"
     case "GGP":
         return "🇬🇬"
     case "GHS":
         return "🇬🇭"
     case "GIP":
         return "🇬🇮"
     case "GMD":
         return "🇬🇲"
     case "GNF":
         return "🇬🇳"
     case "GTQ":
         return "🇬🇹"
     case "GYD":
         return "🇬🇾"
     case "HKD":
         return "🇨🇳"
     case "HNL":
         return "🇭🇳"
     case "HRK":
         return "🇭🇷"
     case "HTG":
         return "🇭🇹"
     case "HUF":
         return "🇭🇺"
     case "IDR":
         return "🇮🇩"
     case "ILS":
         return "🇮🇱"
     case "IMP":
         return "🇮🇲"
     case "INR":
         return "🇮🇳"
     case "IQD":
         return "🇮🇶"
     case "IRR":
         return "🇮🇷"
     case "ISK":
         return "🇮🇸"
     case "JEP":
         return "🇯🇪"
     case "JMD":
         return "🇯🇲"
     case "JOD":
         return "🇯🇴"
     case "JPY":
         return "🇯🇵"
     case "KES":
         return "🇰🇪"
     case "KGS":
         return "🇰🇬"
     case "KHR":
         return "🇰🇭"
     case "KMF":
         return "🇰🇲"
     case "KPW":
         return "🇰🇵"
     case "KRW":
         return "🇰🇷"
     case "KWD":
         return "🇰🇼"
     case "KYD":
         return "🇰🇾"
     case "KZT":
         return "🇰🇿"
     case "LAK":
         return "🇱🇦"
     case "LBP":
         return "🇱🇧"
     case "LKR":
         return "🇱🇰"
     case "LRD":
         return "🇱🇷"
     case "LSL":
         return "🇱🇸"
     case "LYD":
         return "🇱🇾"
     case "MAD":
         return "🇲🇦"
     case "MDL":
         return "🇲🇩"
     case "MGA":
         return "🇲🇬"
     case "MKD":
         return "🇲🇰"
     case "MMK":
         return "🇲🇲"
     case "MNT":
         return "🇲🇳"
     case "MOP":
         return "🇲🇴"
     case "MRO":
         return "🇲🇷"
     case "MRU":
         return "🇲🇷"
     case "MUR":
         return "🇲🇷"
     case "MVR":
         return "🇲🇻"
     case "MWK":
         return "🇲🇼"
     case "MXN":
         return "🇲🇽"
     case "MYR":
         return "🇲🇾"
     case "MZN":
         return "🇲🇿"
     case "NAD":
         return "🇳🇦"
     case "NGN":
         return "🇳🇬"
     case "NIO":
         return "🇳🇮"
     case "NOK":
         return "🇳🇴"
     case "NPR":
         return "🇳🇵"
     case "NZD":
         return "🇳🇿"
     case "OMR":
         return "🇴🇲"
     case "PAB":
         return "🇵🇦"
     case "PEN":
         return "🇵🇪"
     case "PGK":
         return "🇵🇬"
     case "PHP":
         return "🇵🇭"
     case "PKR":
         return "🇵🇰"
     case "PLN":
         return "🇵🇱"
     case "PYG":
         return "🇵🇾"
     case "QAR":
         return "🇶🇦"
     case "RON":
         return "🇷🇴"
     case "RSD":
         return "🇷🇸"
     case "RUB":
         return "🇷🇺"
     case "RWF":
         return "🇷🇼"
     case "SAR":
         return "🇸🇦"
     case "SBD":
         return "🇸🇧"
     case "SCR":
         return "🇸🇨"
     case "SDG":
         return "🇸🇩"
     case "SEK":
         return "🇸🇪"
     case "SGD":
         return "🇸🇬"
     case "SHP":
         return "🇸🇭"
     case "SLL":
         return "🇸🇱"
     case "SOS":
         return "🇸🇴"
     case "SRD":
         return "🇸🇷"
     case "SSP":
         return "🇸🇸"
     case "STD":
         return "🇸🇹"
     case "STN":
         return "🇸🇹"
     case "SVC":
         return "🇸🇻"
     case "SYP":
         return "🇸🇾"
     case "SZL":
         return "🇸🇿"
     case "THB":
         return "🇹🇭"
     case "TJS":
         return "🇹🇯"
     case "TMT":
         return "🇹🇲"
     case "TND":
         return "🇹🇳"
     case "TOP":
         return "🇹🇴"
     case "TRY":
         return "🇹🇷"
     case "TTD":
         return "🇹🇹"
     case "TWD":
         return "🇹🇼"
     case "TZS":
         return "🇹🇿"
     case "UAH":
         return "🇺🇦"
     case "UGX":
         return "🇺🇬"
     case "USD":
         return "🇺🇸"
     case "UYU":
         return "🇺🇾"
     case "UZS":
         return "🇺🇿"
     case "VEF":
         return "🇻🇪"
     case "VES":
         return "🇻🇪"
     case "VND":
         return "🇻🇳"
     case "VUV":
         return "🇻🇺"
     case "WST":
         return "🇼🇸"
     case "XAF": //
         return "🇨🇫"
     case "XAG":
         return "🥈"
     case "XAU":
         return "🥇"
     case "XCD": //
         return "🇦🇬"
     case "XDR":
         return "📜"
     case "XOF": //
         return "🇸🇳"
     case "XPD":
         return "⚪️"
     case "XPF": //
         return "🇵🇫"
     case "XPT":
         return "⚪️"
     case "YER":
         return "🇾🇪"
     case "ZAR":
         return "🇿🇦"
     case "ZMW":
         return "🇿🇲"
     case "ZWL":
         return "🇿🇼"
     default:
         return ""
     }
 }
 */
  

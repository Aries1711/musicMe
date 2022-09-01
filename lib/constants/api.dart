//connection API server

// ignore_for_file: constant_identifier_names

const APP_ENV = "PROD";
const API_URL_DEV = "staging-itunes.apple.com";
const API_URL_HTTPS_DEV = "https://staging-itunes.apple.com";
const API_URL_PROD = "itunes.apple.com";
const API_URL_HTTPS_PROD = "https://itunes.apple.com";
Map headers = <String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
  'X-Api-Key': 'secret string',
  'Accept': 'application/json',
};

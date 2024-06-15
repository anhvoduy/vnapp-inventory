const axios = require('axios');

const AWS_MERCHANT_URI = 'https://zqprp1axd7.execute-api.us-east-1.amazonaws.com';

const api = axios.create({
  baseURL: AWS_MERCHANT_URI
});

const merchantService = function () {
};

merchantService.getCrawlStatus = async () => {
  var uri = `${AWS_MERCHANT_URI}/api/crawl_status`;  
  return api.get(uri)
    .then((res) => {
      let { data } = res;
      return data;
    })
    .catch((error) => {
      if (error instanceof Error) {
        return { error };
      }
      return error.json().then((resJson) => {
        return {
          error: new Error(resJson.message),
        }
      });
  });
}

module.exports = merchantService;
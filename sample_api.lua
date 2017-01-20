--#ENDPOINT GET /createSocical
User.deleteSocial({consumer="Google"})
return User.createSocial({
  consumer="Google",
  client_id="561085908998-3lhf228ctb67qqn7pt3pocc07451t4r3.apps.googleusercontent.com",
  client_secret="xDy2HyUyY4fZykzzLpY0iDVD",
  scope={"profile","email"},
  redirect="https://ivan-dontdelete.apps.exosite-staging.io/social/handle/Google/"
  })

--#ENDPOINT GET /social/handle/{consumer}
results, err = to_json(request.parameters)
resultd, err = from_json(results)
local tokenstr = User.getSocialToken(resultd)
response.message = User.socialRequest({consumer=request.parameters.consumer, token=tokenstr})

--#ENDPOINT GET /social/handle/{consumer}/loginurl
response.headers["location"] = User.getSocialLoginUrl({consumer=request.parameters.consumer})
response.code = 303
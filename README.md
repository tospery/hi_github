1. oauth接口
https://github.com/login/oauth/access_token?client_id=dfb24ab8629d8f2a8a93&client_secret=4ac0b4d8bfd346e82620eb38c0df7418269bc6b8&code=800dc51c9a8e65884a3f


hihttp->hinet

access_token=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&scope=gist%2Cnotifications%2Cread%3Aorg%2Crepo%2Cuser%2Cworkflow&token_type=bearer


        id              <- map["id"]
        accessToken     <- map["access_token"]
        tokenType       <- map["token_type"]
        scope           <- map["scope"]

access_token=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&scope=gist%2Cnotifications%2Cread%3Aorg%2Crepo%2Cuser%2Cworkflow&token_type=bearer


{
    "error": "bad_verification_code",
    "error_description": "The code passed is incorrect or expired.",
    "error_uri": "https://docs.github.com/apps/managing-oauth-apps/troubleshooting-oauth-app-access-token-request-errors/#bad-verification-code"
}

{
    "access_token": "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",
    "token_type": "bearer",
    "scope": "gist,notifications,read:org,repo,user,workflow"
}

{
    "login": "tospery",
    "id": 3716286,
    "node_id": "MDQ6VXNlcjM3MTYyODY=",
    "avatar_url": "https://avatars.githubusercontent.com/u/3716286?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/tospery",
    "html_url": "https://github.com/tospery",
    "followers_url": "https://api.github.com/users/tospery/followers",
    "following_url": "https://api.github.com/users/tospery/following{/other_user}",
    "gists_url": "https://api.github.com/users/tospery/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/tospery/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/tospery/subscriptions",
    "organizations_url": "https://api.github.com/users/tospery/orgs",
    "repos_url": "https://api.github.com/users/tospery/repos",
    "events_url": "https://api.github.com/users/tospery/events{/privacy}",
    "received_events_url": "https://api.github.com/users/tospery/received_events",
    "type": "User",
    "site_admin": false,
    "name": "杨建祥",
    "company": "自由职业者",
    "blog": "https://blog.csdn.net/tospery",
    "location": "成都",
    "email": "tospery@gmail.com",
    "hireable": null,
    "bio": "iOS Coder",
    "twitter_username": null,
    "public_repos": 86,
    "public_gists": 0,
    "followers": 5,
    "following": 1,
    "created_at": "2013-02-27T12:44:24Z",
    "updated_at": "2022-07-28T08:51:01Z",
    "private_gists": 0,
    "total_private_repos": 49,
    "owned_private_repos": 49,
    "disk_usage": 4120399,
    "collaborators": 0,
    "two_factor_authentication": false,
    "plan": {
        "name": "free",
        "space": 976562499,
        "collaborators": 0,
        "private_repos": 10000
    }
}


flutter: code 71eb84d6f35d5708ffdc
flutter: 请求url：https://github.com/login/oauth/access_token?client_id=dfb24ab8629d8f2a8a93&client_secret=4ac0b4d8bfd346e82620eb38c0df7418269bc6b8&code=71eb84d6f35d5708ffdc POST
flutter: 请求头: {content-type: application/json; charset=utf-8}
flutter: 返回参数: access_token=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&scope=gist%2Cnotifications%2Cread%3Aorg%2Crepo%2Cuser%2Cworkflow&token_type=bearer
flutter: access_token: Instance of 'ResultData'
flutter: 返回参数: {"login":"tospery","id":3716286,"node_id":"MDQ6VXNlcjM3MTYyODY=","avatar_url":"https://avatars.githubusercontent.com/u/3716286?v=4","gravatar_id":"","url":"https://api.github.com/users/tospery","html_url":"https://github.com/tospery","followers_url":"https://api.github.com/users/tospery/followers","following_url":"https://api.github.com/users/tospery/following{/other_user}","gists_url":"https://api.github.com/users/tospery/gists{/gist_id}","starred_url":"https://api.github.com/users/tospery/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/tospery/subscriptions","organizations_url":"https://api.github.com/users/tospery/orgs","repos_url":"https://api.github.com/users/tospery/repos","events_url":"https://api.github.com/users/tospery/events{/privacy}","received_events_url":"https://api.github.com/users/tospery/received_events","type":"User","site_admin":false,"name":"杨建祥","company":"自由职业者","blog":"https://blog.csdn.net/tospery","location":"成都","email":"tospery@gmail.com","hireable":null,"bio":"iOS Coder","twitter_username":null,"public_repos":87,"public_gists":0,"followers":5,"following":1,"created_at":"2013-02-27T12:44:24Z","updated_at":"2022-08-04T08:48:18Z","private_gists":0,"total_private_repos":48,"owned_private_repos":48,"disk_usage":4120137,"collaborators":0,"two_factor_authentication":false,"plan":{"name":"free","space":976562499,"collaborators":0,"private_repos":10000}}
flutter: net userinfo: Instance of 'ResultData'}
flutter: 请求url：https://api.github.com/users/tospery/starred?sort=updated&per_page=1 GET
flutter: 请求头: {Authorization: token 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}
flutter: 返回参数: {"login":"tospery","id":3716286,"
flutter: net userinfo: Instance of 'ResultData'}
flutter: 请求url：https://api.github.com/users/tospery/starred?sort=updated&per_page=1 GET
flutter: 请求头: {Authorization: token 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}
flutter: 返回参数: [{id: 23013268, node_id: MDEwOlJlcG9zaXRvcnkyMzAxMzI2OA==, name: Moya, full_name: Moya/Moya, private: false, owner: {login: Moya, id: 13662162, node_id: MDEyOk9yZ2FuaXphdGlvbjEzNjYyMTYy
flutter: user result true
flutter: Instance of 'User'
flutter: access_token=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&scope=gist%2Cnotifications%2Cread%3Aorg%2Crepo%2Cuser%2Cworkflow&token_type=bearer
flutter: *********** UserInfoMiddleware ***********
flutter: _updateLoaded
flutter: 请求url：https://api.github.com/users/tospery/received_events?page=1&per_page=20 GET
flutter: 请求头: {Authorization: token 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}
flutter: 返回参数: [{id: 23379301166, type: WatchEvent, actor: {id
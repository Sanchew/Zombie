//
//  Api.swift
//  Example
//
//  Created by Sanchew on 2017/12/4.
//  Copyright © 2017年 sanchew. All rights reserved.
//

import Foundation

import Moya

let providerPlugin: [PluginType] = [
//    NetworkLoggerPlugin()
]

struct Api {
    static let githubProvider = MoyaProvider<GitHub>(plugins: providerPlugin)
    
    enum GitHub {
        case repos
    }
    
}


extension Api.GitHub: TargetType {
    
    public var baseURL: URL { return URL(string: "https://api.github.com")! }
    
    public var path: String {
        switch self {
        case .repos:
            return "/search/repositories"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    public var sampleData: Data {
        var res = ""
        switch self {
        case .repos:
            res = "{}"
        }
        return res.data(using: .utf8)!
    }
    
    public var task: Task {
        switch self {
        case .repos:
            return .requestParameters(parameters: ["q": "language:Swift", "sort": "stars"], encoding: URLEncoding.default)
        }
    }
    
}

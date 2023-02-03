//
//  CurrencyRouter.swift
//  CurrencyListApp
//


import Foundation


enum CurrencyRouter : APIConfiguration{
    
    case getCurrencyList(start: String, limit: String, convert: String)
    
    var host: String {
        
        switch self {
        case .getCurrencyList:
            return API.baseUrl
        }
    }
    
    var path: String {
        
        switch self {
        case .getCurrencyList:
            return API.getCurrencysList
        }
    }
    
    var method: String {
        
        switch self {
        case .getCurrencyList:
            return RequestMethod.GET.rawValue
        }
    }
    
    var parameters: [String: Any]?{
        
        switch self {
        case .getCurrencyList(let start, let limit, let convert):
            return GetCurrencyListRequest(start: start, limit: limit, convert: convert).dict
        }
    }
    
    var apiKey: String?{
        switch self {
        case .getCurrencyList:
            return "57eeb45f-e256-43ed-a75f-275104f05f0f"
        }
    }
    
    enum HTTPHeaderField: String {
        case accept = "Accept"
        case apiKey = "X-CMC_PRO_API_KEY"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
    
    func asURLRequest() throws -> URLRequest {
        
        
        
        guard var urlComponents = URLComponents(string: host) else{
            throw Errors.invalidHost
        }
        
        if method == RequestMethod.GET.rawValue{
            urlComponents.queryItems = []
            for (k, v) in parameters ?? [:]{
                urlComponents.queryItems?.append(URLQueryItem(name: k, value: v as? String))
            }
        }
        
        guard let url = urlComponents.url else{
            throw Errors.invalidHost
        }
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.accept.rawValue)
        urlRequest.setValue(apiKey, forHTTPHeaderField: HTTPHeaderField.apiKey.rawValue)
        
        // Parameters
        if method != RequestMethod.GET.rawValue, let param = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: param, options: [])
                
            } catch {
                throw Errors.invalidRequestParameters
            }
        }
        
        return urlRequest
    }
}

enum RequestMethod: String{
    case GET
    case POST
}

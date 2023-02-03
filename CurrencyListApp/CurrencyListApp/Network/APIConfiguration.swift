//
//  Router.swift
//  CurrencyListApp
//

import Foundation

protocol APIConfiguration {
    var host: String { get }
    var method: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    func asURLRequest() throws -> URLRequest
}

//
//  Horoscope APIClient.swift
//  2017_12_11 Horscope and default Data
//
//  Created by C4Q on 12/11/17.
//  Copyright © 2017 Quark. All rights reserved.
//
enum HTTPVerb: String {
    case GET
    case POST
}
import Foundation
struct HoroscopeAPIClient {
    private init() {}
    static let manager = HoroscopeAPIClient()
    func getHoroscop(from urlStr: String, completionHandler: @escaping (Horoscope) -> Void, errorHandler: @escaping (AppError) -> Void) {
        guard  let authenticatedRequest = buildAuthRequest(from: urlStr, httpVerb: .POST) else {
            errorHandler(AppError.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let horoscope = try JSONDecoder().decode(Horoscope.self, from: data)
                completionHandler(horoscope)
            }
            catch {
                errorHandler(.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: authenticatedRequest,
                                              completionHandler: completion,
                                              errorHandler: {print($0)})
        
    }
    private func buildAuthRequest(from urlStr: String, httpVerb: HTTPVerb) -> URLRequest? {
        guard let url = URL(string: urlStr) else { return nil }
        var request = URLRequest(url: url)
        let userName = ""
        let password = ""
        let authStr = buildAuthStr(userName: userName, password: password)
        request.addValue(authStr, forHTTPHeaderField: "Authorization")
        if httpVerb == .POST {
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return request
    }
    private func buildAuthStr(userName: String, password: String) -> String {
        let nameAndPassStr = "\(userName):\(password)"
        let nameAndPassData = nameAndPassStr.data(using: .utf8)!
        let authBase64Str = nameAndPassData.base64EncodedString()
        let authStr = "Basic \(authBase64Str)"
        return authStr
    }
    
}

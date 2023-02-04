//
//  APIRouter.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import Foundation
import Alamofire

protocol APIRouter: URLRequestConvertible {
    var method: HTTPMethod {get}
    var path: ServerPath {get}
    var parameters: APIParameters? {get}
    func send<T:Codable>(completion: @escaping (_ response: T?, _ errorType: APIErrors?) -> Void)
}

extension APIRouter {
    
    private var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    //MARK: - Create Request -
    func asURLRequest() throws -> URLRequest {
        
        //MARK: - URL -
        let url = try Server.baseURL.rawValue.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path.value))
        
        //MARK: - HTTTP Method -
        urlRequest.httpMethod = method.rawValue
        
        
        //MARK: - Parameters -
        if let parameters = parameters?.compactMapValues({$0}) {
            urlRequest = try encoding.encode(urlRequest, with: parameters)
            
        }
        
        //MARK: - All Request data
        print("\n\n====================================\n🚀🚀FULL REQUEST COMPONENETS::: \n\n URL:: \(urlRequest.url?.absoluteString ?? "No URL Found") \n---------------------------------\n Method:: \(urlRequest.httpMethod ?? "No httpMethod") \n---------------------------------\n Header:: \n\((urlRequest.allHTTPHeaderFields ?? [:]).json()) \n---------------------------------\n Parameters:: \n\((parameters ?? [:]).json()) \n\n====================================\n\n")
        
        return urlRequest
    }
    
    //MARK: - Send Request -
    func send<T:Codable> (completion: @escaping (_ response: T?, _ errorType: APIErrors?) -> Void) {
        
        AF.request(self).responseData { response in
            printApiResponse(response.data)
            
            self.handleResponse(response) { (response: T?, errorType) in
                if let response = response {
                    completion(response,nil)
                } else if let errorType = errorType {
                    completion(nil,errorType)
                }
            }
        }
        
    }
    
    //MARK: - Handel Request -
    private func handleResponse<T: Codable>(_ response: AFDataResponse<Data>, completion: @escaping (_ respons: T?, _ errorType: APIErrors?) -> Void) {
        switch response.result {
        case .failure(_):
            completion(nil, .connectionError)
        case .success(let value):
            do {
                
                let decoder = JSONDecoder()
                let valueObject  = try decoder.decode(T.self, from: value)
                completion(valueObject  ,nil)
                
            }  catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
                completion(nil, .canNotDecodeData)
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
                completion(nil, .canNotDecodeData)
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                completion(nil, .canNotDecodeData)
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
                completion(nil, .canNotDecodeData)
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                completion(nil, .canNotDecodeData)
            }
        }
    }
    
    //MARK: - Helper Methods -
    private func printApiResponse(_ responseData: Data?) {
        guard let responseData = responseData else {
            print("\n\n====================================\n⚡️⚡️RESPONSE IS::\n" ,responseData as Any, "\n====================================\n\n")
            return
        }
        
        if let object = try? JSONSerialization.jsonObject(with: responseData, options: []),
           let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys]), let JSONString = String(data: data, encoding: String.Encoding.utf8) {
            print("\n\n====================================\n⚡️⚡️RESPONSE IS::\n" ,JSONString, "\n====================================\n\n")
            return
        }
        print("\n\n====================================\n⚡️⚡️RESPONSE IS::\n" ,responseData, "\n====================================\n\n")
    }
    
}


//
//  APIClient.swift
//  APIClient
//
//  Created by Devel on 13/06/22.
//


import Foundation
import Alamofire

public class APIClient {

    private var baseUrl: String;
    private var license: String;
    
    
    public init(baseUrl: String, license: String) {
        
        self.baseUrl = baseUrl
        self.license = license
        
    }
    
    //InitSession
    public func initSession(
        installation: String,
        completionHandler: @escaping(Result<InitializationResponse,Error>) -> Void
    ){
        
        let url = self.baseUrl + Endpoints.INITIALIZATION.rawValue

        let params: Dictionary = [
            "License": self.license,
            "Installation": installation,
        ]

        let credential = URLCredential(user: "", password: "", persistence: .forSession );

        AF.request(url, method: .post, parameters: params).authenticate(with: credential).validate().responseDecodable(of: InitializationResponse.self) { response in
            guard let data = response.data else {
                
                completionHandler(.failure(response.error!))
                return
                
            }
            
            do{
                
                let res = try JSONDecoder().decode(InitializationResponse.self, from: data)
                completionHandler(.success(res))
                
            }catch let err {
                
                completionHandler(.failure(err))
            }
        }
    }
    
    //GetFiles
    public func getFiles(
        type: GetFilesOptions,
        completionHandler: @escaping(Result<GetFilesResponse,Error>) -> Void
    ){
        
        let url = self.baseUrl + Endpoints.GET_FILES.rawValue

        let params : Dictionary = ["Type": type.rawValue]

        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
     
        AF.request(url, method: .get, parameters: params, headers: headers).validate().responseDecodable(of: GetFilesResponse.self) { response in
            guard let data = response.data else {
                
                completionHandler(.failure(response.error!))
                return
                
            }
            
            do{
                
                let res = try JSONDecoder().decode(GetFilesResponse.self, from: data)
                completionHandler(.success(res))
                
            }catch let err {
                completionHandler(.failure(err))
            }
        }
    }
    
    //GetFile
    public func getFile(
        fileId: Int,
        completionHandler: @escaping(Result<GetFileResponse,Error>) -> Void
    ){
        
        let url = self.baseUrl + Endpoints.GET_FILE.rawValue

        let params : Dictionary = ["FileId": fileId]

        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
     
        AF.request(url, method: .get, parameters: params, headers: headers).validate().responseDecodable(of: GetFileResponse.self) { response in
            guard let data = response.data else {
                
                completionHandler(.failure(response.error!))
                return
                
            }
            
            do{
                
                let res = try JSONDecoder().decode(GetFileResponse.self, from: data)
                completionHandler(.success(res))
                
            }catch let err {
                completionHandler(.failure(err))
            }
        }
    }
    
    //RejectFile
    public func rejectFile(
        fileId: Int,
        comment: String?,
        completionHandler: @escaping(Result<RejectFileResponse,Error>) -> Void
    ){
        
        let url = self.baseUrl + Endpoints.REJECT_FILE.rawValue

        let params : Dictionary = ["FileId": fileId, "Comment": comment ?? ""] as [String : Any]

        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
     
        AF.request(url, method: .post, parameters: params, headers: headers).validate().responseDecodable(of: RejectFileResponse.self) { response in
            guard let data = response.data else {
                
                completionHandler(.failure(response.error!))
                return
                
            }
            
            do{
                
                let res = try JSONDecoder().decode(RejectFileResponse.self, from: data)
                completionHandler(.success(res))
                
            }catch let err {
                completionHandler(.failure(err))
            }
        }
    }
    
    //SignFile
    public func signFile(
        fileId: Int,
        completionHandler: @escaping(Result<SignFileResponse,Error>) -> Void
    ){
        
        let url = self.baseUrl + Endpoints.SIGN_FILE.rawValue

        let params : Dictionary = ["FileId": fileId]

        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
     
        AF.request(url, method: .post, parameters: params, headers: headers).validate().responseDecodable(of: SignFileResponse.self) { response in
            guard let data = response.data else {
                
                completionHandler(.failure(response.error!))
                return
                
            }
            
            do{
                
                let res = try JSONDecoder().decode(SignFileResponse.self, from: data)
                completionHandler(.success(res))
                
            }catch let err {
                completionHandler(.failure(err))
            }
        }
    }
    
    //SendFileEmail
    public func sendFileEmail(
        fileId: Int,
        email: String,
        completionHandler: @escaping(Result<SendFileEmailResponse,Error>) -> Void
    ){
        
        let url = self.baseUrl + Endpoints.SEND_FILE_EMAIL.rawValue

        let params : Dictionary = ["FileId": fileId, "Email": email] as [String : Any]

        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
     
        AF.request(url, method: .post, parameters: params, headers: headers).validate().responseDecodable(of: SendFileEmailResponse.self) { response in
            guard let data = response.data else {
                
                completionHandler(.failure(response.error!))
                return
                
            }
            
            do{
                
                let res = try JSONDecoder().decode(SendFileEmailResponse.self, from: data)
                completionHandler(.success(res))
                
            }catch let err {
                completionHandler(.failure(err))
            }
        }
    }
    
    //ValidateUser
    public func validateUser(
        installation: String,
        completionHandler: @escaping(Result<ValidateUserResponse,Error>) -> Void
    ){
        
        let url = self.baseUrl + Endpoints.SEND_FILE_EMAIL.rawValue

        let params : Dictionary = ["Installation": installation]

        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
     
        AF.request(url, method: .post, parameters: params, headers: headers).validate().responseDecodable(of: ValidateUserResponse.self) { response in
            guard let data = response.data else {
                
                completionHandler(.failure(response.error!))
                return
                
            }
            
            do{
                
                var res = try JSONDecoder().decode(ValidateUserResponse.self, from: data)
                switch res.userSignState {
                case "USER_NOT_EXIST":
                    res.userState = UserEnrollmentState.USER_NOT_EXIST

                case "USER_NOT_ENROLLED":
                    res.userState = UserEnrollmentState.USER_NOT_ENROLLED

                case "USER_EXPIRED_ENROLLMENT":
                    res.userState = UserEnrollmentState.USER_EXPIRED_ENROLLMENT
                    
                case "USER_ENROLLED":
                    res.userState = UserEnrollmentState.USER_ENROLLED
                case .none:
                    print("No se ha encontrado el estado del usuario")
                case .some(_):
                    print("Ha ocurrido un error al intentar parsear la respuesta")
                }
                
                completionHandler(.success(res))
                
            }catch let err {
                completionHandler(.failure(err))
            }
        }
    }
    
    
    //ValidateUser
    public func updateSign(
        sign: String,
        completionHandler: @escaping(Result<UpdateSignResponse,Error>) -> Void
    ){
        
        let url = self.baseUrl + Endpoints.SEND_FILE_EMAIL.rawValue

        let params : Dictionary = ["Sign": sign]

        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
     
        AF.request(url, method: .post, parameters: params, headers: headers).validate().responseDecodable(of: UpdateSignResponse.self) { response in
            guard let data = response.data else {
                
                completionHandler(.failure(response.error!))
                return
                
            }
            
            do{
                
                var res = try JSONDecoder().decode(UpdateSignResponse.self, from: data)
                switch res.signState {
                case "SIGN_UPDATED":
                    res.state = UpdateSignState.SIGN_UPDATED

                case "ERROR_UPDATING_SIGN":
                    res.state = UpdateSignState.ERROR_UPDATING_SIGN
                case .none:
                    print("No se ha encontrado respuesta del servidor")
                case .some(_):
                    print("Ha ocurrido un error al intentar parsear la respuesta")
                }
                
                completionHandler(.success(res))
                
            }catch let err {
                completionHandler(.failure(err))
            }
        }
    }

    
}


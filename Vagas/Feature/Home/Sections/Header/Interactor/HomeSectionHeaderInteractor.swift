//
//  HomeHeaderInteractor.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class HomeHeaderInteractor: HomeHeaderInteractorInput {
    
    // MARK: - VARIABLES -
    weak var output: HomeHeaderInteractorOutput?
    var service: HomeHeaderServiceInput
    
    // MARK: - CONSTRUCTOR -
    init(service: HomeHeaderServiceInput) {
        self.service = service
    }
    
    // MARK: - INPUT METHODS -
    func getProfile() {
        guard let auth: String = UserDefaultsHelper.getValueForKey(.auth) else { return }
        self.service.getProfile(authorization: auth) { (data) in
            do {
                let profile = try JSONDecoder().decode(ProfileEntity.self, from: data)
                if let token = profile.token {
                UserDefaultsHelper.setValueStringForKey(value: token, key: .token)
                }
                self.output?.handleSuccess(profile: profile)
            } catch {
                print("error scene")
            }
        }
    }
}

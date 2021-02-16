//
//  HomeInteractor.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInput {
    
    // MARK: - VARIABLES -
    weak var output: HomeInteractorOutput?
    var service: HomeServiceInput
    
    // MARK: - CONSTRUCTOR -
    init(service: HomeServiceInput) {
        self.service = service
    }
    
    // MARK: - INPUT METHODS -
    func getStarted() {
        self.getKeys()
    }
}

// MARK: - AUX METHODS -
extension HomeInteractor {
    private func getKeys() {
        self.service.getKeys() { (data) in
            do {
                let keys = try JSONDecoder().decode(KeyEntity.self, from: data)
                self.saveKeys(keys: keys)
                guard let auth = keys.auth else { return }
                self.fetchProfile(auth: auth)
            } catch {
                print("error scene")
            }
        }
    }
    
    private func fetchProfile(auth: String) {
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
    
    private func saveKeys(keys: KeyEntity) {
        guard let auth = keys.auth,
            let suggestion = keys.suggestion,
            let tips = keys.tips,
            let survey = keys.survey else { return }
        UserDefaultsHelper.setValueStringForKey(value: auth, key: .auth)
        UserDefaultsHelper.setValueStringForKey(value: suggestion, key: .suggestion)
        UserDefaultsHelper.setValueStringForKey(value: tips, key: .tips)
        UserDefaultsHelper.setValueStringForKey(value: survey, key: .survey)
    }
}

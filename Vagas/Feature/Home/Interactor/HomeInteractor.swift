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
    func getKeys() {
        self.service.getKeys() { (data) in
            do {
                let keys = try JSONDecoder().decode(KeyEntity.self, from: data)
                self.saveKeys(keys: keys)
                self.output?.handleFeedSuccess()
            } catch {
                print("error scene")
            }
        }
    }
    
    func getTips() {
        guard let tipsHeader: String = UserDefaultsHelper.getValueForKey(.tips) else { return }
        self.service.getTips(tipsHeader: tipsHeader) { (data) in
            do {
                let tips = try JSONDecoder().decode(Tips.self, from: data)
                
                self.output?.handleFeedSuccess()
            } catch {
                print("error scene")
            }
        }
    }
    
    func getProfile() {
        guard let auth: String = UserDefaultsHelper.getValueForKey(.auth) else { return }
        self.service.getProfile(authorization: auth) { (data) in
            do {
                let profile = try JSONDecoder().decode(ProfileEntity.self, from: data)
                if let token = profile.token {
                UserDefaultsHelper.setValueStringForKey(value: token, key: .token)
                }
                self.output?.handleFeedSuccess()
            } catch {
                print("error scene")
            }
        }
    }
    
    func getSuggestion() {
        guard let suggestion: String = UserDefaultsHelper.getValueForKey(.suggestion),
            let token = UserDefaultsHelper.getValueForKey(.token) else { return }
        self.service.getSuggestion(token: token, suggestionHeader: suggestion) { (data) in
            do {
                let sug = try JSONDecoder().decode(Suggestions.self, from: data)
                
                self.output?.handleFeedSuccess()
            } catch {
                print("error scene")
            }
        }
    }
}

// MARK: - AUX METHODS -
extension HomeInteractor {
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

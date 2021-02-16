//
//  HomeTipsSectionInteractor.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class HomeTipsInteractor: HomeTipsInteractorInput {
    
    // MARK: - VARIABLES -
    var output: HomeTipsInteractorOutput?
    var service: HomeTipsServiceInput
    
    // MARK: - CONSTRUCTOR -
    init(service: HomeTipsServiceInput) {
        self.service = service
    }
    
    // MARK: - INPUT METHODS -
    func getTips() {
        guard let tipsHeader: String = UserDefaultsHelper.getValueForKey(.tips) else { return }
        self.service.getTips(tipsHeader: tipsHeader) { (data) in
            do {
                let tips = try JSONDecoder().decode(Tips.self, from: data)
                self.handleOutput(tips: tips)
            } catch {
                print("error scene")
            }
        }
    }
}

// MARK: - AUX METHODS -
extension HomeTipsInteractor {
    private func handleOutput(tips: Tips) {
        guard tips.count > 0 else { self.output?.removeSection(); return }
        self.output?.handleSuccess(tips: tips)
    }
}

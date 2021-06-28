//
//  BloodBanksManager.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 28/06/2021.
//

import Foundation

class BloodBanksManager {
    
    var bloodBanksByLocation = [String: [String: [(String, String)]]]()
    
    init(bloodBanksResponse: BloodBanksResponse) {
        for bloodBank in bloodBanksResponse.bloodBanks {
            if self.bloodBanksByLocation[bloodBank.location.governorate] == nil {
                self.bloodBanksByLocation[bloodBank.location.governorate] = [String: [(String, String)]]()
            }
            if self.bloodBanksByLocation[bloodBank.location.governorate]![bloodBank.location.region] == nil {
                self.bloodBanksByLocation[bloodBank.location.governorate]![bloodBank.location.region] = [(String, String)]()
            }
            let bloodBankName = bloodBank.name
            let bloodBankID = bloodBank._id
            self.bloodBanksByLocation[bloodBank.location.governorate]![bloodBank.location.region]!.append((bloodBankName, bloodBankID))
        }
        dumpBloodBanksHierarchy()
    }
    
    func dumpBloodBanksHierarchy () {
        dump(bloodBanksByLocation)
    }
    
    func getGovernorates() -> [String] {
        return Array(bloodBanksByLocation.keys)
    }
    
    func getRegions(forGovernorate governorate: String) -> [String] {
        return Array(bloodBanksByLocation[governorate]!.keys)
    }
    
    func getBloodBanks(forGovernorate governorate: String, forCity city: String) -> [(String, String)] {
        return bloodBanksByLocation[governorate]![city]!
    }
}

//
//  ViewModel.swift
//  Firebase_DB_test
//
//  Created by Wojciech Zakroczymski on 13/11/2022.
//

import FirebaseCore
import FirebaseFirestore


class ViewModel: ObservableObject {
    
    @Published var dni = [Dzien]()
    
    init() {
        get_data()
    }
    
    func get_data() {
        let db = Firestore.firestore()
        db.collection("dni").getDocuments { snapshot, error in
            if error == nil && snapshot != nil {
                let dni = snapshot?.documents.map({ snp in
                    return Dzien(id: snp.documentID, dzien: snp["dzien"] as? String ?? "", lekcja1: snp["lekcja1"] as? String ?? "")
                })
                DispatchQueue.main.async {
                    self.dni = dni ?? [Dzien]()
                }
                
            }
        }
    }
    
}



struct Dzien: Identifiable {
    var id: String
    var dzien: String
    var lekcja1: String
}

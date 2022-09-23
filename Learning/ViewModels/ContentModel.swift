//
//  ContentModel.swift
//  Learning
//
//  Created by Semih Cetin on 21.09.2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    func getLocalData() {
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let decoder = JSONDecoder()
            
            do{
                let moduleData = try decoder.decode([Module].self, from: jsonData)
                
                self.modules = moduleData
            }
            catch {
                print(error)
            }
        }
        catch{
            print(error)
        }
        
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styledData = try Data(contentsOf: styleURL!)
            
            self.styleData = styledData
        }
        catch {
            print(error)
        }
    }
}

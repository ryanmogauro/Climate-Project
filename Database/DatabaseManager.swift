
//  DatabaseManager.swift
//  Climules
//
//  Created by Aidan Kwok on 11/28/24.
//Key files to investigate, SampleProject/Models and TaskListViewModel.swift - specifically addRandomTask(), follow doucmentaiton 

import OHMySQL


class DatabaseManager {
    
    static let shared = DatabaseManager()
    var coordinator: MySQLStoreCoordinator
    
    
    
    init() {
        let configuration = MySQLConfiguration(user: "root",
                                               password: "Shortshorts#7",
                                               serverName: "localhost",
                                               dbName: "Climate",
                                               port: 3306,
                                               socket: "/tmp/mysql.sock")
        coordinator = MySQLStoreCoordinator(configuration: configuration)
        coordinator.encoding = .UTF8MB4
        func reconnect() -> Bool {
            coordinator.disconnect()
            
            return coordinator.connect()
        }
        
        func connect() -> Bool {
            coordinator.encoding = .UTF8MB4
            
            let context = MySQLQueryContext()
            context.storeCoordinator = coordinator
            MySQLContainer.shared.mainQueryContext = context
            
            return coordinator.connect()
        }
        
    }
}

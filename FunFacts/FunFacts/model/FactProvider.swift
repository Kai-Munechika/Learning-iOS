//
//  FactProvider.swift
//  FunFacts
//
//  Created by Kai Munechika on 12/31/18.
//  Copyright © 2018 Kai Munechika. All rights reserved.
//

import GameKit

struct FactProvider {
    
    let facts = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
                 "Vivamus cursus metus fermentum nisi vestibulum pretium.", 
                 "Donec luctus dolor vitae luctus hendrerit.", 
                 "Curabitur eu metus vitae odio vehicula rutrum ultricies sagittis diam.", 
                 "Cras bibendum ante at erat pulvinar mollis. Sed est sapien, porttitor ut faucibus non, suscipit sed ex. Integer mollis sed mi in varius.", 
                 "Fusce eget egestas lectus. Suspendisse potenti. Morbi dolor libero, condimentum eu tincidunt at, dapibus et ante."
    ]
    
    func randomFact() -> String {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: facts.count)
        return facts[randomNumber]
    }
    
}

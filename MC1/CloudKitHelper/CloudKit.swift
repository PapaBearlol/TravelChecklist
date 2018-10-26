//
//  CloudKit.swift
//  MC1
//
//  Created by Antoni Santoso on 24/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import Foundation
import CloudKit
import UIKit



class CloudKit {
    
    func createNewStory(story: Story){
        let storyRecord = CKRecord(recordType: "UserData")
        
        storyRecord["title"] = story.title
        storyRecord["place"] = story.place
        storyRecord["date"] = story.date
        storyRecord["time"] = story.time
        savetoPublicDatabase(record: storyRecord)
    }
    
    func savetoPublicDatabase(record: CKRecord) {
        let container = CKContainer.default()
        let database = container.publicCloudDatabase
        
        database.save(record) { (newRecord, error) in
            if let err = error {
                print(err.localizedDescription)
            }
            if let r = newRecord{
                print(r)
            }
        }
        
    }
    func fetchStoryRecord() -> [Story] {
        let container = CKContainer.default()
        let database = container.publicCloudDatabase

        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "UserData", predicate: predicate)

        let result: [Story] = []
        database.perform(query, inZoneWith: nil) { (records, error) in
            if let err = error {
                print(err.localizedDescription)
            }
            if let fetchedRecords = records {
                print(fetchedRecords)
                fetchedRecords.forEach({(record) in
                    let story = self.decoreCKRecordToStory(record: record)
                    print(story)
                })

            }
        }
        return result
    }

    func decoreCKRecordToStory(record: CKRecord) -> Story? {
        guard let title1 = record["title"] as? String else{return nil}
        guard let place1 = record["place"] as? String else {return nil}
        guard let time1 = record["time"] as? String else{return nil}
        guard let date1 = record["date"] as? String else{return nil}
        
        let story = Story(title: title1, place: place1, time: time1, date: date1)
        
            return story
    }
}



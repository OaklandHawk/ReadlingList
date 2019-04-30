//
//  BookController.swift
//  Reading List
//
//  Created by Taylor Lyles on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController: Codable {
    
    private(set) var books: [Book] = []
    
    func create(title: String, reasonToRead: String, hasBeenRead: Bool) {
        let book = Book(title: title, reasonToRead: reasonToRead, hasBeenRead: hasBeenRead)
        books.append(book)
        saveToPersistentStore()
    }
    
//    func delete(title: String = "", reasonToRead: String = "", hasBeenRead: Bool) {
//        let book = Book(title: title, reasonToRead: reasonToRead, hasBeenRead: hasBeenRead)
//        books.append(book)
//        saveToPersistentStore()
//    }
    
        func delete(book: Book) {
            guard let index = books.firstIndex(of: book) else { return }
            
            books.remove(at: index)
            
            saveToPersistentStore()
     }
    
    func updateHasBeenRead(book: Book) {
        saveToPersistentStore()
    }
    
    func updatedTitleAndOrReasonToRead(book: Book) {
        
    }
    
    private var readBooks: [Book] {
        let beenRead = books.filter { $0.hasBeenRead == true }
        return beenRead
    }
    
    private var unReadBooks: [Book] {
        let notBeenRead = books.filter { $0.hasBeenRead == false }
        return notBeenRead
    }
    
    func saveToPersistentStore() {
        guard let url = readingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let booksData = try encoder.encode(books)
            try booksData.write(to: url)
        } catch {
            print("Error saving books: \(error)")
        }
        
    }
    
    func loadFromPersistentStore() {
        do {
            guard let url  = readingListURL else { return }
            let data = try Data(contentsOf: url)
            let decodedBooks = PropertyListDecoder()
            books = try decodedBooks.decode([Book].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
    }
    
    private var readingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("ReadingList.plist")
    }
    
}

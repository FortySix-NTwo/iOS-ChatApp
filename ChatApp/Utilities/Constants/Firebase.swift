//
//  Firebase.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import Firebase

let FIRE_STORE = Firestore.firestore()

let COLLECTION_MESSAGE = FIRE_STORE.collection("messages")

let COLLECTION_USER = FIRE_STORE.collection("users")

let AUTH = Auth.auth()

let UID = AUTH.currentUser?.uid

let STOREAGE = Storage.storage()


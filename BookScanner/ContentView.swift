//
//  ContentView.swift
//  BookScanner
//
//  Created by Andy on 2024-11-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var scanResult = ScanResult()  // 使用 StateObject 來跟踪掃描結果
    @State private var showScanner = false
    @State private var showConfirmation = false

    var body: some View {
        VStack {
            Spacer()
            
            Text("掃描書籍 ISBN 碼")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            Button(action: {
                // 開啟掃描器
                showScanner.toggle()
            }) {
                Text("掃描 ISBN")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            .sheet(isPresented: $showScanner) {
                ScannerView { result in
                    showScanner = false
                    DispatchQueue.main.async {
                        scanResult.isbnCode = result
                        if !result.isEmpty {
                            showConfirmation = true
                        }
                    }
                }
            }
            
            Spacer()
        }
        .sheet(isPresented: $showConfirmation) {
            ConfirmationView(isbn: scanResult.isbnCode, onRescan: {
                showConfirmation = false
                showScanner = true
            })
        }
//        .sheet(isPresented: $showConfirmation) {
//            ConfirmationView(isbn: scanResult.isbnCode)
//        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

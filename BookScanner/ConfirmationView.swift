//
//  ConfirmationView.swift
//  BookScanner
//
//  Created by Andy on 2024-11-17.
//
import SwiftUI

struct ConfirmationView: View {
    var isbn: String
    var onRescan: () -> Void  // 新增一個閉包來處理重新掃描的操作

    var body: some View {
        VStack {
            Text("掃描到的 ISBN 碼是:")
                .font(.title2)
                .padding()

            Text(isbn)
                .font(.title)
                .bold()
                .padding()

            HStack {
                Button(action: {
                    // 重新掃描的操作
                    onRescan()
                }) {
                    Text("重新掃描")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                }

                Spacer()

                Button(action: {
                    // 使用書籍搜尋連結
                    if let url = URL(string: "https://search.books.com.tw/search/query/key/\(isbn)/cat/BKA") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("搜尋書籍")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .onAppear {
            print("ConfirmationView appeared with ISBN: \(isbn)")
        }
    }
}

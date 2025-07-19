//
//  UserList.swift
//  Job Interview 2
//
//  Created by David Santiago Jamaica Galvis on 7/19/25.
//

import Foundation
import SwiftUI

struct UserListView: View {
    @EnvironmentObject var settings: SettingsModel
    @StateObject var fetcher = UserFetcher()

    var body: some View {
        NavigationView {
            List(fetcher.users) { user in
                VStack(alignment: .leading) {
                    HStack {
                        AsyncImage(url: URL(string: user.picture.large)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                        Text("\(user.name.first) \(user.name.last)")
                            .font(.headline)
                    }

                    if settings.showGender {
                        Text("Gender: \(user.gender ?? "")")
                    }

                    if settings.showLocation {
                        if let loc = user.location {
                            Text("Location: \(loc.city), \(loc.country)")
                        }
                    }

                    if settings.showEmail {
                        Text("Email: \(user.email ?? "")")
                    }

                    if settings.showLogin {
                        Text("Username: \(user.login?.username ?? "")")
                    }

                    if settings.showRegistered {
                        Text("Registered: \(user.registered?.date.prefix(10) ?? "")")
                    }

                    if settings.showDOB {
                        Text("DOB: \(user.dob?.date.prefix(10) ?? "") (Age: \(user.dob?.age ?? 0))")
                    }

                    if settings.showPhone {
                        Text("Phone: \(user.phone ?? "")")
                    }

                    if settings.showCell {
                        Text("Cell: \(user.cell ?? "")")
                    }

                    if settings.showID {
                        Text("ID: \(user.userID?.name ?? "") \(user.userID?.value ?? "")")
                    }

                    if settings.showNat {
                        Text("Nationality: \(user.nat ?? "")")
                    }
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Random Users")
            .onAppear {
                fetcher.fetchUsers(count: settings.numberOfUsers)
            }
        }
    }
}

//
//  ChooseDestinationView.swift
//  NavUI
//
//  Created by Jihan Alfiyyah Munajat on 23/07/23.
//

import SwiftUI

struct ChooseDestinationView: View {
    @ObservedObject var destinationViewModel: DestinationViewModel
    @State private var isShowExit = false

    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Tempat Populer")
                    .font(.headline)
                VStack(alignment: .leading){
                    ForEach(destinationViewModel.destinations, id: \.id) {dest in
                        Button {
                            isShowExit.toggle()
                        } label: {
                            DestinationOnly(photoPath: dest.photoPath, destinationName: dest.destinationName, destinationExit: dest.destinationExit)
                                .foregroundColor(.black)
                        }
//                        .sheet(isPresented: $isShowExit, content: {
//                            DestinationToExitOption(destination: dest, badgeType: <#T##Binding<String>#>, showModal: $isShowExit)
//                        })
                    }
                }
            
                
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.Background.surface)
                    .frame(width: .infinity, height: .infinity))
                
                Text("Pintu Keluar")
                    .font(.headline)
                    .padding(.top, 20)
                VStack(alignment: .leading){
                    ForEach(destinationViewModel.exitGates, id: \.id) {exit in
                        ExitOnly(name: exit.name, destination: exit.destination)
                    }
                }
//                .frame(width: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.Background.surface)
                    .frame(width: .infinity, height: .infinity))

                


                Spacer()
            }
            .ignoresSafeArea()
            .frame(width: .infinity)

            
        }
    }
}

struct ChooseDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseDestinationView(destinationViewModel: DestinationViewModel())
    }
}


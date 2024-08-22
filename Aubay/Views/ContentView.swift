//
//  ContentView.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PopulationViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.populationData) { data in
                NavigationLink(
                    destination: StatePopulationView(stateName: data.nation)
                ) {
                    NationPopulationView(populationData: data)
                }
            }
            .navigationTitle("Nation Population Data")
            .onAppear {
                viewModel.fetchNationPopulation()
            }
            .alert(item: $viewModel.errorMessage) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

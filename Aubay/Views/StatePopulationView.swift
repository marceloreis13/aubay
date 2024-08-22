//
//  StatePopulationView.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import SwiftUI

struct StatePopulationView: View {
    @StateObject private var viewModel = PopulationViewModel()
    var stateName: String?
    
    var body: some View {
        List(viewModel.statePopulationData) { data in
            VStack(alignment: .leading) {
                Text(data.state)
                    .font(.headline)
                Text("Year: \(data.year)")
                    .font(.subheadline)
                Text("Population: \(data.population)")
                    .font(.body)
            }
        }
        .navigationTitle(stateName ?? "State Population Data")
        .onAppear {
            viewModel.fetchStatePopulation()
        }
        .alert(item: $viewModel.errorMessage) { error in
            Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
        }
    }
}

struct StatePopulationView_Previews: PreviewProvider {
    static var previews: some View {
        StatePopulationView(stateName: "United States")
    }
}

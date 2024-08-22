//
//  NationPopulationView.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import SwiftUI

struct NationPopulationView: View {
    let populationData: NationPopulationData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(populationData.nation)
                .font(.headline)
            Text("Year: \(populationData.year)")
                .font(.subheadline)
            Text("Population: \(populationData.population)")
                .font(.body)
        }
    }
}

struct PopulationRowView_Previews: PreviewProvider {
    static var previews: some View {
        NationPopulationView(populationData: NationPopulationData(idNation: "01000US", nation: "United States", idYear: 2021, year: "2021", population: 331893745, slugNation: "united-states"))
    }
}

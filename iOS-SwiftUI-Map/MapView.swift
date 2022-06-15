//
//  MapView.swift
//  iOS-SwiftUI-Map
//
//  Created by Mostafa Davoodi on 6/14/22.
//

import SwiftUI
import MapKit

struct MapView: View {
	
	@EnvironmentObject var viewModel: LocationViewModel
	
	
	@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 49.29000357652808, longitude: -123.11073064797037), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
	
	private var pointsOfInterest = [
			AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.75773, longitude: -73.985708)),
			AnnotatedItem(name: "Flatiron Building", coordinate: .init(latitude: 40.741112, longitude: -73.989723)),
			AnnotatedItem(name: "Empire State Building", coordinate: .init(latitude: 40.748817, longitude: -73.985428))
			]
	
	
	private var vancouverPoints = [
		AnnotatedItem(name: "Science park", coordinate: .init(latitude: 49.27477428248723, longitude: -123.1036925314458)),
		AnnotatedItem(name: "Stanely park", coordinate: .init(latitude: 49.30405290703585, longitude: -123.14429044749619))
	]
	
	
	var body: some View {
		
		Map(coordinateRegion: $region, annotationItems: vancouverPoints) { item in
				MapMarker(coordinate: item.coordinate, tint: .red)
		}
		.edgesIgnoringSafeArea(.all)
			
			
			
	}
}

struct MapView_Previews: PreviewProvider {
		static var previews: some View {
				MapView()
		}
}

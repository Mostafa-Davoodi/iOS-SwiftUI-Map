//
//  AnnotatedItem.swift
//  iOS-SwiftUI-Map
//
//  Created by Mostafa Davoodi on 6/14/22.
//

import Foundation
import MapKit

struct AnnotatedItem: Identifiable {
		let id = UUID()
		var name: String
		var coordinate: CLLocationCoordinate2D
}

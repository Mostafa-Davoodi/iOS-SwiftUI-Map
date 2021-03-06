//
//  LocationViewModel.swift
//  iOS-SwiftUI-Map
//
//  Created by Mostafa Davoodi on 6/14/22.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
		@Published var authorizationStatus: CLAuthorizationStatus
		@Published var lastSeenLocation: CLLocation?
		@Published var currentPlacemark: CLPlacemark?
		@Published var region: MKCoordinateRegion = MKCoordinateRegion()
		
		private let locationManager: CLLocationManager
		
		override init() {
				locationManager = CLLocationManager()
				authorizationStatus = locationManager.authorizationStatus
				
				super.init()
				locationManager.delegate = self
				locationManager.desiredAccuracy = kCLLocationAccuracyBest
				locationManager.distanceFilter = 0.4
				locationManager.startUpdatingLocation()
		}
		
		func requestPermission() {
				locationManager.requestWhenInUseAuthorization()
		}
		
		func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
				authorizationStatus = manager.authorizationStatus
		}
		
		func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
				lastSeenLocation = locations.first
				fetchCountryAndCity(for: locations.first)
				region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lastSeenLocation?.coordinate.latitude ?? 0, longitude: lastSeenLocation?.coordinate.latitude ?? 0), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
		}
		
		func fetchCountryAndCity(for location: CLLocation?) {
				guard let location = location else { return }
				let geocoder = CLGeocoder()
				geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
						self.currentPlacemark = placemarks?.first
				}
		}
}

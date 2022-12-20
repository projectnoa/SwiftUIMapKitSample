//
//	ContentView.swift
//  SwiftUIMapKitSample
//
//  Created by Juan Mueller on 12/19/22.
//  For more, visit www.ajourneyforwisdom.com
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    var body: some View {
        VStack {
            MapView(annotations: getAnnotations())
        }
    }
}

// Function that retrieves annotations from a service or DB
func getAnnotations() -> [MKPointAnnotation] {
    // Here we are hardcoding the annotations for illustration purposes only
    let annotation1 = MKPointAnnotation()
    annotation1.title = "Restaurant"
    annotation1.coordinate = CLLocationCoordinate2D(latitude: 40.7128,
                                                    longitude: 74.0060)
    
    let annotation2 = MKPointAnnotation()
    annotation2.title = "Hospital"
    annotation2.coordinate = CLLocationCoordinate2D(latitude: 47.6062,
                                                    longitude: 122.3321)
    return [annotation1, annotation2]
}

struct MapView: UIViewRepresentable {
    // Location Manager object to request location updates from the core API
    var locationManager = CLLocationManager()
    // Annotations array
    var annotations: [MKPointAnnotation]?
    // Setup function for the representable
    func setup() {
        // Set the location manager properties
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    // Function to configure the representable view
    func makeUIView(context: Context) -> MKMapView {
        // Call the setup function
        setup()
        // Initialize the representable view
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        // Provide annotations if they exists
        if let annotations = annotations {
            mapView.addAnnotations(annotations)
        }
        // Return the representable view
        return mapView
    }
    // Function to update the representable view
    func updateUIView(_ uiView: MKMapView, context: Context) {
      // Do nothing
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

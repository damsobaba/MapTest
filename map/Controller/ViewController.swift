//
//  ViewController.swift
//  map
//
//  Created by Adam Mabrouki on 20/05/2021.
//
import MapKit
import UIKit


final class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var topBarTitle: UINavigationItem!
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    private let cityService = CityService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityUpdate()
    }
    // MARK: - Properties
    
    //fetch the data to display if success
    private func cityUpdate () {
        self.cityService.getCityInfo{ [unowned self] result in
            switch result {
            case .success(let weatherDescription):
                DispatchQueue.main.async {
                    self.refreshViews(weatherData: weatherDescription)
                }
            case .failure(let error):  DispatchQueue.main.async {
                // self.presentAlert()
                print(error)
            }
            }
        }
    }
    
    // a loop in witch the data are display into the view
    private func refreshViews(weatherData: CityInfo){
        for i in 0...2 {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: weatherData.locations[i].latitude,longitude: weatherData.locations[i].longitude)
            annotation.title = weatherData.locations[i].name
            mapView.addAnnotation(annotation)
            topBarTitle.title = annotation.title
        }
    }
}

extension ViewController: MKMapViewDelegate {
    //to add custom color annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        annotationView.markerTintColor = UIColor.green
        return annotationView
    }
    
    // display place name
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if let annotationTitle = view.annotation?.title {
            topBarTitle.title = annotationTitle
        }
    }
}

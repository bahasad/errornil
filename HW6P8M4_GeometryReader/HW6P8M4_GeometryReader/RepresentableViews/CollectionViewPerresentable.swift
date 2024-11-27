//
//  CollectionViewPerresentable.swift
//  HW6P8M4_GeometryReader
//
//  Created by Baha Sadyr on 11/27/24.
//

import SwiftUI

struct CollectionViewPerresentable: UIViewControllerRepresentable {
    
   // var vc: UIViewController?
    @ObservedObject var viewModel: HomeViewModel
    
    func makeUIViewController(context: Context) -> CollectionViewController {
        let vc = CollectionViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    func updateUIViewController(_ uiViewController: CollectionViewController, context: Context) {
        uiViewController.collectionView.reloadData()
    }
    
    
    
    
    
}


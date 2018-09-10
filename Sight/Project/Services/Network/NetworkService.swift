//
//  NetworkService.swift
//  Sight
//
//  Created by enot on 10.09.2018.
//  Copyright © 2018 eno0t. All rights reserved.
//

import UIKit

class NetworkService: NSObject, NetworkServiceProtocol {
    
    weak var delegate: NetworkServiceDelegate?
    
    var downloadSession : URLSession {
        get {
            let config = URLSessionConfiguration.background(withIdentifier: "background")
            config.httpMaximumConnectionsPerHost = 1
            config.allowsCellularAccess = true
            weak var queue = OperationQueue()
            return URLSession(configuration: config,
                              delegate: self,
                              delegateQueue: queue)
        }
    }
    
    var activeDownload: Download?
    
    func downloadImage(for download: Download?) {
        if let download = download,
            let urlString = download.url,
            let url = URL(string: urlString) {
            download.downloadTask = downloadSession.downloadTask(with: url)
            download.downloadTask?.resume()
            activeDownload = download
        }
    }
    
    func startDownload(_ download: Download?) {
        if let download = download, let url = download.url {
            if URL(string: url) != nil {
                downloadImage(for: download)
            }
        }
    }

// MARK: - URLSessionDelegate
    
}

protocol NetworkServiceDelegate: class {
    func image(_ image: UIImage)
}

extension NetworkService: URLSessionDownloadDelegate{

    func urlSession(_ session: URLSession,
                             downloadTask: URLSessionDownloadTask,
                             didWriteData bytesWritten: Int64,
                             totalBytesWritten: Int64,
                             totalBytesExpectedToWrite: Int64) {
        if activeDownload != nil {
            activeDownload?.progress = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        }
    }

    func urlSession(_ session: URLSession,
                             downloadTask: URLSessionDownloadTask,
                             didFinishDownloadingTo location: URL) {

        if let originalURL = downloadTask.originalRequest?.url?.absoluteString {
            let destinationURL = LocalStorageManager.localFilePathForUrl(originalURL)
            let fileManager = FileManager.default
            
            do {
                if let destinationURL = destinationURL {
                    do {try fileManager.removeItem(at: destinationURL)}catch{}
                    try fileManager.copyItem(at: location, to: destinationURL)
                    if let image = LocalStorageManager.imageForUrl(destinationURL){
                        delegate?.image(image)
                    }
                }
            } catch let error {
                print("Could not copy file to disk: \(error.localizedDescription)")
            }
        }
    }
}

final class Download {
    
    weak var delegate: DownloadDelegate?
    var url: String?
    var downloadTask: URLSessionDownloadTask?
    
    var progress: Float = 0.0 {
        didSet {
            updateProgress()
            if progress == 1 {
                downloadTask = nil
            }
        }
    }
    
    // Gives float for download progress - for delegate
    
    private func updateProgress() {
        if let _ = downloadTask,
            let _ = url {
            delegate?.downloadProgressUpdate(for: progress)
        }
    }
    
    // Initialization
}

protocol DownloadDelegate: class {
    func downloadProgressUpdate(for progress: Float)
}

final class LocalStorageManager {
    
    static func localFilePathForUrl(_ imageUrl: String) -> URL? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        if let url = URL(string: imageUrl) {
            let fullPath = documentsPath.appendingPathComponent(url.lastPathComponent)
            return URL(fileURLWithPath: fullPath)
        }
        return nil
    }
    
    static func imageForUrl(_ imageUrl: URL) -> UIImage? {
        do{
            let data = try Data(contentsOf: imageUrl)
            if let image = UIImage(data: data){
                return image
            }
        }catch{}
        return nil
    }
}

//
//  File.swift
//  
//
//  Created by Serhan Aksut on 23.10.2020.
//

import Foundation

public typealias ResponseDecoder<Model: Decodable> = (Data, [CodingUserInfoKey: Any]?) throws -> Model

//
//  main.swift
//  XCTestHTMLReport
//
//  Created by Titouan van Belle on 21.07.17.
//  Copyright © 2017 Tito. All rights reserved.
//

import Foundation

var version = "1.5.0"

print("XCTestHTMLReport \(version)")

var command = Command()
var help = BlockArgument("h", "", required: false, helpMessage: "Print usage and available options") {
    print(command.usage)
    exit(EXIT_SUCCESS)
}
var verbose = BlockArgument("v", "", required: false, helpMessage: "Provide additional logs") {
    Logger.verbose = true
}
var result = ValueArgument(.path, "r", "resultBundePath", required: true, allowsMultiple: true, helpMessage: "Path to the result bundle")

command.arguments = [help, verbose, result]

if !command.isValid {
    print(command.usage)
    exit(EXIT_FAILURE)
}

let summary = Summary(roots: result.values)

Logger.step("Building HTML..")
let html = summary.html

do {
    let path = "\(result.values.first!)/index.html"
    Logger.substep("Writing report to \(path)")

    try html.write(toFile: path, atomically: false, encoding: .utf8)
    Logger.success("\nReport successfully created at \(path)")
}
catch let e {
    Logger.error("An error has occured while creating the report. Error: \(e)")
}

exit(EXIT_SUCCESS)

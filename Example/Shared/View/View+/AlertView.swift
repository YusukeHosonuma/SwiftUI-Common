//
//  AlertView.swift
//  Example (iOS)
//
//  Created by Yusuke Hosonuma on 2022/05/24.
//

import SwiftUI
import SwiftUICommon

enum MyError {
    case warning, fatal

    var helpMessage: String {
        switch self {
        case .warning: return "This is warning."
        case .fatal: return "This is fatal."
        }
    }
}

extension MyError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .warning: return "Warning"
        case .fatal: return "Fatal"
        }
    }
}

struct AlertView: View {
    @State var error: MyError? = nil
    @State var errorWithMessage: MyError? = nil

    var body: some View {
        VStack(spacing: 8) {
            VStack {
                Text("Simple")
                Button("Warning") { error = .warning }
                Button("Fatal") { error = .fatal }
            }

            VStack {
                Text("With message")
                Button("Warning") { errorWithMessage = .warning }
                Button("Fatal") { errorWithMessage = .fatal }
            }
        }
        .extend { content in
            //
            // ✅ Not need to specify `isPresented: Binding<Bool>`.
            //
            if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
                content
                    .alert(error: $error) {}
                    .alert(error: $errorWithMessage) { _ in
                        Button("OK") {}
                    } message: { error in
                        Text(error.helpMessage)
                    }
            } else {
                //
                // ☑️ Note:
                // This conditional branching is a workaround for a bug in SwiftUI.
                // It is not necessary if `.alert` is not used more than once.
                //
                if let _ = error {
                    content
                        .alert(
                            error: $error,
                            dismissButton: .cancel() // Optional
                        )
                    // or:
                    //
                    // .alert(
                    //     error: $error,
                    //     primaryButton: .default(Text("OK")),
                    //     secondaryButton: .cancel()
                    // )
                } else if let _ = errorWithMessage {
                    content
                        .alert(
                            error: $errorWithMessage,
                            message: Text(errorWithMessage?.helpMessage ?? "unknown"),
                            dismissButton: .cancel() // Optional
                        )
                    // or:
                    //
                    // .alert(
                    //     error: $errorWithMessage,
                    //     message: Text(errorWithMessage?.helpMessage ?? "unknown"),
                    //     primaryButton: .default(Text("OK")),
                    //     secondaryButton: .cancel()
                    // )
                } else {
                    content
                }
            }
        }
    }
}

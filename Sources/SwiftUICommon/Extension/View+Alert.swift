//
//  File.swift
//
//
//  Created by Yusuke Hosonuma on 2022/05/25.
//

import SwiftUI

// MARK: iOS 15+

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public extension View {
    func alert<E: LocalizedError, A: View>(
        error: Binding<E?>,
        @ViewBuilder actions: () -> A
    ) -> some View {
        alert(
            isPresented: error.isPresent(),
            error: error.wrappedValue,
            actions: actions
        )
    }

    func alert<E: LocalizedError, A: View, M: View>(
        error: Binding<E?>,
        @ViewBuilder actions: (E) -> A,
        @ViewBuilder message: (E) -> M
    ) -> some View {
        alert(
            isPresented: error.isPresent(),
            error: error.wrappedValue,
            actions: actions,
            message: message
        )
    }
}

// MARK: iOS 14+

@available(iOS, introduced: 13.0, deprecated: 15.0, message: "Please use iOS 15 version API")
public extension View {
    // MARK: without message

    func alert<E: LocalizedError>(
        error: Binding<E?>,
        message: Text? = nil,
        dismissButton: Alert.Button? = nil
    ) -> some View {
        alert(isPresented: error.isPresent()) {
            Alert(
                title: Text(error.wrappedValue?.errorDescription ?? defaultError(error.wrappedValue)),
                message: message,
                dismissButton: dismissButton
            )
        }
    }

    func alert<E: LocalizedError>(
        error: Binding<E?>,
        message: Text? = nil,
        primaryButton: Alert.Button,
        secondaryButton: Alert.Button
    ) -> some View {
        alert(isPresented: error.isPresent()) {
            Alert(
                title: Text(error.wrappedValue?.errorDescription ?? defaultError(error.wrappedValue)),
                message: message,
                primaryButton: primaryButton,
                secondaryButton: secondaryButton
            )
        }
    }

    //
    // 💡 Note: Similar to default error message in iOS 15+ (Not an exact match)
    //
    private func defaultError<E: LocalizedError>(_ error: E?) -> String {
        let errorType: String

        if let error = error {
            errorType = String(describing: type(of: error))
        } else {
            errorType = String(describing: type(of: error))
        }

        return "The operation couldn't be completed. (\(errorType))"
    }
}

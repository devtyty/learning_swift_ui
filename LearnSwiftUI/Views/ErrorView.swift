//
//  ErrorView.swift
//  LearnSwiftUI
//
//  Created by Megabee on 22/7/25.
//
import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

private enum SampleError: Error {
    case errorRequired
}

#Preview {
    ErrorView(
        errorWrapper: ErrorWrapper(
            error: SampleError.errorRequired,
            guidance: "You can safely ignore this error."
        )
    )
}

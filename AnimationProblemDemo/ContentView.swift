import SwiftUI

struct ContentView: View {
	@State private var showBox = false
	@State private var swapViews = false

	var body: some View {
		ZStack(alignment: .top) {
			if showBox {
				Rectangle().fill(.black).frame(width: 100) // View A
					.overlay {
						if swapViews {
							Text("42").foregroundColor(.red) // View C
						} else {
							ProgressView().tint(.red) // View B
						}
					}
					.transition(.move(edge: .leading))
			}

			Button {
				withAnimation(.easeInOut(duration: 5)) {
					showBox.toggle()
				}

				DispatchQueue.main.asyncAfter(deadline: .now() + . seconds(1)) {
					withAnimation {
						swapViews.toggle()
					}
				}
			} label: {
				Text("Toggle").background { Rectangle().fill(.white) }
			}
		}
		.frame(maxHeight: .infinity, alignment: .top)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

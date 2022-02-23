import SwiftUI

struct ContentView: View {
	@State private var showBox = false
	@State private var showLabel = false

	var body: some View {
		ZStack(alignment: .top) {
			if showBox {
				Rectangle().fill(.black).frame(width: 100)
					.overlay {
						if showLabel {
							Text("42").foregroundColor(.red)
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
						showLabel.toggle()
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

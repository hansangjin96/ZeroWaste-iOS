//
//  CategoryCell.swift
//  ZeroWaste
//
//  Created by Tim on 2021/05/19.
//

import SwiftUI

struct CategoryCell: View {
    
    private let theme: Mission.Theme
    
    init(theme: Mission.Theme) {
        self.theme = theme
    }
    
    var body: some View {
        Text(theme.description)
            .font(.system(13, .regular))
            .foregroundColor(.zBlack)
            .padding(.vertical, 4)
            .padding(.horizontal, 12)
            .background(Color.zGray5)
            .cornerRadius(35)
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(theme: .recycle)
            .previewLayout(.sizeThatFits)
    }
}

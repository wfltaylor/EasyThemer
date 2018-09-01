//
//  ThemableViews.swift
//  EasyThemer
//
//  Created by William Taylor on 25/8/18.
//


class ThemeableView: UIView, ThemeEngineDelegate {
    
    private let arrayIndex: Int
    
    public func set(theme: Theme) {
        self.backgroundColor = theme.backgroundColor
        self.tintColor = theme.tintColor
    }
    private func getTheme() -> Theme {
        return ThemeEngine.standard.currentTheme!
    }
    internal func themeChanged() {
        set(theme: getTheme())
    }
    public init() {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(frame: CGRect.zero)
        ThemeEngine.standard.clients.append(self)
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    public override init(frame: CGRect) {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(frame: frame)
        ThemeEngine.standard.clients.append(self)
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    required init?(coder aDecoder: NSCoder) {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(coder: aDecoder)
        ThemeEngine.standard.clients.append(self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    func themeReady() {
        set(theme: getTheme())
    }
    deinit {
        ThemeEngine.standard.clients.remove(at: arrayIndex)
    }
}
class ThemeableButton: UIButton, ThemeEngineDelegate {
    
    private let arrayIndex: Int
    
    public func set(theme: Theme) {
        self.tintColor = theme.tintColor
        self.setTitleColor(theme.primaryColor, for: .normal)
        self.titleLabel?.font = theme.primaryFont?.withSize(self.titleLabel!.font.pointSize)
    }
    private func getTheme() -> Theme {
        return ThemeEngine.standard.currentTheme!
    }
    internal func themeChanged() {
        set(theme: getTheme())
    }
    public init() {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(frame: CGRect.zero)
        ThemeEngine.standard.clients.append(self)
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    public override init(frame: CGRect) {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(frame: frame)
        ThemeEngine.standard.clients.append(self)
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    required init?(coder aDecoder: NSCoder) {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(coder: aDecoder)
        ThemeEngine.standard.clients.append(self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    func themeReady() {
        set(theme: getTheme())
    }
    deinit {
        ThemeEngine.standard.clients.remove(at: arrayIndex)
    }
    
}

class ThemeableNavigationBar: UINavigationBar, ThemeEngineDelegate {
    
    private let arrayIndex: Int
    
    public func set(theme: Theme) {
        self.tintColor = theme.tintColor
        self.barStyle = theme.barStyle ?? self.barStyle
        self.titleTextAttributes = [NSAttributedStringKey.font: (theme.titleFont ?? UIFont.systemFont(ofSize: 24)) as Any]
        if #available(iOS 11.0, *) {
            self.prefersLargeTitles = true
        } else {
            print("Failed To Set Large Title Attribute")
        }
    }
    private func getTheme() -> Theme {
        return ThemeEngine.standard.currentTheme!
    }
    internal func themeChanged() {
        set(theme: getTheme())
    }
    public init() {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(frame: CGRect.zero)
        ThemeEngine.standard.clients.append(self)
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    public override init(frame: CGRect) {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(frame: frame)
        ThemeEngine.standard.clients.append(self)
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    required init?(coder aDecoder: NSCoder) {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(coder: aDecoder)
        ThemeEngine.standard.clients.append(self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    func themeReady() {
        set(theme: getTheme())
    }
    deinit {
        ThemeEngine.standard.clients.remove(at: arrayIndex)
    }
    
}
class ThemeableTabBar: UITabBar, ThemeEngineDelegate {
    
    private let arrayIndex: Int
    
    public func set(theme: Theme) {
        self.tintColor = theme.tintColor
        self.barStyle = theme.barStyle ?? self.barStyle
    }
    private func getTheme() -> Theme {
        return ThemeEngine.standard.currentTheme!
    }
    internal func themeChanged() {
        set(theme: getTheme())
    }
    public init() {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(frame: CGRect.zero)
        ThemeEngine.standard.clients.append(self)
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    public override init(frame: CGRect) {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(frame: frame)
        ThemeEngine.standard.clients.append(self)
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    required init?(coder aDecoder: NSCoder) {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(coder: aDecoder)
        ThemeEngine.standard.clients.append(self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    func themeReady() {
        set(theme: getTheme())
    }
    deinit {
        ThemeEngine.standard.clients.remove(at: arrayIndex)
    }
    
}
class ThemeableLabel: UILabel, ThemeEngineDelegate {
    
    private let arrayIndex: Int
    
    public func set(theme: Theme) {
        self.tintColor = theme.tintColor
        self.textColor = theme.textColor
        self.font = theme.primaryFont?.withSize(self.font.pointSize)
    }
    private func getTheme() -> Theme {
        return ThemeEngine.standard.currentTheme!
    }
    internal func themeChanged() {
        set(theme: getTheme())
    }
    public init() {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(frame: CGRect.zero)
        ThemeEngine.standard.clients.append(self)
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    public override init(frame: CGRect) {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(frame: frame)
        ThemeEngine.standard.clients.append(self)
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    required init?(coder aDecoder: NSCoder) {
        arrayIndex = ThemeEngine.standard.clients.count
        super.init(coder: aDecoder)
        ThemeEngine.standard.clients.append(self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if ThemeEngine.standard.isReady {
            set(theme: getTheme())
        }
    }
    func themeReady() {
        set(theme: getTheme())
    }
    deinit {
        ThemeEngine.standard.clients.remove(at: arrayIndex)
    }
}

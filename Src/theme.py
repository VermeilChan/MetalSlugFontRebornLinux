dark_theme = """
QMainWindow {
    background-color: #2E2E2E;
    color: #FFFFFF;
}

QLabel {
    color: #FFFFFF;
    font-size: 16px;
}

QLineEdit {
    background-color: #242424;
    color: #FFFFFF;
    selection-background-color: #b71c1c;
    border-radius: 5px;
    font-size: 14px;
    height: 30px;
}

QComboBox {
    background-color: #333333;
    color: #FFFFFF;
    selection-background-color: #d32f2f;
    border-radius: 8px;
    padding: 5px;
    font-size: 14px;
    height: 30px;
    border: 2px solid #d32f2f;
}

QComboBox:hover {
    border: 2px solid #b71c1c;
}

QComboBox:pressed {
    border: 2px solid #4B0082;
}

QComboBox QAbstractItemView {
    background-color: #333333;
    color: #FFFFFF;
    border: 1px solid #d32f2f;
    selection-background-color: #d32f2f;
    border-radius: 5px;
    font-size: 14px;
}

QComboBox::drop-down {
    border: none;
}

QComboBox::down-arrow {
    image: url("Assets/Icons/Drop-Down-Arrow.svg");
    width: 30px;
    height: 30px;
    margin-right: 10px;
}

QPushButton {
    background-color: #d32f2f;
    color: #FFFFFF;
    border: 1px solid #d32f2f;
    padding: 10px;
    border-radius: 5px;
    font-size: 16px;
}

QPushButton:hover {
    background-color: #b71c1c;
    border: 1px solid #b71c1c;
    border-radius: 5px;
}
"""

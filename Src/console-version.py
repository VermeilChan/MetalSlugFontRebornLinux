import sys

from main import generate_filename, generate_image, get_font_paths

from constants import VALID_COLORS_BY_FONT, DESKTOP_PATH

def display_intro_message():
<<<<<<< HEAD
    print(f"\nNote:\nConverting your text to the Metal Slug font may not work with all fonts.\n")

def get_user_input():
    return input(f"\nEnter the text you want to generate: ")
=======
    print("Note: Converting your text to the Metal Slug font may not work with all fonts.")
    print("Please refer to SUPPORTED.md file for more information.\n")

def get_user_input():
    return input("\nEnter the text you want to generate: ")
>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26

def select_font_and_color():
    while True:
        try:
<<<<<<< HEAD
            user_input = input(f"Choose a font from 1 to 5 (type 'exit' to close): ")
=======
            user_input = input("Choose a font from 1 to 5 (type 'exit' to close): ")
>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26

            if user_input.lower() == 'exit':
                print(f'\nClosing...\n')
                sys.exit(0)

            font = int(user_input)

            if 1 <= font <= 5:
                valid_colors = VALID_COLORS_BY_FONT.get(font, [])
<<<<<<< HEAD
                print(f"\nAvailable colors: " + " | ".join(valid_colors))
=======
                print("\nAvailable colors: " + " | ".join(valid_colors))
>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26
                color_input = input("\nChoose a color: ")

                if color_input.lower() == 'exit':
                    print(f'\nClosing...\n')
                    sys.exit(0)
                elif color_input.title() in valid_colors:
                    color_input = color_input.title()
                    return font, color_input
                else:
<<<<<<< HEAD
                    print(f"\nInvalid color. Please choose a valid color.\n")
=======
                    print("Invalid color. Please choose a valid color.")
>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26
            else:
                print(f"\nInvalid input. Please choose a font between 1 and 5.\n")

        except ValueError:
<<<<<<< HEAD
            print(f"\nInvalid input. Please enter a valid number.\n")
        except KeyboardInterrupt:
            print(f'\nClosing...\n')
            sys.exit(0)

def ask_to_check_supported_characters():
    check_supported = input("Do you want to check the supported characters? [Y/n]: ").lower()

    if check_supported == 'y':
        with open(f"Documentation/SUPPORTED.txt", "r") as supported_file:
            content = supported_file.read()
            print(content)
            print(f"Note:")
            print(f"Some characters may not load due to font limitations or terminal compatibility.")
            print(f"You can open SUPPORTED.txt if it doesn't work properly\n")
    elif check_supported == 'n':
        print(f"\nYou can check them later if you want in SUPPORTED.txt\n")
        pass
    else:
        print(f"\nInvalid input.\n")

def generate_and_display_image(text, font, color):
    if text.lower() == 'exit':
        print(f'\nClosing...\n')
        sys.exit(0)

    if not text.strip():
        print(f"Input text is empty. Please enter some text.")
=======
            print("Invalid input. Please enter a valid number.")
        except KeyboardInterrupt:
            print(CLOSING_MESSAGE)
            sys.exit(0)

def generate_and_display_image(text, font, color):
    if text.lower() == 'exit':
        print(CLOSING_MESSAGE)
        sys.exit(0)

    if not text.strip():
        print("Input text is empty. Please enter some text.")
>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26
        return

    try:
        filename = generate_filename(text)
        font_paths = get_font_paths(font, color)
        img_path, error_message_generate = generate_image(text, filename, font_paths)

        if error_message_generate:
            print(f"Error: {error_message_generate}")
        else:
            print(f"\nImage saved as: {filename}")
<<<<<<< HEAD
            print(f"\nYou can find the image on your desktop: \n{DESKTOP_PATH / img_path}")

    except Exception as e:
        print(f"Error: {e}")
=======
            print(f"You can find the image on your desktop: {DESKTOP_PATH / img_path}")

    except Exception as e:
        print(f"Error: {e}")
        print(CLOSING_MESSAGE)
        sys.exit(0)
>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26

def main():
    display_intro_message()
    ask_to_check_supported_characters()

    font, color = select_font_and_color()

    try:
        while True:
            text = get_user_input()
            generate_and_display_image(text, font, color)
    except KeyboardInterrupt:
<<<<<<< HEAD
        print(f'\nClosing...\n')
=======
        print(CLOSING_MESSAGE)
>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26
        sys.exit(0)

if __name__ == "__main__":
    main()

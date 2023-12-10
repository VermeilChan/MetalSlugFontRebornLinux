import string
import secrets
from pathlib import Path

from PIL import Image

from constants import SPACE_WIDTH, DESKTOP_PATH, SPECIAL_CHARACTERS

def generate_filename(_):
    random_chars = ''.join(secrets.choice(string.ascii_letters + string.digits) for _ in range(15))
    filename = f"{random_chars}.png"
    return filename

def get_font_paths(font, color):
    base_path = Path('Assets') / 'Fonts' / f'Font-{font}' / f'Font-{font}-{color}'
    return [base_path / folder for folder in ['Letters', 'Numbers', 'Symbols']]

<<<<<<< HEAD
character_image_cache = {}

=======
>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26
def get_character_image_path(character, font_paths):
    CHARACTERS_FOLDER, NUMBERS_FOLDER, SYMBOLS_FOLDER = font_paths

    if character.isalpha():
        folder = 'Lower-Case' if character.islower() else 'Upper-Case'
        character_image_path = CHARACTERS_FOLDER / folder / f"{character}.png"
    elif character.isdigit():
        character_image_path = NUMBERS_FOLDER / f"{character}.png"
    elif character.isspace():
        return None
    else:
        character_image_path = SYMBOLS_FOLDER / f"{SPECIAL_CHARACTERS.get(character, '')}.png"

    return character_image_path if character_image_path.is_file() else None

<<<<<<< HEAD
def get_character_image(character, font_paths):
    if character in character_image_cache:
        return character_image_cache[character]

    if character.isspace():
        return create_character_image(character, font_paths)

    character_image_path = get_character_image_path(character, font_paths)
    if not character_image_path or not character_image_path.is_file():
        raise FileNotFoundError(f"Image not found for character '{character}'")

    image = Image.open(character_image_path).convert("RGBA")
    character_image_cache[character] = image

    return image

def create_character_image(character, _):
    if character.isspace():
        return Image.new("RGBA", (SPACE_WIDTH, 1), (0, 0, 0, 0))
=======
def create_character_image(character, font_paths):
    if character.isspace():
        return Image.new("RGBA", (SPACE_WIDTH, 1), (0, 0, 0, 0))

    character_image_path = get_character_image_path(character, font_paths)
    if not character_image_path or not character_image_path.is_file():
        raise FileNotFoundError(f"Error: Image not found for character '{character}'")

    return Image.open(character_image_path).convert("RGBA")
>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26

def calculate_total_width_and_max_height(text, font_paths):
    total_width = 0
    max_height = 0

    for character in text:
<<<<<<< HEAD
        character_image = get_character_image(character, font_paths)
=======
        character_image = create_character_image(character, font_paths)
>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26
        max_height = max(max_height, character_image.height)
        total_width += character_image.width

    return total_width, max_height

<<<<<<< HEAD
def paste_character_images_to_final_image(text, font_paths, total_width, max_height):
    x_position = 0
    final_image = Image.new("RGBA", (total_width, max_height), (0, 0, 0, 0))

    for character in text:
        character_image = get_character_image(character, font_paths)
        final_image.paste(character_image, (x_position, 0))
        x_position += character_image.width

    return final_image

def generate_image(text, filename, font_paths):
    total_width, max_height = calculate_total_width_and_max_height(text, font_paths)
    final_image = paste_character_images_to_final_image(text, font_paths, total_width, max_height)
    
    image_path = Path(DESKTOP_PATH) / filename
    final_image.save(image_path)

=======
def paste_character_images_to_final_image(text, character_images, final_image):
    x_position = 0

    for character in text:
        final_image.paste(character_images[character], (x_position, 0))
        x_position += character_images[character].width

def generate_image(text, filename, font_paths):
    image_path = Path(DESKTOP_PATH) / filename
    total_width, max_height = calculate_total_width_and_max_height(text, font_paths)
    character_images = {character: create_character_image(character, font_paths) for character in text}
    final_image = Image.new("RGBA", (total_width, max_height), (0, 0, 0, 0))

    paste_character_images_to_final_image(text, character_images, final_image)
    final_image.save(image_path)

>>>>>>> 4bbe5e0f61834485180820a80a05c1231f2c3b26
    return str(image_path), None

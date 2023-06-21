# Wheel of Time Characters Compendium App

Welcome to the Wheel of Time Characters Compendium App! This SwiftUI-based iOS application allows you to explore characters from the popular book series, "The Wheel of Time." The app provides a comprehensive collection of character information, which has been sourced from [WoT Compendium](https://hammondkd.github.io/WoT-compendium/).

## Features

- Search for characters by book or across the entire series.
- Discover detailed information about each character, including their background, traits, and relationships.
- Navigate through the chapters and books to explore the character's journey.

## JSON Models

The app utilizes JSON models to structure and represent the character data. Here is an example of how the JSON models are structured:

```json
{
    "book_id": "1",
    "book_title": "The Eye of the World",
    "chapters": [
        {
            "chapter_id": "Prologue",
            "chapter_title": "An Empty Road",
            "image_name": "Wheel-icon",
            "characters": [
                {
                    "name": "Lews Therin Telamon",
                    "info": "The Dragon, Lord of the Morning, Kinslayer, Breaker of the World. He is a tall man just into his middle years. He was handsome once, but now he has more white hair than brown, and his face is lined from strain and worry. He has dark eyes. Known as the Dragon during the War of the Shadow. He killed his entire family in the madness that seized him after resealing the Dark One’s prison.",
                    "see_also": "Rand al’Thor; The Dragon; Dragon Reborn; Kinslayer; Lord of the Morning; Ilyena Therin Moerelle; Tamyrlin"
                },
                {
                    "name": "Ilyena Therin Moerelle",
                    "info": "Wife of Lews Therin Telamon. She has blonde hair. She was called 'Sunhair.' She died along with her children when her insane husband killed them, and her.",
                    "see_also": "Lews Therin Telamon"
                }
            ]
        }
    ]
}

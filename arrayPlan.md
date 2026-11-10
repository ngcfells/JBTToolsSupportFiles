# Plan for array

## ideas

- We want to use a compacted array stripping out titles of the rows/fields
- We want to use lookup tables for equipment and items taking up critical slots
- We want to have additional lookup tables that have things like manufacturers and models for otherwise generic equipment
- We need to figure out how to store the fluff and any images associated in something like blob storage that is called when that specific unit is brought up, but otherwise is not loaded.
- We will want to make sure we are chunking the files... first by unit type, then tonnage, then alpha? Maybe... determine the most efficient way to do that... We are looking for this to be the general storage, not an individual unit file that is kept by the user...
- Regarding user export... should they decide they want to modify the entry and save that to their local machine, they can do so. It is likely best that we develop our own set. I recommend we develop the following:
  - 'Mechs - .jbtm
  - ProtoMechs - .jbtp
  - Vehicles - .jbtv
  - Aerospace/Convential Fighters - .jbta
  - DropShips - .jbtd
  - JumpShips/WarShips/Stations - .jbtn
  - Infantry - .jbti
  - Buildings/Structures = .jbtb
  - Exosuits/Battle Armor = .jbte
- Some modification of the above is fine... this is just a working draft... but the idea is to keep the file simple and to the point and not have too many options in a single file type... expanding beyond to break down further would potentially make sense too... so you could have something liuke .jbtmb, .jbtmt, .jbtmq for bipeds, tripods, and quads... These files could then be read by the app in addition to the condensed content we have listed...
- We should also consider how to handle performance and scalability for these files, ensuring that the system can efficiently manage large datasets and maintain responsive performance as the number of files and users increases.
- The biggest idea here is that this entire repo is specifically meant to store the non-canon content, ensuring only canon ships natively, except for sample units included for non-canon unit types like the ArtVee or VTOLAMs.
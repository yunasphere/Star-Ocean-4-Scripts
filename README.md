# Star-Ocean-4-Scripts

All scripts require the Installation of:
- AutoHotKey
- PS Remote Play 
- PS4 Macro ( https://github.com/komefai/PS4Macro )

### Edge-093 and Arumat-098
Prerequisites:
- Edge/Arumat as active character
- All other party members on manual
- Special Arts set to L2 button for active character (recommend Rising Blade for Edge and Unholy Maelstrom for Arumat)

Notes:
- If you are not rank 1 in the Colosseum team battles, modify the script on line 5 (the variable pos_from_bugs) and change it from '3' to your rank + 2
- As the script uses special arts to defeat enemies, you will automatically gain pink tiles during the first battle so you will regen SP and not run out
- If you want, you can fill the bonus board in advance with money tiles, however make sure you have at least one or two free to get pink tiles for SP regen

The script is meant to loop the "Bugs Bugs Bugs!" team battle in the colosseum - this gets 6 kills per minute approximately, assuming you can defeat the enemies is one hit (which if you're going for this trophy, you can).
Make sure you are facing the Colosseum Receptionist and the 'Talk' prompt is in the bottom right of the screen, as this is the first action for the script. With the PS4 Macro and Remote Play running, you can start the script to begin the loop.

In the case of a severe lag spike between remote play and the PS4, which can delay inputs and thrown script out of time, the loop wil be interupted. However, you can not die in the coloseum, so your progress will not be lost - worst case scenario is that you end up in a weird colosseum battle simply stop farming kills.

The number of enemies you have killed is exported to a TXT file after the script has stopped. In the case of multiple uses, it is appended so you can total the kills over all sessions.

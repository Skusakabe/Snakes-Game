# Snakes-Game
Worms like game: PvP, shoot projectiles at your opponent and modify power and angle to aim. Turn based, rely on physics/gravity and have a variety of projectiles that affect the players and terrain/map. Players can move on their turn(limited amount) and either have an hp that goes down on hit, or a score that increases as they hit the enemy. Weapons are either randomized or selected from a randomized pool before the match, so players don’t just spam one weapon.

Necessary processing libaries: ControlP5 and Sound.

https://docs.google.com/document/d/1AoIARfXN8U-7Oqtji3RhJ8SQPpH15UtG0l1z0YM3ohg/edit?usp=sharing

Kevin Work Log:
5/23/22: Made basic Snake object, which keep tracks of health and location of the snake. Made the snake model to display itself.

5/24/22: Made terrain object, made terrain models and different types for the object. Added ID for the terrains. Set up background.

5/25/22: Made player class that keep track of snakes in each player's team. Made Red and Blue snake models, to keep track of team.

5/26/22: Made selecting snakes possible, added basic movement code. Added controller class which help with snake movement.

5/27/22: Added an UI class which will contain our user interface, worked on a model for the basic UI panel.

5/28/22: Worked snake-terrain interaction, added snake gravity allowing for snake to fall on top of the terrain, and disallow for snakes to go through terrain from the top side.

5/29/22: Added keyboard controls that control angles and power of shots from snakes. Added display for angles and power. Added spacebar to fire snake. Added a turn change mechanism.

5/30/22: Added death screen and win screen for the players.

5/31/22: Made a title screen for the game, added modes, and button that switches them to rotate between which screen is shown.

6/1/22: Made the pause Menu.

6/2/22: Started work on the save menu, started setting up save and open function.

6/3/22: Finish working on map editing screen, along with GUI. This allows us to draw our map and then upload it.

6/4/22: Worked on File saving method, researched libraries that could be used.

6/5/22: Worked on File Saving and file opening, file saving now can create a file. Also created a map loading screen.

6/6/22: Found Error with PImage not being able to be serializable. Fixed issue. Now both load map and save map work. Along with all the GUI involved. Added a dropdown list to pick map.

6/7/22: fixed issue with local pathing. Found issue with math and highestblock method. Fixed pause button being broken. 

6/8/22: Fixed issues with pause button. 

6/9/22: added arsenal Menu. Made a new WeaponButton class, allowing for automation of button.
6/10/22: worked on minor bug fixes.
6/11/22: made more option for pause menu and started work on tiding up the game.
Shinji work log:

5/23/22: Made a little bit of projectile and started the project. Got projectile to display itself and do the physics/move.

5/24/22: Made projectile orient itself correctly and changed some of partner code.

5/25/22: Made methods to changed the terrain and made a lot of changes to older code for future methods

5/26/22: Added collision detection to projectiles and made the scanEffectRadius() method, which is called after colliding with terrain and interacts with the appropriate terrain in its radius. Also added a DirtShot projectile that creates terrain. scanEffectRadius doesn't currently do anything with snakes, but it will later and should be easy to code the extra stuff.

5/27/22: Worked on the beginning of buttons.

5/29/22: Finished buttons and did a lot of bug/error fixing for issues caused by the new changes made in the code and from merges. Made scanEffectRadius also detect and target snakes in the area and damage them and created a damage formula based on how close the projectile hit the snake.

5/30/22: Made code to change weapons and put text on the button to do so. Made another projectile(very basic, larger version of the BasicShot) and created the demo branch.

5/31/22: Made some new projectiles and some other changes. Also removed the height limit for projectiles so they don't despawn when they touch the ceiling.

6/1/22: Made some more new projectiles and struggled a lot with getting homing shot to work well(it still didn't by the end of this day).

6/2/22: Got homing shot working and added some other new projectiles.

6/4/22: Added random terrain generation and made it somewhat decent after tweeking a bunch of numbers. Also added animations for projectile explosions.

6/5/22: Fixed some bugs and created spider shot.

6/6/22: Created blunderbuss and improved radius of projectiles.

6/7/22: Added sound effects and bgm.

6/8/22: More adjustments to sound.

6/9/22: bug fixing, improvements and made the start of arsenal to keep track of the players weapons.

6/10/22: Finished making the arsenal functional and more bug fixing.

6/12/22: A lot of bug fixing and small qol changes like an indicator over the selected snake and made main menu reset the game.

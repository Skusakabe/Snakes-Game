# Snakes-Game
Worms like game: PvP, shoot projectiles at your opponent and modify power and angle to aim. Turn based, rely on physics/gravity and have a variety of projectiles that affect the players and terrain/map. Players can move on their turn(limited amount) and either have an hp that goes down on hit, or a score that increases as they hit the enemy. Weapons are either randomized or selected from a randomized pool before the match, so players don’t just spam one weapon.

https://docs.google.com/document/d/1AoIARfXN8U-7Oqtji3RhJ8SQPpH15UtG0l1z0YM3ohg/edit?usp=sharing

Kevin Work Log:
5/23/22: Made basic Snake object, which keep tracks of health and location of the snake. Made the snake model to display itself.

5/24/22: Made terrain object, made terrain models and different types for the object. Added ID for the terrains. Set up background.

5/25/22: Made player class that keep track of snakes in each player's team. Made Red and Blue snake models, to keep track of team.

5/26/22: Made selecting snakes possible, added basic movement code. Added controller class which help with snake movement.

5/27/22: Added an UI class which will contain our user interface, worked on a model for the basic UI panel.

5/28/22: Worked snake-terrain interaction, added snake gravity allowing for snake to fall on top of the terrain, and disallow for snakes to go through terrain from the top side. 

5/29/22: Added keyboard controls that control angles and power of shots from snakes. Added display for angles and power. Added spacebar to fire snake. Added a turn change mechanism. 

5/29/22: 

Shinji work log:

5/23/22: Made a little bit of projectile and started the project. Got projectile to display itself and do the physics/move.

5/24/22: Made projectile orient itself correctly and changed some of partner code.

5/25/22: Made methods to changed the terrain and made a lot of changes to older code for future methods

5/26/22: Added collision detection to projectiles and made the scanEffectRadius() method, which is called after colliding with terrain and interacts with the appropriate terrain in its radius. Also added a DirtShot projectile that creates terrain. scanEffectRadius doesn't currently do anything with snakes, but it will later and should be easy to code the extra stuff.

5/27/22: Worked on the beginning of buttons.

5/29/22: Finished buttons and did a lot of bug/error fixing for issues caused by the new changes made in the code and from merges. Made scanEffectRadius also detect and target snakes in the area and damage them and created a damage formula based on how close the projectile hit the snake.

5/30/22: Made code to change weapons and put text on the button to do so. Made another projectile(very basic, larger version of the BasicShot) and created the demo branch.

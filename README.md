# Godot 20 Game Challenge
 
Starting the 20 Game Challenge recommended by Pirate Software. By the end of this challenge I hope to be more familiar and comfortable with Godot Engine.

## Game 1 - Pong
Traditional Pong arcade game. Good simple game to get introducted to Godot! Right...?

### What did I learn?
1. KinematicBody2D was renamed to CharacterBody2D, sure I guess? That was honestly confusing at first.
2. Collisions is, as always, a pain to deal with.
3. WorldBoundaryShape2D don't like being intercepted by another of the same type. No touchy allowed
4. I can actually change the script in the root of a packed scene, no need to make another scene just for that. In fact, I can go further and edit the child elements of it!!!
5. The pivots of UI elements don't behave as I would expect based on my experience with Unity.
6. Godot has a bounce function! Wish I knew that from start ;-;
7. Moving Area2D is annoying.

### What did I struggle with?
1. Bouncing the ball around before I find out there is a function that makes it automatically for me... No seriously, I still don't know if I was more sad or pissed to find that function.
2. KinematicBody2D collisions for sure... I wanted to use both KinematicBody2D for the ball and the paddle but it resulted in the paddle sometimes being pushed by the ball or they both having some crazy after collision effect. Paddle could have been an Area2D but I wanted to maintain the way it moved by direction and velocity which made it necessary to have it as a KinematicBody2D. In the end I opted to have the paddle as a root KinematicBody2D to handle movement with an Area2D child that was solely there to collide with the ball.
3. A little bit to find where to select region on a sripte atlas. How could I apply color to my object.
4. Making UI. I still don't like how it turned out in the end even though I just made a simple menu and some UI elements on game scene. Mostly I had trouble trying to understand why the pivots for UI elements present in the game scene were locked to top left. It does feel a little bit weird to play around with it, so I definetly need to explore it more. No idea how it would behave on multiple resolutions nor do I intend to try it out on the first game. Let's just not dive into that right now... just not...
5. Bot AI. In the end I programmed the most dumb way possible and don't like it all. Not sure how to make a realistic bot that would actually miss sometimes. I tried to add dealys during actions but it made the paddle move robotically and staggering a lot. Visually horrible.

### What do I think should be changed in the future?
1. Visual. Even though I'm not an artist and this is just a pong game I still think the visual could be way better.
2. Need a confirmation key for game start as well as a simple visual tutorial on how to move the paddles on screen.
3. Fix the bot AI. I do assume the logic I make is simple enough for it to naturally miss the ball but the sizes of the ball and the paddles compared to the whole field don't allow for it. Maybe trying out to balance a better size and then check if the logic makes the bot way to perfect or not. If it does I would need to look for ways to make it stupid.

# INFR1350-FinalExam

## Third-Party Files/Assets

The following assets and files were used in the project but weren't made by myself, instead they were found online.

Yoshi 3D Model:
https://sketchfab.com/3d-models/yoshi-9269f69ae2d646af9bacc5476a02f7fd

Goomba 3D Model
https://sketchfab.com/3d-models/animated-goomba-super-mario-bros-3c91cc4ac8144d82a05309679a3dbbd5

These 3D models came with standard Unity colors as their textures, but each and every part (to my knowledge) was repainted with an actually relevant-to-topic and stylish shader.

## Shader Explanations

### Scrolling Texture Shader

The addition of the 2D scrolling texture shader was implemented so to mimic the fluid motion of water and ocean waves. This was to make the scene appear more homely and nostalgic, drawing reminiscence from classic Mario levels like Dire-Dire Docks. The programmatic part of the shader comes into place with the following parts: we set up our porperties (consisting of mathematical concepts like amplitude, frequency and simple textures of our water), create a subshader consisting of one single fallback, in which we define the shader as a transparent texture (water isn't a solid color) to guarantee more lifelike quality to our water (this already is an improvement above Yoshi's Safiri, as water in that game appears as a plain and solid-color 2D texture). Additionally, it was implemented as such it can have both scrolling textures and wave-like motion, a step-up from the basic shader that can only implement one or the other within one single pass.

### Color Correction Shader

The applied color correction shader uses the basic principles shown in class, through the manipulation of the camera's perception of saturation and hue, one achieves a desired appearance. Using a saturated and low hue LUT, the scene is given warmer colors while keeping the area and viewed scene calm and not overly saturated. The reflection on the water and color of the sky gives the sensation and appearance of a tranquil sunset on the beach without having to at all alter the Unity skybox settings. 

Furthermore, the selected hue and saturation, alongside the chosen contribution of the LUT (desired look is attained with shader contribution settings of 1.77 to 2.01) highlight and emphasize the green of Yoshi and the island.

### Lambert Lighting Shader

The Lambert lighting model shader was added to the project to differentiate the game objects within Yoshi's vicinity (such as himself and the far-away background mountains/hills). The shader diffuses light in a pragmatic and simple manner, allowing for the directional light source of Unity's skybox to illuminate the game objects in a dynamic fashion, rather than them staying a solid color sprite as in the original Yoshi's Safari (in which all game objects stayed practilly the same due to its reliance in 2D sprites).

Furthermore, both of the present characters (Yoshi and the goomba enemy) use different shaders to accentuate a core difference between player and enemy characters, one so core to them that it is displayed in how they look and behave when exposed to light.

### Toon Shader

The games of the Mario series were never meant to be realisitc nor were they meant to sacrifice its classic cartoonish art-style for any kind of 3D installment of the franchsie, as such, it felt only natural to have the main character of this game (recreation) be portrayed in toon shaders.

All of Yoshi's parts are given a cartoonish appearance through the use of toon shaders. the simple implementation of a toon shader allows for the capture of a classic toon, Mario-esque look without giving up the 3D.

The toon shader is a standard toon shader, utilizing light to diffuse it around its edge via a toon ramp texture.

## Gameplay Disclaimer

As there was no reason to showcase motion or any momentum in the project, the release showcases a simple still frame of the game scene. there was no need to add any more gameplay-related scripts or matters due to the simplicity of Yoshi's Safari being a simple walking and pointing matter. No benefit would have been drawn from such a feature in such a small game area. For a larger and more robust game release, it would have been ideal to implement features to ensure player motion and movement, alognside enemy movement and pathfinding. But, in the small amount of time that was given, such a simple scene is more than sufficient at showcasing the shaders and their effect on the scene.

(TL;DR, why add walking and shooting if there is only one tile of floor to walk around)

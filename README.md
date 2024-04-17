# MEEN432Sp2024_wbenz006
Wilson Benz 
UIN:934002938


PROJECT 4 READ ME
WEEK 1: Attempt at combining lateral and longitudinal dynamics. Since velocity in the X direction is found via the previous Project 3 it was attached to the model from Project 2 from the lateral dynamics. Unfortunately there are errors within the model and scripts that I am unable to find out. The variables for X and Y are not being noticed even though I have them set to workspaces and the settings of which have them set to be logged. Initially I thought it may be auto done for logsout configuration but my main.m script does not utilize that function.

HOW TO RUN: Download all files from the Project 4 folder in the repository(variables changed in scripts so these files must be used) and ensure they are all in the same folder. Run the P4init.m and then the main.m file to run with the model.

ERRORS: I have added pictures of some of the errors. Since I don’t have the battery set up yet it should just be using the given velocity of 15 m/s in the init file. Still, the XY graph can’t seem to follow the path desired. In the 2nd driver model that goes to the lateral dynamics there might be a sync error causing the effect to go haywire. Any advice would be great.

# Project 4 Review Request

## Model Tips
1) I would suggest putting the project 2 and project 3 models into two separate subsystems. One for the lateral dynamics body frame and another for the longitudinal dynamics. This separation will make it easier to work through project 4 so it doesn't feel too overwhelming.

2) I would also suggest taking the driver model from both projects and putting them into a single driver model that will output the steering angle (for lateral) and the APP and BPP commands (for long).

3) Talking more about the combination of the driver model, here's some tips on what the inputs to the subsystem should be:
- Inputs: Current X, Current Y, Current Psi, Vx (coming from long subsys), Omega (from lateral, for pure pursuit)
- Outputs: Steering angle, APP and BPP cmd
- In the lateral dynamics portion of the driver model (hopefully pure pursuit logic will be used), you should be utilizing the current state of the vehicle (X,Y,psi), the track waypoints (Xpath,Ypath,psipath), omega, and the desired speed.
where the desired speed should be coming from some sort of speed scheduler. 
- Regarding the speed scheduler, I would recommend using the current state of the vehicle and determine where the vehicle is on the track and adjusts the speed depending if the vehicle is on the straightaway or on the curved sections.
Remember that at the curved sections there is a max speed the vehicle can go before slipping and going off track.
- Now in the long dynamics portion of the driver model, you should use the Vx that comes from the long dynamics block and the desired speed from the speed scheduler. You will also have to add to your regen braking logic as the requirements state that 
the regen and friction braking percentages changes depending on how fast the vehicle is going.
  - Speed < 5 mph: 5% Regen, 95% Friction
  - Speed >= 25 mph: 95% Regen, 5% Friction
  - 5 mph < Speed < 25 mph: Linear increase of Regen, Linear decrease of Friction

4) Talking about the SOC requirements, this will more than likely take place in the SOC calculation in the battery subsystem. Remember, your vehicle should be starting at 80% SOC, so the equation should be:
- SOC = 0.8 - integral(Icell)/C

You're on the right track so I would suggest taking the tips I mentioned and try implementing them! I will go over this more on Friday (Dr. Swamy giving me the whole class time to lecture)

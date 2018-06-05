// Type: RevokeRobFleeca
// Assembly: RobFleeca, Version=1.0.0, Culture=neutral, PublicKeyToken=null
// Assembly location: E:\FiveM\My Create Scripts\Roubo Com Drill-RobFleecaBank.

local rob = false
local robbers = {}
ESX = nil

using GTA;
using GTA.Math;
using GTA.Native;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

public class RobFleeca : Script
{
  private ScriptSettings KeysData;
  private RobFleeca.Driller Drill;
  private List<RobFleeca.Rob> Robs;
  private List<Vector3> Bank_Locations;
  private List<Vector3> EnterExitBank_Locations;
  private List<Vector3> Cam1_Locations;
  private List<Vector3> Cam2_Locations;
  private List<Vector3> Cam3_Locations;
  private List<Vector3> Cam4_Locations;
  private List<Vector3> Cam5_Locations;
  private List<float> Cam1_Heading;
  private List<float> Cam2_Heading;
  private List<float> Cam3_Heading;
  private List<float> Cam4_Heading;
  private List<float> Cam5_Heading;
  private List<Vector3> Teller_Locations;
  private List<float> Teller_Heading;
  private List<Vector3> Hostage1_Locations;
  private List<float> Hostage1_Heading;
  private List<Vector3> Hostage2_Locations;
  private List<float> Hostage2_Heading;
  private List<Vector3> Hostage3_Locations;
  private List<float> Hostage3_Heading;
  private List<Vector3> Teller_Walk_Locations1;
  private List<Vector3> Teller_Walk_Locations2;
  private List<Vector3> FleecaDoor_Locations;
  private List<float> FleecaDoor_Heading;
  private List<Vector3> FleecaVaultDoor_Locations;
  private List<float> FleecaVaultDoor_Heading;
  private List<Vector3> FleecaVaultDoor_KeyPad_Locations;
  private List<Vector3> FleecaVaultDrill_Locations;
  private List<float> FleecaVaultDrill_Heading;
  private List<Vector3> FleecaVaultBoxWall_Locations;
  private List<float> FleecaVaultBoxWall_Heading;
  private List<Vector3> FleecaVaultBoxDoor_Locations;
  private List<float> FleecaVaultBoxDoor_Heading;
  private int MinCash;
  private int MaxCash;
  private int WantedLevel;
  private int Passed_Index;
  private int time;
  private bool run;
  private int Scale;
  private int step;
  private string WhoDied;
  private List<bool> BankAvalible;
  private bool BankRobbed1;
  private bool BankRobbed2;
  private bool BankRobbed3;
  private bool BankRobbed4;
  private bool BankRobbed5;
  private bool BankRobbed6;
  private bool ShowBlips;

  public RobFleeca()
  {
    base.\u002Ector();
    this.BankAvalible.Add(true);
    this.BankAvalible.Add(true);
    this.BankAvalible.Add(true);
    this.BankAvalible.Add(true);
    this.BankAvalible.Add(true);
    this.BankAvalible.Add(true);
    this.Bank_Locations.Add(new Vector3(-2975.3f, 483.17f, 14f));
    this.EnterExitBank_Locations.Add(new Vector3(-2965.7f, 482.64f, 15.91f));
    this.Cam1_Locations.Add(new Vector3(-2962.176f, 486.5187f, 17.38165f));
    this.Cam2_Locations.Add(new Vector3(-2960.813f, 476.3674f, 17.88708f));
    this.Cam3_Locations.Add(new Vector3(-2959.599f, 476.3453f, 17.88706f));
    this.Cam4_Locations.Add(new Vector3(-2958.923f, 478.9213f, 17.67277f));
    this.Cam5_Locations.Add(new Vector3(-2963.956f, 478.9629f, 17.34873f));
    this.Teller_Walk_Locations1.Add(new Vector3(-2960.813f, 477.5f, 17.88708f));
    this.Teller_Walk_Locations2.Add(new Vector3(-2958.3f, 477.7f, 17.88706f));
    this.Teller_Locations.Add(new Vector3(-2960.8f, 482.7f, 15.7f));
    this.Teller_Heading.Add(90f);
    this.Hostage1_Locations.Add(new Vector3(-2964.2f, 486.7f, 14.2f));
    this.Hostage1_Heading.Add(180f);
    this.Hostage2_Locations.Add(new Vector3(-2965.7f, 478.6f, 14.2f));
    this.Hostage2_Heading.Add(-90f);
    this.Hostage3_Locations.Add(new Vector3(-2963f, 481.6f, 14.7f));
    this.Hostage3_Heading.Add(-90f);
    this.FleecaDoor_Locations.Add(new Vector3(-2960.176f, 479.0105f, 15.97056f));
    this.FleecaDoor_Heading.Add(357.5421f);
    this.FleecaVaultDoor_KeyPad_Locations.Add(new Vector3(-2956.3f, 481.6f, 15.8f));
    this.FleecaVaultDoor_Locations.Add(new Vector3(-2958.539f, 482.2706f, 15.83594f));
    this.FleecaVaultDoor_Heading.Add(357.5421f);
    this.FleecaVaultDrill_Locations.Add(new Vector3(-2953.2f, 484.715f, 14.7f));
    this.FleecaVaultDrill_Heading.Add(-92.5f);
    this.FleecaVaultBoxWall_Locations.Add(new Vector3(-2952.2f, 484.3f, 15.88f));
    this.FleecaVaultBoxWall_Heading.Add(-92.5f);
    this.FleecaVaultBoxDoor_Locations.Add(new Vector3(-2952.37f, 484.81f, 17.039f));
    this.FleecaVaultBoxDoor_Heading.Add(-92.5f);
    this.Bank_Locations.Add(new Vector3(-1220.5f, -317.5f, 36.4f));
    this.EnterExitBank_Locations.Add(new Vector3(-1213.96f, -327.28f, 36.8f));
    this.Cam1_Locations.Add(new Vector3(-1209.339f, -329.3076f, 39.4656f));
    this.Cam2_Locations.Add(new Vector3(-1217.521f, -335.4675f, 39.97102f));
    this.Cam3_Locations.Add(new Vector3(-1216.972f, -336.5515f, 39.971f));
    this.Cam4_Locations.Add(new Vector3(-1214.37f, -335.864f, 39.75671f));
    this.Cam5_Locations.Add(new Vector3(-1216.798f, -331.4561f, 39.43268f));
    this.Teller_Walk_Locations1.Add(new Vector3(-1216.35f, -335.1f, 36.66f));
    this.Teller_Walk_Locations2.Add(new Vector3(-1215.4f, -337.2f, 36.6f));
    this.Teller_Locations.Add(new Vector3(-1212.2f, -332.5f, 37.8f));
    this.Teller_Heading.Add(26.8637f);
    this.Hostage1_Locations.Add(new Vector3(-1210.1f, -327.7f, 36.3f));
    this.Hostage1_Heading.Add(115f);
    this.Hostage2_Locations.Add(new Vector3(-1217.9f, -330.1f, 36.3f));
    this.Hostage2_Heading.Add(205f);
    this.Hostage3_Locations.Add(new Vector3(-1214.1f, -331.3f, 36.8f));
    this.Hostage3_Heading.Add(165f);
    this.FleecaDoor_Locations.Add(new Vector3(-1214.905f, -334.7281f, 38.05551f));
    this.FleecaDoor_Heading.Add(296.8637f);
    this.FleecaVaultDoor_KeyPad_Locations.Add(new Vector3(-1210.65f, -336.4f, 37.56f));
    this.FleecaVaultDoor_Locations.Add(new Vector3(-1211.261f, -334.5596f, 37.91989f));
    this.FleecaVaultDoor_Heading.Add(296.8637f);
    this.FleecaVaultDrill_Locations.Add(new Vector3(-1206.572f, -338f, 36.82f));
    this.FleecaVaultDrill_Heading.Add(-152.8f);
    this.FleecaVaultBoxWall_Locations.Add(new Vector3(-1206.43f, -339.1f, 38f));
    this.FleecaVaultBoxWall_Heading.Add(-152.8f);
    this.FleecaVaultBoxDoor_Locations.Add(new Vector3(-1206.072f, -338.69f, 39.159f));
    this.FleecaVaultBoxDoor_Heading.Add(-152.8f);
    this.Bank_Locations.Add(new Vector3(-344.69f, -28.5f, 46.4f));
    this.EnterExitBank_Locations.Add(new Vector3(-349.67f, -46.4f, 49f));
    this.Cam1_Locations.Add(new Vector3(-347.6229f, -51.30733f, 50.72114f));
    this.Cam2_Locations.Add(new Vector3(-357.7383f, -49.69931f, 51.22656f));
    this.Cam3_Locations.Add(new Vector3(-358.1367f, -50.84728f, 51.22655f));
    this.Cam4_Locations.Add(new Vector3(-355.8343f, -52.24216f, 51.01226f));
    this.Cam5_Locations.Add(new Vector3(-354.3498f, -47.43351f, 50.68822f));
    this.Teller_Walk_Locations1.Add(new Vector3(-356.8f, -50.15f, 48.2f));
    this.Teller_Walk_Locations2.Add(new Vector3(-357.6f, -52.4f, 48.2f));
    this.Teller_Locations.Add(new Vector3(-352.6f, -51.6f, 49.2f));
    this.Teller_Heading.Add(-25f);
    this.Hostage1_Locations.Add(new Vector3(-347.2f, -50.4f, 47.55f));
    this.Hostage1_Heading.Add(85f);
    this.Hostage2_Locations.Add(new Vector3(-356.6f, -46.6f, 47.55f));
    this.Hostage2_Heading.Add(-105f);
    this.Hostage3_Locations.Add(new Vector3(-352.1f, -49.2f, 48.1f));
    this.Hostage3_Heading.Add(-195f);
    this.FleecaDoor_Locations.Add(new Vector3(-355.3892f, -51.06769f, 49.31105f));
    this.FleecaDoor_Heading.Add(250.5898f);
    this.FleecaVaultDoor_KeyPad_Locations.Add(new Vector3(-353.7f, -55.3f, 49f));
    this.FleecaVaultDoor_Locations.Add(new Vector3(-352.7365f, -53.57248f, 49.17543f));
    this.FleecaVaultDoor_Heading.Add(250.8598f);
    this.FleecaVaultDrill_Locations.Add(new Vector3(-351.918f, -59.38f, 48.05f));
    this.FleecaVaultDrill_Heading.Add(160.75f);
    this.FleecaVaultBoxWall_Locations.Add(new Vector3(-352.6f, -60.2f, 49.225f));
    this.FleecaVaultBoxWall_Heading.Add(160.75f);
    this.FleecaVaultBoxDoor_Locations.Add(new Vector3(-352.06f, -60.18f, 50.384f));
    this.FleecaVaultBoxDoor_Heading.Add(160.75f);
    this.Bank_Locations.Add(new Vector3(318.1f, -266.1f, 52.6f));
    this.EnterExitBank_Locations.Add(new Vector3(315.3f, -276.1f, 54f));
    this.Cam1_Locations.Add(new Vector3(317.5102f, -280.554f, 55.84935f));
    this.Cam2_Locations.Add(new Vector3(307.4242f, -278.7708f, 56.35477f));
    this.Cam3_Locations.Add(new Vector3(307.0059f, -279.9117f, 56.35476f));
    this.Cam4_Locations.Add(new Vector3(309.2838f, -281.3463f, 56.14047f));
    this.Cam5_Locations.Add(new Vector3(310.8164f, -276.5641f, 55.81643f));
    this.Teller_Walk_Locations1.Add(new Vector3(308.5f, -278.85f, 53.3f));
    this.Teller_Walk_Locations2.Add(new Vector3(307.7f, -281.3f, 53.3f));
    this.Teller_Locations.Add(new Vector3(313.6f, -280f, 54.2f));
    this.Teller_Heading.Add(-25f);
    this.Hostage1_Locations.Add(new Vector3(318.3f, -278.65f, 52.65f));
    this.Hostage1_Heading.Add(70f);
    this.Hostage2_Locations.Add(new Vector3(311.5f, -274.9f, 52.65f));
    this.Hostage2_Heading.Add(-195f);
    this.Hostage3_Locations.Add(new Vector3(314.4f, -278.6f, 53.2f));
    this.Hostage3_Heading.Add(-195f);
    this.FleecaDoor_Locations.Add(new Vector3(309.7491f, -280.1797f, 54.43926f));
    this.FleecaDoor_Heading.Add(249.866f);
    this.FleecaVaultDoor_KeyPad_Locations.Add(new Vector3(311.35f, -284.45f, 54f));
    this.FleecaVaultDoor_Locations.Add(new Vector3(312.358f, -282.7302f, 54.30365f));
    this.FleecaVaultDoor_Heading.Add(249.866f);
    this.FleecaVaultDrill_Locations.Add(new Vector3(313.078f, -288.54f, 53.2f));
    this.FleecaVaultDrill_Heading.Add(160f);
    this.FleecaVaultBoxWall_Locations.Add(new Vector3(312.39f, -289.35f, 54.38f));
    this.FleecaVaultBoxWall_Heading.Add(160f);
    this.FleecaVaultBoxDoor_Locations.Add(new Vector3(312.928f, -289.339f, 55.539f));
    this.FleecaVaultBoxDoor_Heading.Add(160f);
    this.Bank_Locations.Add(new Vector3(1175.4f, 2690.9f, 36.6f));
    this.EnterExitBank_Locations.Add(new Vector3(1175.2f, 2703.75f, 38f));
    this.Cam1_Locations.Add(new Vector3(1171.454f, 2707.45f, 39.77259f));
    this.Cam2_Locations.Add(new Vector3(1181.537f, 2708.842f, 40.27802f));
    this.Cam3_Locations.Add(new Vector3(1181.537f, 2710.057f, 40.278f));
    this.Cam4_Locations.Add(new Vector3(1178.905f, 2710.62f, 40.06371f));
    this.Cam5_Locations.Add(new Vector3(1179.079f, 2705.591f, 39.73968f));
    this.Teller_Walk_Locations1.Add(new Vector3(1180.4f, 2708.5f, 38f));
    this.Teller_Walk_Locations2.Add(new Vector3(1180.4f, 2711.2f, 38f));
    this.Teller_Locations.Add(new Vector3(1175f, 2709f, 38f));
    this.Teller_Heading.Add(180f);
    this.Hostage1_Locations.Add(new Vector3(1171.4f, 2705.1f, 36.59f));
    this.Hostage1_Heading.Add(-90f);
    this.Hostage2_Locations.Add(new Vector3(1179.4f, 2703.8f, 36.59f));
    this.Hostage2_Heading.Add(0.0f);
    this.Hostage3_Locations.Add(new Vector3(1175f, 2706.5f, 37.145f));
    this.Hostage3_Heading.Add(0.0f);
    this.FleecaDoor_Locations.Add(new Vector3(1178.87f, 2709.365f, 38.36251f));
    this.FleecaDoor_Heading.Add(90f);
    this.FleecaVaultDoor_KeyPad_Locations.Add(new Vector3(1175.9f, 2712.8f, 38f));
    this.FleecaVaultDoor_Locations.Add(new Vector3(1175.542f, 2710.861f, 38.22689f));
    this.FleecaVaultDoor_Heading.Add(90f);
    this.FleecaVaultDrill_Locations.Add(new Vector3(1172.855f, 2716.1f, 37.14f));
    this.FleecaVaultDrill_Heading.Add(0.0f);
    this.FleecaVaultBoxWall_Locations.Add(new Vector3(1173.23f, 2717.1f, 38.32f));
    this.FleecaVaultBoxWall_Heading.Add(0.0f);
    this.FleecaVaultBoxDoor_Locations.Add(new Vector3(1172.725f, 2716.91f, 39.48f));
    this.FleecaVaultBoxDoor_Heading.Add(0.0f);
    this.Bank_Locations.Add(new Vector3(153.2f, -1029f, 28f));
    this.EnterExitBank_Locations.Add(new Vector3(151.3f, -1036.6f, 29f));
    this.Cam1_Locations.Add(new Vector3(153.1795f, -1042.053f, 31.05264f));
    this.Cam2_Locations.Add(new Vector3(143.0941f, -1040.403f, 31.55806f));
    this.Cam3_Locations.Add(new Vector3(142.5754f, -1041.543f, 31.55805f));
    this.Cam4_Locations.Add(new Vector3(144.9529f, -1042.979f, 1003f / 32f));
    this.Cam5_Locations.Add(new Vector3(146.5221f, -1038.197f, 31.01972f));
    this.Teller_Walk_Locations1.Add(new Vector3(144.7f, -1040.6f, 29f));
    this.Teller_Walk_Locations2.Add(new Vector3(143.3f, -1043.2f, 29f));
    this.Teller_Locations.Add(new Vector3(149.7f, -1042.4f, 29f));
    this.Teller_Heading.Add(0.0f);
    this.Hostage1_Locations.Add(new Vector3(154f, -1040.3f, 27.85f));
    this.Hostage1_Heading.Add(69.8462f);
    this.Hostage2_Locations.Add(new Vector3(146.7f, -1036.5f, 27.85f));
    this.Hostage2_Heading.Add(159.8462f);
    this.Hostage3_Locations.Add(new Vector3(150f, -1040.6f, 28.4f));
    this.Hostage3_Heading.Add(159.8462f);
    this.FleecaDoor_Locations.Add(new Vector3(145.4186f, -1041.813f, 29.64255f));
    this.FleecaDoor_Heading.Add(249.8462f);
    this.FleecaVaultDoor_KeyPad_Locations.Add(new Vector3(146.9f, -1046f, 29f));
    this.FleecaVaultDoor_Locations.Add(new Vector3(148.0266f, -1044.364f, 29.50693f));
    this.FleecaVaultDoor_Heading.Add(249.8462f);
    this.FleecaVaultDrill_Locations.Add(new Vector3(148.748f, -1050.2f, 28.365f));
    this.FleecaVaultDrill_Heading.Add(159.8462f);
    this.FleecaVaultBoxWall_Locations.Add(new Vector3(148.05f, -1051f, 29.55f));
    this.FleecaVaultBoxWall_Heading.Add(159.8462f);
    this.FleecaVaultBoxDoor_Locations.Add(new Vector3(148.59f, -1051f, 30.7f));
    this.FleecaVaultBoxDoor_Heading.Add(159.8462f);
    this.KeysData = ScriptSettings.Load("scripts//RobFleeca.ini");
    this.MinCash = (int) this.KeysData.GetValue<int>("settings", nameof (MinCash), (M0) 25000);
    this.MaxCash = (int) this.KeysData.GetValue<int>("settings", nameof (MaxCash), (M0) 250000);
    this.WantedLevel = (int) this.KeysData.GetValue<int>("settings", nameof (WantedLevel), (M0) 4);
    this.ShowBlips = (bool) this.KeysData.GetValue<bool>("settings", nameof (ShowBlips), (M0) 0);
    this.BankRobbed1 = (bool) this.KeysData.GetValue<bool>("settings", nameof (BankRobbed1), (M0) 0);
    this.BankRobbed2 = (bool) this.KeysData.GetValue<bool>("settings", nameof (BankRobbed2), (M0) 0);
    this.BankRobbed3 = (bool) this.KeysData.GetValue<bool>("settings", nameof (BankRobbed3), (M0) 0);
    this.BankRobbed4 = (bool) this.KeysData.GetValue<bool>("settings", nameof (BankRobbed4), (M0) 0);
    this.BankRobbed5 = (bool) this.KeysData.GetValue<bool>("settings", nameof (BankRobbed5), (M0) 0);
    this.BankRobbed6 = (bool) this.KeysData.GetValue<bool>("settings", nameof (BankRobbed6), (M0) 0);
    Blip[] activeBlips = World.GetActiveBlips();
    if (((IEnumerable<Blip>) activeBlips).Count<Blip>() > 0)
    {
      for (int index1 = 0; index1 < ((IEnumerable<Blip>) activeBlips).Count<Blip>(); ++index1)
      {
        for (int index2 = 0; index2 < this.Bank_Locations.Count; ++index2)
        {
          if (Vector3.op_Equality(activeBlips[index1].get_Position(), this.Bank_Locations[index2]))
            activeBlips[index1].Remove();
        }
      }
    }
    if (this.ShowBlips)
    {
      for (int index = 0; index < this.Bank_Locations.Count; ++index)
      {
        Blip blip = World.CreateBlip(this.Bank_Locations[index]);
        blip.set_Sprite((BlipSprite) 434);
        blip.set_Color((BlipColor) 2);
        blip.set_IsShortRange(true);
        blip.set_Name("FLEECA BANK");
      }
    }
    this.add_Tick(new EventHandler(this.OnTick));
    this.add_KeyUp(new KeyEventHandler(this.OnKeyUp));
  }

  public unsafe void OnTick(object o, EventArgs e)
  {
    if (Function.Call<bool>((Hash) 6342219533232326959L, new InputArgument[2]
    {
      InputArgument.op_Implicit(2),
      InputArgument.op_Implicit(175)
    }) != null && Game.get_Player().get_WantedLevel() < 1 && (this.Robs.Count < 1 && Function.Call<int>((Hash) 2675767815307398015L, new InputArgument[0]) >= 7) && Function.Call<int>((Hash) 2675767815307398015L, new InputArgument[0]) < 18)
    {
      for (int list_index = 0; list_index < this.Bank_Locations.Count; ++list_index)
      {
        Vector3 bankLocation = this.Bank_Locations[list_index];
        if ((double) ((Vector3) ref bankLocation).DistanceTo(((Entity) Game.get_Player().get_Character()).get_Position()) < 12.0 && this.BankAvalible[list_index])
          this.Robs.Add(new RobFleeca.Rob(list_index));
      }
    }
    if (this.Robs.Count > 0)
    {
      switch (this.Robs[0].Objective_Index)
      {
        case 0:
          Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
          {
            InputArgument.op_Implicit(this.Robs[0].Checkpoint_Sound),
            InputArgument.op_Implicit("CHECKPOINT_PERFECT"),
            InputArgument.op_Implicit("HUD_MINI_GAME_SOUNDSET"),
            InputArgument.op_Implicit(1)
          });
          Ped closestPed1 = World.GetClosestPed(this.Teller_Locations[this.Robs[0].List_Index], 1f);
          if (Entity.op_Inequality((Entity) closestPed1, (Entity) null) && !((Entity) closestPed1).get_IsDead())
          {
            this.Robs[0].Teller = closestPed1;
            ((Entity) closestPed1).set_IsPersistent(true);
          }
          else
          {
            int num = (int) Function.Call<int>((Hash) -3084046921057706712L, new InputArgument[2]
            {
              InputArgument.op_Implicit(0),
              InputArgument.op_Implicit(100)
            });
            string str = "a_f_y_business_03";
            if (num >= 50)
              str = "a_f_y_business_02";
            if (num > 50)
              str = "a_m_y_business_02";
            Model model;
            ((Model) ref model).\u002Ector(str);
            ((Model) ref model).Request(250);
            if (((Model) ref model).get_IsInCdImage() && ((Model) ref model).get_IsValid())
            {
              while (!((Model) ref model).get_IsLoaded())
                Script.Wait(50);
              Ped ped = World.CreatePed(model, this.Teller_Locations[this.Robs[0].List_Index], this.Teller_Heading[this.Robs[0].List_Index]);
              this.Robs[0].Teller = ped;
              ((Entity) ped).set_IsPersistent(true);
              ped.RandomizeOutfit();
              Function.Call((Hash) -410112915285389561L, new InputArgument[9]
              {
                InputArgument.op_Implicit(ped),
                InputArgument.op_Implicit("WORLD_HUMAN_CLIPBOARD"),
                InputArgument.op_Implicit((float) this.Teller_Locations[this.Robs[0].List_Index].X),
                InputArgument.op_Implicit((float) this.Teller_Locations[this.Robs[0].List_Index].Y),
                InputArgument.op_Implicit((float) this.Teller_Locations[this.Robs[0].List_Index].Z),
                InputArgument.op_Implicit(this.Teller_Heading[this.Robs[0].List_Index]),
                InputArgument.op_Implicit(-1),
                InputArgument.op_Implicit(0),
                InputArgument.op_Implicit(1)
              });
            }
            ((Model) ref model).MarkAsNoLongerNeeded();
          }
          Ped closestPed2 = World.GetClosestPed(this.Hostage1_Locations[this.Robs[0].List_Index], 1f);
          if (Entity.op_Inequality((Entity) closestPed2, (Entity) null))
          {
            this.Robs[0].Hostage1 = closestPed2;
            this.Robs[0].Hostage1.set_CanBeTargetted(false);
            ((Entity) closestPed2).set_IsPersistent(true);
          }
          else
          {
            int num = (int) Function.Call<int>((Hash) -3084046921057706712L, new InputArgument[2]
            {
              InputArgument.op_Implicit(1),
              InputArgument.op_Implicit(7)
            });
            string str = "a_m_y_stbla_01";
            switch (num)
            {
              case 1:
                str = "a_m_y_stbla_01";
                break;
              case 2:
                str = "a_m_y_stbla_02";
                break;
              case 3:
                str = "a_f_y_tourist_01";
                break;
              case 4:
                str = "a_f_y_tourist_02";
                break;
              case 5:
                str = "a_m_m_stlat_02";
                break;
              case 6:
                str = "a_m_y_genstreet_01";
                break;
              case 7:
                str = "a_f_y_business_03";
                break;
            }
            Model model;
            ((Model) ref model).\u002Ector(str);
            ((Model) ref model).Request(250);
            if (((Model) ref model).get_IsInCdImage() && ((Model) ref model).get_IsValid())
            {
              while (!((Model) ref model).get_IsLoaded())
                Script.Wait(50);
              Ped ped = World.CreatePed(model, this.Hostage1_Locations[this.Robs[0].List_Index], this.Hostage1_Heading[this.Robs[0].List_Index]);
              Function.Call((Hash) -410112915285389561L, new InputArgument[9]
              {
                InputArgument.op_Implicit(ped),
                InputArgument.op_Implicit("PROP_HUMAN_SEAT_BENCH"),
                InputArgument.op_Implicit((float) ((Entity) ped).get_Position().X),
                InputArgument.op_Implicit((float) ((Entity) ped).get_Position().Y),
                InputArgument.op_Implicit((float) ((Entity) ped).get_Position().Z),
                InputArgument.op_Implicit(this.Hostage1_Heading[this.Robs[0].List_Index]),
                InputArgument.op_Implicit(-1),
                InputArgument.op_Implicit(1),
                InputArgument.op_Implicit(0)
              });
              this.Robs[0].Hostage1 = ped;
              this.Robs[0].Hostage1.set_CanBeTargetted(false);
              ((Entity) ped).set_IsPersistent(true);
              ped.RandomizeOutfit();
            }
            ((Model) ref model).MarkAsNoLongerNeeded();
          }
          Ped closestPed3 = World.GetClosestPed(this.Hostage2_Locations[this.Robs[0].List_Index], 1f);
          if (Entity.op_Inequality((Entity) closestPed3, (Entity) null))
          {
            this.Robs[0].Hostage2 = closestPed3;
            this.Robs[0].Hostage2.set_CanBeTargetted(false);
            ((Entity) closestPed3).set_IsPersistent(true);
          }
          else
          {
            int num = (int) Function.Call<int>((Hash) -3084046921057706712L, new InputArgument[2]
            {
              InputArgument.op_Implicit(1),
              InputArgument.op_Implicit(7)
            });
            string str = "a_m_y_stbla_01";
            switch (num)
            {
              case 1:
                str = "a_m_y_stbla_01";
                break;
              case 2:
                str = "a_m_y_stbla_02";
                break;
              case 3:
                str = "a_f_y_tourist_01";
                break;
              case 4:
                str = "a_f_y_tourist_02";
                break;
              case 5:
                str = "a_m_m_stlat_02";
                break;
              case 6:
                str = "a_m_y_genstreet_01";
                break;
              case 7:
                str = "a_f_y_business_03";
                break;
            }
            Model model;
            ((Model) ref model).\u002Ector(str);
            ((Model) ref model).Request(250);
            if (((Model) ref model).get_IsInCdImage() && ((Model) ref model).get_IsValid())
            {
              while (!((Model) ref model).get_IsLoaded())
                Script.Wait(50);
              Ped ped = World.CreatePed(model, this.Hostage2_Locations[this.Robs[0].List_Index], this.Hostage2_Heading[this.Robs[0].List_Index]);
              Function.Call((Hash) -410112915285389561L, new InputArgument[9]
              {
                InputArgument.op_Implicit(ped),
                InputArgument.op_Implicit("PROP_HUMAN_SEAT_BENCH"),
                InputArgument.op_Implicit((float) ((Entity) ped).get_Position().X),
                InputArgument.op_Implicit((float) ((Entity) ped).get_Position().Y),
                InputArgument.op_Implicit((float) ((Entity) ped).get_Position().Z),
                InputArgument.op_Implicit(this.Hostage2_Heading[this.Robs[0].List_Index]),
                InputArgument.op_Implicit(-1),
                InputArgument.op_Implicit(1),
                InputArgument.op_Implicit(0)
              });
              this.Robs[0].Hostage2 = ped;
              this.Robs[0].Hostage2.set_CanBeTargetted(false);
              ((Entity) ped).set_IsPersistent(true);
              ped.RandomizeOutfit();
            }
            ((Model) ref model).MarkAsNoLongerNeeded();
          }
          Ped closestPed4 = World.GetClosestPed(this.Hostage3_Locations[this.Robs[0].List_Index], 1f);
          if (Entity.op_Inequality((Entity) closestPed4, (Entity) null))
          {
            this.Robs[0].Hostage3 = closestPed4;
            this.Robs[0].Hostage3.set_CanBeTargetted(false);
            ((Entity) closestPed4).set_IsPersistent(true);
          }
          else
          {
            int num = (int) Function.Call<int>((Hash) -3084046921057706712L, new InputArgument[2]
            {
              InputArgument.op_Implicit(1),
              InputArgument.op_Implicit(7)
            });
            string str = "a_m_y_stbla_01";
            switch (num)
            {
              case 1:
                str = "a_m_y_stbla_01";
                break;
              case 2:
                str = "a_m_y_stbla_02";
                break;
              case 3:
                str = "a_f_y_tourist_01";
                break;
              case 4:
                str = "a_f_y_tourist_02";
                break;
              case 5:
                str = "a_m_m_stlat_02";
                break;
              case 6:
                str = "a_m_y_genstreet_01";
                break;
              case 7:
                str = "a_f_y_business_03";
                break;
            }
            Model model;
            ((Model) ref model).\u002Ector(str);
            ((Model) ref model).Request(250);
            if (((Model) ref model).get_IsInCdImage() && ((Model) ref model).get_IsValid())
            {
              while (!((Model) ref model).get_IsLoaded())
                Script.Wait(50);
              Ped ped = World.CreatePed(model, this.Hostage3_Locations[this.Robs[0].List_Index], this.Hostage3_Heading[this.Robs[0].List_Index]);
              Function.Call((Hash) -410112915285389561L, new InputArgument[9]
              {
                InputArgument.op_Implicit(ped),
                InputArgument.op_Implicit("PROP_HUMAN_STAND_IMPATIENT"),
                InputArgument.op_Implicit((float) ((Entity) ped).get_Position().X),
                InputArgument.op_Implicit((float) ((Entity) ped).get_Position().Y),
                InputArgument.op_Implicit((float) ((Entity) ped).get_Position().Z),
                InputArgument.op_Implicit(this.Hostage3_Heading[this.Robs[0].List_Index]),
                InputArgument.op_Implicit(-1),
                InputArgument.op_Implicit(0),
                InputArgument.op_Implicit(0)
              });
              this.Robs[0].Hostage3 = ped;
              this.Robs[0].Hostage3.set_CanBeTargetted(false);
              ((Entity) ped).set_IsPersistent(true);
              ped.RandomizeOutfit();
            }
            ((Model) ref model).MarkAsNoLongerNeeded();
          }
          Prop[] nearbyProps1 = World.GetNearbyProps(this.Cam1_Locations[this.Robs[0].List_Index], 0.5f);
          if (((IEnumerable<Prop>) nearbyProps1).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps1).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(168901740)) || Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1340405475)) || (Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1007354661)) || Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1842407088))))
              {
                this.Robs[0].Cam1 = nearbyProps1[index];
                ((Entity) this.Robs[0].Cam1).AddBlip();
                ((Entity) this.Robs[0].Cam1).get_CurrentBlip().set_Color((BlipColor) 1);
                ((Entity) this.Robs[0].Cam1).get_CurrentBlip().set_IsFlashing(false);
                ((Entity) this.Robs[0].Cam1).get_CurrentBlip().set_Scale(0.65f);
              }
            }
          }
          Prop[] nearbyProps2 = World.GetNearbyProps(this.Cam2_Locations[this.Robs[0].List_Index], 0.5f);
          if (((IEnumerable<Prop>) nearbyProps2).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps2).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps2[index]).get_Model(), Model.op_Implicit(168901740)) || Model.op_Equality(((Entity) nearbyProps2[index]).get_Model(), Model.op_Implicit(-1340405475)) || (Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1007354661)) || Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1842407088))))
              {
                this.Robs[0].Cam2 = nearbyProps2[index];
                ((Entity) this.Robs[0].Cam2).AddBlip();
                ((Entity) this.Robs[0].Cam2).get_CurrentBlip().set_Color((BlipColor) 1);
                ((Entity) this.Robs[0].Cam2).get_CurrentBlip().set_IsFlashing(false);
                ((Entity) this.Robs[0].Cam2).get_CurrentBlip().set_Scale(0.65f);
              }
            }
          }
          Prop[] nearbyProps3 = World.GetNearbyProps(this.Cam3_Locations[this.Robs[0].List_Index], 0.5f);
          if (((IEnumerable<Prop>) nearbyProps3).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps3).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps3[index]).get_Model(), Model.op_Implicit(168901740)) || Model.op_Equality(((Entity) nearbyProps3[index]).get_Model(), Model.op_Implicit(-1340405475)) || (Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1007354661)) || Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1842407088))))
              {
                this.Robs[0].Cam3 = nearbyProps3[index];
                ((Entity) this.Robs[0].Cam3).AddBlip();
                ((Entity) this.Robs[0].Cam3).get_CurrentBlip().set_Color((BlipColor) 1);
                ((Entity) this.Robs[0].Cam3).get_CurrentBlip().set_IsFlashing(false);
                ((Entity) this.Robs[0].Cam3).get_CurrentBlip().set_Scale(0.65f);
              }
            }
          }
          Prop[] nearbyProps4 = World.GetNearbyProps(this.Cam4_Locations[this.Robs[0].List_Index], 0.5f);
          if (((IEnumerable<Prop>) nearbyProps4).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps4).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps4[index]).get_Model(), Model.op_Implicit(168901740)) || Model.op_Equality(((Entity) nearbyProps4[index]).get_Model(), Model.op_Implicit(-1340405475)) || (Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1007354661)) || Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1842407088))))
              {
                this.Robs[0].Cam4 = nearbyProps4[index];
                ((Entity) this.Robs[0].Cam4).AddBlip();
                ((Entity) this.Robs[0].Cam4).get_CurrentBlip().set_Color((BlipColor) 1);
                ((Entity) this.Robs[0].Cam4).get_CurrentBlip().set_IsFlashing(false);
                ((Entity) this.Robs[0].Cam4).get_CurrentBlip().set_Scale(0.65f);
              }
            }
          }
          Prop[] nearbyProps5 = World.GetNearbyProps(this.Cam5_Locations[this.Robs[0].List_Index], 0.5f);
          if (((IEnumerable<Prop>) nearbyProps5).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps5).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps5[index]).get_Model(), Model.op_Implicit(168901740)) || Model.op_Equality(((Entity) nearbyProps5[index]).get_Model(), Model.op_Implicit(-1340405475)) || (Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1007354661)) || Model.op_Equality(((Entity) nearbyProps1[index]).get_Model(), Model.op_Implicit(-1842407088))))
              {
                this.Robs[0].Cam5 = nearbyProps5[index];
                ((Entity) this.Robs[0].Cam5).AddBlip();
                ((Entity) this.Robs[0].Cam5).get_CurrentBlip().set_Color((BlipColor) 1);
                ((Entity) this.Robs[0].Cam5).get_CurrentBlip().set_IsFlashing(false);
                ((Entity) this.Robs[0].Cam5).get_CurrentBlip().set_Scale(0.65f);
              }
            }
          }
          Prop[] nearbyProps6 = World.GetNearbyProps(this.FleecaDoor_Locations[this.Robs[0].List_Index], 0.5f);
          if (((IEnumerable<Prop>) nearbyProps6).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps6).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps6[index]).get_Model(), Model.op_Implicit(-131754413)))
                ((Entity) nearbyProps6[index]).set_Heading(this.FleecaDoor_Heading[this.Robs[0].List_Index]);
            }
          }
          Prop[] nearbyProps7 = World.GetNearbyProps(this.FleecaVaultDoor_Locations[this.Robs[0].List_Index], 1.5f);
          if (((IEnumerable<Prop>) nearbyProps7).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps7).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps7[index]).get_Model(), Model.op_Implicit(2121050683)) || Model.op_Equality(((Entity) nearbyProps7[index]).get_Model(), Model.op_Implicit(-63539571)))
                ((Entity) nearbyProps7[index]).Delete();
            }
          }
          Model model1;
          ((Model) ref model1).\u002Ector("hei_prop_heist_sec_door");
          ((Model) ref model1).Request(250);
          if (((Model) ref model1).get_IsInCdImage() && ((Model) ref model1).get_IsValid())
          {
            while (!((Model) ref model1).get_IsLoaded())
              Script.Wait(50);
            ((Entity) World.CreateProp(model1, new Vector3((float) this.FleecaVaultDoor_Locations[this.Robs[0].List_Index].X, (float) this.FleecaVaultDoor_Locations[this.Robs[0].List_Index].Y, (float) (this.FleecaVaultDoor_Locations[this.Robs[0].List_Index].Z - 1.20000004768372)), new Vector3(0.0f, 0.0f, this.FleecaVaultDoor_Heading[this.Robs[0].List_Index]), true, false)).set_FreezePosition(true);
          }
          ((Model) ref model1).MarkAsNoLongerNeeded();
          Prop[] nearbyProps8 = World.GetNearbyProps(this.FleecaVaultBoxWall_Locations[this.Robs[0].List_Index], 1f);
          if (((IEnumerable<Prop>) nearbyProps8).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps8).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps8[index]).get_Model(), Model.op_Implicit(152330975)))
                ((Entity) nearbyProps8[index]).Delete();
            }
          }
          Model model2;
          ((Model) ref model2).\u002Ector("hei_prop_heist_safedeposit");
          ((Model) ref model2).Request(250);
          if (((Model) ref model2).get_IsInCdImage() && ((Model) ref model2).get_IsValid())
          {
            while (!((Model) ref model2).get_IsLoaded())
              Script.Wait(50);
            Prop prop = World.CreateProp(model2, new Vector3((float) this.FleecaVaultBoxWall_Locations[this.Robs[0].List_Index].X, (float) this.FleecaVaultBoxWall_Locations[this.Robs[0].List_Index].Y, (float) (this.FleecaVaultBoxWall_Locations[this.Robs[0].List_Index].Z - 1.20000004768372)), new Vector3(0.0f, 0.0f, this.FleecaVaultBoxWall_Heading[this.Robs[0].List_Index]), true, false);
            this.Robs[0].BoxWall = prop;
            ((Entity) prop).set_FreezePosition(true);
          }
          ((Model) ref model2).MarkAsNoLongerNeeded();
          Prop[] nearbyProps9 = World.GetNearbyProps(this.FleecaVaultBoxDoor_Locations[this.Robs[0].List_Index], 1.5f);
          if (((IEnumerable<Prop>) nearbyProps9).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps9).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps9[index]).get_Model(), Model.op_Implicit(-812777085)))
                ((Entity) nearbyProps9[index]).Delete();
            }
          }
          Model model3;
          ((Model) ref model3).\u002Ector("hei_prop_heist_safedepdoor");
          ((Model) ref model3).Request(250);
          if (((Model) ref model3).get_IsInCdImage() && ((Model) ref model3).get_IsValid())
          {
            while (!((Model) ref model3).get_IsLoaded())
              Script.Wait(50);
            Prop prop = World.CreateProp(model3, new Vector3((float) this.FleecaVaultBoxDoor_Locations[this.Robs[0].List_Index].X, (float) this.FleecaVaultBoxDoor_Locations[this.Robs[0].List_Index].Y, (float) (this.FleecaVaultBoxDoor_Locations[this.Robs[0].List_Index].Z - 1.20000004768372)), new Vector3(0.0f, 0.0f, this.FleecaVaultBoxDoor_Heading[this.Robs[0].List_Index]), true, false);
            this.Robs[0].BoxDoor = prop;
            ((Entity) prop).set_FreezePosition(true);
          }
          ((Model) ref model3).MarkAsNoLongerNeeded();
          Prop[] nearbyProps10 = World.GetNearbyProps(this.FleecaVaultBoxDoor_Locations[this.Robs[0].List_Index], 1.5f);
          if (((IEnumerable<Prop>) nearbyProps10).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps10).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps10[index]).get_Model(), Model.op_Implicit(264881854)))
                ((Entity) nearbyProps10[index]).Delete();
            }
          }
          Model model4;
          ((Model) ref model4).\u002Ector("p_cash_envelope_01_s");
          ((Model) ref model4).Request(250);
          if (((Model) ref model4).get_IsInCdImage() && ((Model) ref model4).get_IsValid())
          {
            while (!((Model) ref model4).get_IsLoaded())
              Script.Wait(50);
            Prop prop = World.CreateProp(model4, Vector3.op_Addition(Vector3.op_Addition(Vector3.op_Addition(((Entity) this.Robs[0].BoxDoor).get_Position(), Vector3.op_Multiply(((Entity) this.Robs[0].BoxDoor).get_ForwardVector(), 0.12f)), Vector3.op_Multiply(((Entity) this.Robs[0].BoxDoor).get_RightVector(), 0.15f)), Vector3.op_Multiply(((Entity) this.Robs[0].BoxDoor).get_UpVector(), -0.1f)), new Vector3(90f, 45f, ((Entity) this.Robs[0].BoxDoor).get_Heading()), true, false);
            this.Robs[0].CashEnvelope = prop;
            ((Entity) prop).set_FreezePosition(true);
          }
          ((Model) ref model4).MarkAsNoLongerNeeded();
          UI.ShowSubtitle("Shoot the ~y~Cameras.", 30000);
          this.Robs[0].Objective_Index = 1;
          break;
        case 1:
          UI.ShowSubtitle("Shoot the ~y~Cameras.", 1000);
          if (Entity.op_Inequality((Entity) this.Robs[0].Cam1, (Entity) null) && ((Entity) this.Robs[0].Cam1).get_Health() < 900)
          {
            ((Entity) this.Robs[0].Cam1).get_CurrentBlip().Remove();
            ((Entity) this.Robs[0].Cam1).MarkAsNoLongerNeeded();
          }
          if (Entity.op_Inequality((Entity) this.Robs[0].Cam2, (Entity) null) && ((Entity) this.Robs[0].Cam2).get_Health() < 900)
          {
            ((Entity) this.Robs[0].Cam2).get_CurrentBlip().Remove();
            ((Entity) this.Robs[0].Cam2).MarkAsNoLongerNeeded();
          }
          if (Entity.op_Inequality((Entity) this.Robs[0].Cam3, (Entity) null) && ((Entity) this.Robs[0].Cam3).get_Health() < 900)
          {
            ((Entity) this.Robs[0].Cam3).get_CurrentBlip().Remove();
            ((Entity) this.Robs[0].Cam3).MarkAsNoLongerNeeded();
          }
          if (Entity.op_Inequality((Entity) this.Robs[0].Cam4, (Entity) null) && ((Entity) this.Robs[0].Cam4).get_Health() < 900)
          {
            ((Entity) this.Robs[0].Cam4).get_CurrentBlip().Remove();
            ((Entity) this.Robs[0].Cam4).MarkAsNoLongerNeeded();
          }
          if (Entity.op_Inequality((Entity) this.Robs[0].Cam5, (Entity) null) && ((Entity) this.Robs[0].Cam5).get_Health() < 900)
          {
            ((Entity) this.Robs[0].Cam5).get_CurrentBlip().Remove();
            ((Entity) this.Robs[0].Cam5).MarkAsNoLongerNeeded();
          }
          if (Entity.op_Inequality((Entity) this.Robs[0].Cam1, (Entity) null) && Entity.op_Inequality((Entity) this.Robs[0].Cam2, (Entity) null) && (Entity.op_Inequality((Entity) this.Robs[0].Cam3, (Entity) null) && Entity.op_Inequality((Entity) this.Robs[0].Cam4, (Entity) null)) && (Entity.op_Inequality((Entity) this.Robs[0].Cam5, (Entity) null) && ((Entity) this.Robs[0].Cam1).get_Health() < 900 && (((Entity) this.Robs[0].Cam2).get_Health() < 900 && ((Entity) this.Robs[0].Cam3).get_Health() < 900)) && (((Entity) this.Robs[0].Cam4).get_Health() < 900 && ((Entity) this.Robs[0].Cam5).get_Health() < 900))
          {
            this.Robs[0].Objective_Index = 2;
            ((Entity) this.Robs[0].Teller).AddBlip();
            ((Entity) this.Robs[0].Teller).get_CurrentBlip().set_Color((BlipColor) 3);
            ((Entity) this.Robs[0].Teller).get_CurrentBlip().set_Scale(0.75f);
            Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
            {
              InputArgument.op_Implicit(this.Robs[0].Checkpoint_Sound),
              InputArgument.op_Implicit("CHECKPOINT_PERFECT"),
              InputArgument.op_Implicit("HUD_MINI_GAME_SOUNDSET"),
              InputArgument.op_Implicit(1)
            });
          }
          if (Entity.op_Equality((Entity) this.Robs[0].Cam1, (Entity) null) || Entity.op_Equality((Entity) this.Robs[0].Cam2, (Entity) null) && Entity.op_Equality((Entity) this.Robs[0].Cam3, (Entity) null) || (Entity.op_Equality((Entity) this.Robs[0].Cam4, (Entity) null) | Entity.op_Equality((Entity) this.Robs[0].Cam5, (Entity) null) || ((Entity) this.Robs[0].Cam1).get_Health() < 900 || (((Entity) this.Robs[0].Cam2).get_Health() < 900 || ((Entity) this.Robs[0].Cam3).get_Health() < 900)) || (((Entity) this.Robs[0].Cam4).get_Health() < 900 || ((Entity) this.Robs[0].Cam5).get_Health() < 900))
          {
            Function.Call((Hash) 1465062155054416227L, new InputArgument[1]
            {
              InputArgument.op_Implicit(2)
            });
            if (!this.Robs[0].TellerCower)
            {
              this.Robs[0].TellerCower = true;
              Function.Call((Hash) -6536672418696098093L, new InputArgument[2]
              {
                InputArgument.op_Implicit(this.Robs[0].Teller),
                InputArgument.op_Implicit("CODE_HUMAN_STAND_COWER")
              });
              this.Robs[0].Teller.get_Task().Cower(-1);
            }
            if (!this.Robs[0].Hostage3Cower)
            {
              this.Robs[0].Hostage3Cower = true;
              this.Robs[0].Hostage3.get_Task().ClearAllImmediately();
              Function.Call((Hash) -6536672418696098093L, new InputArgument[2]
              {
                InputArgument.op_Implicit(this.Robs[0].Hostage3),
                InputArgument.op_Implicit("CODE_HUMAN_STAND_COWER")
              });
              this.Robs[0].Hostage3.get_Task().Cower(-1);
            }
          }
          if (Function.Call<bool>((Hash) 4325344363702095739L, new InputArgument[2]
          {
            InputArgument.op_Implicit(Game.get_Player()),
            InputArgument.op_Implicit(this.Robs[0].Teller)
          }) != null && !this.Robs[0].TellerCower)
          {
            this.Robs[0].TellerCower = true;
            Function.Call((Hash) -6536672418696098093L, new InputArgument[2]
            {
              InputArgument.op_Implicit(this.Robs[0].Teller),
              InputArgument.op_Implicit("CODE_HUMAN_STAND_COWER")
            });
            this.Robs[0].Teller.get_Task().Cower(-1);
          }
          if (Function.Call<bool>((Hash) 4325344363702095739L, new InputArgument[2]
          {
            InputArgument.op_Implicit(Game.get_Player()),
            InputArgument.op_Implicit(this.Robs[0].Hostage3)
          }) != null && !this.Robs[0].Hostage3Cower)
          {
            this.Robs[0].Hostage3Cower = true;
            Function.Call((Hash) -6536672418696098093L, new InputArgument[2]
            {
              InputArgument.op_Implicit(this.Robs[0].Hostage3),
              InputArgument.op_Implicit("CODE_HUMAN_STAND_COWER")
            });
            this.Robs[0].Hostage3.get_Task().Cower(-1);
            break;
          }
          break;
        case 2:
          Function.Call((Hash) -6950556924876694540L, new InputArgument[2]
          {
            InputArgument.op_Implicit(this.Robs[0].Teller),
            InputArgument.op_Implicit(true)
          });
          if (Function.Call<bool>((Hash) 4325344363702095739L, new InputArgument[2]
          {
            InputArgument.op_Implicit(Game.get_Player()),
            InputArgument.op_Implicit(this.Robs[0].Teller)
          }) != null)
          {
            Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
            {
              InputArgument.op_Implicit(this.Robs[0].Checkpoint_Sound),
              InputArgument.op_Implicit("CHECKPOINT_PERFECT"),
              InputArgument.op_Implicit("HUD_MINI_GAME_SOUNDSET"),
              InputArgument.op_Implicit(1)
            });
            this.Robs[0].Teller.get_Task().ClearAllImmediately();
            this.Robs[0].Objective_Index = 3;
          }
          UI.ShowSubtitle("Intiminate the ~b~teller.", 30000);
          Function.Call((Hash) 1465062155054416227L, new InputArgument[1]
          {
            InputArgument.op_Implicit(2)
          });
          Game.get_Player().set_WantedLevel(0);
          break;
        case 3:
          Function.Call((Hash) -6536672418696098093L, new InputArgument[2]
          {
            InputArgument.op_Implicit(this.Robs[0].Teller),
            InputArgument.op_Implicit("CODE_HUMAN_COWER")
          });
          int num1 = 0;
          Function.Call((Hash) -1691864432734772949L, new InputArgument[1]
          {
            InputArgument.op_Implicit(&num1)
          });
          Function.Call((Hash) -1565002832890405996L, new InputArgument[11]
          {
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit("ped"),
            InputArgument.op_Implicit("handsup"),
            InputArgument.op_Implicit(4f),
            InputArgument.op_Implicit(0.0f),
            InputArgument.op_Implicit(-1),
            InputArgument.op_Implicit(49),
            InputArgument.op_Implicit(0.0f),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0)
          });
          Function.Call((Hash) -2924147101113880693L, new InputArgument[8]
          {
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit((float) this.Teller_Walk_Locations1[this.Robs[0].List_Index].X),
            InputArgument.op_Implicit((float) this.Teller_Walk_Locations1[this.Robs[0].List_Index].Y),
            InputArgument.op_Implicit((float) this.Teller_Walk_Locations1[this.Robs[0].List_Index].Z),
            InputArgument.op_Implicit(1f),
            InputArgument.op_Implicit(-1),
            InputArgument.op_Implicit(this.Teller_Heading[this.Robs[0].List_Index] + 100f),
            InputArgument.op_Implicit(-0.1f)
          });
          Function.Call((Hash) -2924147101113880693L, new InputArgument[8]
          {
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit((float) this.Teller_Walk_Locations2[this.Robs[0].List_Index].X),
            InputArgument.op_Implicit((float) this.Teller_Walk_Locations2[this.Robs[0].List_Index].Y),
            InputArgument.op_Implicit((float) this.Teller_Walk_Locations2[this.Robs[0].List_Index].Z),
            InputArgument.op_Implicit(1f),
            InputArgument.op_Implicit(-1),
            InputArgument.op_Implicit(this.Teller_Heading[this.Robs[0].List_Index] - 100f),
            InputArgument.op_Implicit(-0.1f)
          });
          Function.Call((Hash) -2924147101113880693L, new InputArgument[8]
          {
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit((float) this.FleecaVaultDoor_KeyPad_Locations[this.Robs[0].List_Index].X),
            InputArgument.op_Implicit((float) this.FleecaVaultDoor_KeyPad_Locations[this.Robs[0].List_Index].Y),
            InputArgument.op_Implicit((float) this.FleecaVaultDoor_KeyPad_Locations[this.Robs[0].List_Index].Z),
            InputArgument.op_Implicit(1.2f),
            InputArgument.op_Implicit(-1),
            InputArgument.op_Implicit(this.Teller_Heading[this.Robs[0].List_Index] - 90f),
            InputArgument.op_Implicit(-0.1f)
          });
          Function.Call((Hash) 6397096036273113831L, new InputArgument[2]
          {
            InputArgument.op_Implicit(num1),
            InputArgument.op_Implicit(false)
          });
          Function.Call((Hash) 4172351724727787723L, new InputArgument[1]
          {
            InputArgument.op_Implicit(num1)
          });
          Function.Call((Hash) 6537601060411640379L, new InputArgument[2]
          {
            InputArgument.op_Implicit(this.Robs[0].Teller),
            InputArgument.op_Implicit(num1)
          });
          Function.Call((Hash) 4053593907568086412L, new InputArgument[1]
          {
            InputArgument.op_Implicit(&num1)
          });
          this.Robs[0].Teller.set_AlwaysKeepTask(true);
          this.Robs[0].Objective_Index = 4;
          break;
        case 4:
          if (!this.Robs[0].Teller_Door_Open)
          {
            Vector3 position = ((Entity) this.Robs[0].Teller).get_Position();
            if ((double) ((Vector3) ref position).DistanceTo(this.FleecaDoor_Locations[this.Robs[0].List_Index]) < 1.20000004768372)
            {
              Prop[] nearbyProps11 = World.GetNearbyProps(this.FleecaDoor_Locations[this.Robs[0].List_Index], 0.5f);
              if (((IEnumerable<Prop>) nearbyProps11).Count<Prop>() > 0)
              {
                for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps11).Count<Prop>(); ++index)
                {
                  if (Model.op_Equality(((Entity) nearbyProps11[index]).get_Model(), Model.op_Implicit(-131754413)))
                  {
                    ((Entity) nearbyProps11[index]).set_Heading(this.FleecaDoor_Heading[this.Robs[0].List_Index] + 90f);
                    this.Robs[0].Teller_Door_Open = true;
                  }
                }
              }
            }
          }
          Vector3 position1 = ((Entity) this.Robs[0].Teller).get_Position();
          if ((double) ((Vector3) ref position1).DistanceTo(this.FleecaVaultDoor_KeyPad_Locations[this.Robs[0].List_Index]) < 0.5)
          {
            this.Robs[0].Objective_Index = 5;
            if (Blip.op_Inequality(((Entity) this.Robs[0].Teller).get_CurrentBlip(), (Blip) null))
              ((Entity) this.Robs[0].Teller).get_CurrentBlip().Remove();
          }
          UI.ShowSubtitle("Follow the ~b~teller ~w~to the ~y~vault.", 30000);
          Function.Call((Hash) 1465062155054416227L, new InputArgument[1]
          {
            InputArgument.op_Implicit(2)
          });
          Game.get_Player().set_WantedLevel(0);
          break;
        case 5:
          this.Robs[0].Teller.get_Task().ClearAllImmediately();
          int num2 = 0;
          Function.Call((Hash) -1691864432734772949L, new InputArgument[1]
          {
            InputArgument.op_Implicit(&num2)
          });
          Function.Call((Hash) -7802140868986593475L, new InputArgument[3]
          {
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(this.Teller_Heading[this.Robs[0].List_Index] - 95f),
            InputArgument.op_Implicit(1000)
          });
          Function.Call((Hash) -1565002832890405996L, new InputArgument[11]
          {
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit("amb@prop_human_atm@female@idle_a"),
            InputArgument.op_Implicit("idle_b"),
            InputArgument.op_Implicit(4f),
            InputArgument.op_Implicit(1f),
            InputArgument.op_Implicit(1100),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0.0f),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0)
          });
          Function.Call((Hash) -1565002832890405996L, new InputArgument[11]
          {
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit("amb@prop_human_atm@female@idle_a"),
            InputArgument.op_Implicit("idle_b"),
            InputArgument.op_Implicit(4f),
            InputArgument.op_Implicit(1f),
            InputArgument.op_Implicit(1300),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0.0f),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0)
          });
          Function.Call((Hash) -1565002832890405996L, new InputArgument[11]
          {
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit("amb@prop_human_atm@female@idle_a"),
            InputArgument.op_Implicit("idle_b"),
            InputArgument.op_Implicit(1f),
            InputArgument.op_Implicit(1f),
            InputArgument.op_Implicit(1100),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0.0f),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0)
          });
          Function.Call((Hash) -1565002832890405996L, new InputArgument[11]
          {
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit("amb@prop_human_atm@female@idle_a"),
            InputArgument.op_Implicit("idle_b"),
            InputArgument.op_Implicit(1f),
            InputArgument.op_Implicit(1f),
            InputArgument.op_Implicit(1100),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0.0f),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0)
          });
          Function.Call((Hash) 6397096036273113831L, new InputArgument[2]
          {
            InputArgument.op_Implicit(num2),
            InputArgument.op_Implicit(false)
          });
          Function.Call((Hash) 4172351724727787723L, new InputArgument[1]
          {
            InputArgument.op_Implicit(num2)
          });
          Function.Call((Hash) 6537601060411640379L, new InputArgument[2]
          {
            InputArgument.op_Implicit(this.Robs[0].Teller),
            InputArgument.op_Implicit(num2)
          });
          Function.Call((Hash) 4053593907568086412L, new InputArgument[1]
          {
            InputArgument.op_Implicit(&num2)
          });
          this.Robs[0].Teller.set_AlwaysKeepTask(true);
          this.Robs[0].Objective_Index = 6;
          UI.ShowSubtitle("Wait for the ~b~Teller ~w~to open the ~y~vault.", 5000);
          break;
        case 6:
          while (true)
          {
            long num3;
            InputArgument[] inputArgumentArray;
            do
            {
              if (Function.Call<int>((Hash) 47570426378728755L, new InputArgument[1]
              {
                InputArgument.op_Implicit(this.Robs[0].Teller)
              }) != -1)
              {
                Script.Wait(500);
                num3 = 47570426378728755L;
                inputArgumentArray = new InputArgument[1]
                {
                  InputArgument.op_Implicit(this.Robs[0].Teller)
                };
              }
              else
                goto label_182;
            }
            while (Function.Call<int>((Hash) num3, inputArgumentArray) != null);
            ((Entity) this.Robs[0].Teller).set_FreezePosition(true);
          }
label_182:
          ((Entity) this.Robs[0].Teller).set_FreezePosition(false);
          this.Robs[0].Objective_Index = 7;
          if (this.Robs[0].Objective_Index > -1 && this.Robs[0].Objective_Index < 8 && (!((Entity) this.Robs[0].Teller).get_IsAlive() && !this.Robs[0].Faild))
          {
            Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
            {
              InputArgument.op_Implicit(-1),
              InputArgument.op_Implicit("ScreenFlash"),
              InputArgument.op_Implicit("MissionFailedSounds"),
              InputArgument.op_Implicit(1)
            });
            Function.Call((Hash) -5676599620247143319L, new InputArgument[1]
            {
              InputArgument.op_Implicit("GENERIC_FAILED")
            });
            this.WhoDied = "THE ~b~TELLER ";
            this.BankAvalible[this.Robs[0].List_Index] = false;
            this.Robs[0].Faild = true;
            this.run = true;
            this.step = 0;
            this.Robs[0].Objective_Index = -1;
            break;
          }
          break;
        case 7:
          Function.Call((Hash) -8248757550657797856L, new InputArgument[9]
          {
            InputArgument.op_Implicit(this.Robs[0].Vault_Sound),
            InputArgument.op_Implicit("vault_unlock"),
            InputArgument.op_Implicit((float) this.FleecaVaultDoor_Locations[this.Robs[0].List_Index].X),
            InputArgument.op_Implicit((float) this.FleecaVaultDoor_Locations[this.Robs[0].List_Index].Y),
            InputArgument.op_Implicit((float) this.FleecaVaultDoor_Locations[this.Robs[0].List_Index].Z),
            InputArgument.op_Implicit("dlc_heist_fleeca_bank_door_sounds"),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0)
          });
          Prop[] nearbyProps12 = World.GetNearbyProps(new Vector3((float) this.FleecaVaultDoor_Locations[this.Robs[0].List_Index].X, (float) this.FleecaVaultDoor_Locations[this.Robs[0].List_Index].Y, (float) (this.FleecaVaultDoor_Locations[this.Robs[0].List_Index].Z - 1.20000004768372)), 1.5f);
          if (((IEnumerable<Prop>) nearbyProps12).Count<Prop>() > 0)
          {
            for (int index = 0; index < ((IEnumerable<Prop>) nearbyProps12).Count<Prop>(); ++index)
            {
              if (Model.op_Equality(((Entity) nearbyProps12[index]).get_Model(), Model.op_Implicit(-63539571)))
              {
                ((Entity) nearbyProps12[index]).set_FreezePosition(false);
                Function.Call((Hash) 9201443540889044737L, new InputArgument[9]
                {
                  InputArgument.op_Implicit(nearbyProps12[index]),
                  InputArgument.op_Implicit("bank_vault_door_opens"),
                  InputArgument.op_Implicit("anim@heists@fleeca_bank@bank_vault_door"),
                  InputArgument.op_Implicit(4f),
                  InputArgument.op_Implicit(0),
                  InputArgument.op_Implicit(1),
                  InputArgument.op_Implicit(0),
                  InputArgument.op_Implicit(0.0f),
                  InputArgument.op_Implicit(8)
                });
                ((Entity) nearbyProps12[index]).set_HasCollision(false);
                Script.Wait(1000);
                Function.Call((Hash) -8248757550657797856L, new InputArgument[9]
                {
                  InputArgument.op_Implicit(this.Robs[0].Alarm_Sound),
                  InputArgument.op_Implicit("Burglar_Bell"),
                  InputArgument.op_Implicit((float) this.FleecaVaultDoor_KeyPad_Locations[this.Robs[0].List_Index].X),
                  InputArgument.op_Implicit((float) this.FleecaVaultDoor_KeyPad_Locations[this.Robs[0].List_Index].Y),
                  InputArgument.op_Implicit((float) this.FleecaVaultDoor_KeyPad_Locations[this.Robs[0].List_Index].Z),
                  InputArgument.op_Implicit("Generic_Alarms"),
                  InputArgument.op_Implicit(0),
                  InputArgument.op_Implicit(0),
                  InputArgument.op_Implicit(0)
                });
                ((Entity) nearbyProps12[index]).set_FreezePosition(false);
                ((Entity) nearbyProps12[index]).MarkAsNoLongerNeeded();
              }
            }
          }
          this.Robs[0].Teller.get_Task().Cower(-1);
          UI.ShowSubtitle("~g~Go ~w~to the ~y~deposit box.", 0);
          this.Robs[0].Objective_Index = 8;
          Function.Call((Hash) 1465062155054416227L, new InputArgument[1]
          {
            InputArgument.op_Implicit(2)
          });
          Game.get_Player().set_WantedLevel(0);
          break;
        case 8:
          if (!this.Robs[0].Vault_Door_Open)
          {
            this.Robs[0].Vault_Door_Open = true;
            this.Robs[0].Objective_Index = 9;
            break;
          }
          break;
        case 9:
          this.Robs[0].Drill_LocationBlip = (Blip) Function.Call<Blip>((Hash) 6486199071725192374L, new InputArgument[3]
          {
            InputArgument.op_Implicit((float) this.FleecaVaultDrill_Locations[this.Robs[0].List_Index].X),
            InputArgument.op_Implicit((float) this.FleecaVaultDrill_Locations[this.Robs[0].List_Index].Y),
            InputArgument.op_Implicit((float) this.FleecaVaultDrill_Locations[this.Robs[0].List_Index].Z)
          });
          this.Robs[0].Drill_LocationBlip.set_Scale(0.75f);
          this.Robs[0].Objective_Index = 10;
          break;
        case 10:
          UI.ShowSubtitle("~g~Go ~w~to the ~y~deposit box.", 0);
          World.DrawMarker((MarkerType) 1, this.FleecaVaultDrill_Locations[this.Robs[0].List_Index], new Vector3(0.0f, 0.0f, 0.0f), new Vector3(0.0f, 0.0f, 0.0f), new Vector3(0.5f, 0.5f, 0.5f), Color.FromArgb((int) byte.MaxValue, (int) byte.MaxValue, 0), false, true, 2, false, "", "", false);
          Vector3 position2 = ((Entity) Game.get_Player().get_Character()).get_Position();
          if ((double) ((Vector3) ref position2).DistanceTo(this.FleecaVaultDrill_Locations[this.Robs[0].List_Index]) < 1.5)
          {
            bool flag1 = (bool) Function.Call<bool>((Hash) -2136817780763624675L, new InputArgument[2]
            {
              InputArgument.op_Implicit(2),
              InputArgument.op_Implicit(75)
            });
            bool flag2 = (bool) Function.Call<bool>((Hash) -2136817780763624675L, new InputArgument[2]
            {
              InputArgument.op_Implicit(2),
              InputArgument.op_Implicit(175)
            });
            this.DisplayHelpTextThisFrame("~INPUT_FRONTEND_RIGHT~ to dril deposit box");
            if (flag1 || flag2)
              this.Robs[0].Objective_Index = 11;
          }
          Function.Call((Hash) 1465062155054416227L, new InputArgument[1]
          {
            InputArgument.op_Implicit(this.WantedLevel)
          });
          Game.get_Player().set_WantedLevel(0);
          break;
        case 11:
          if (this.Drill == null || !this.Drill.Drilling)
          {
            if (Blip.op_Inequality(this.Robs[0].Drill_LocationBlip, (Blip) null))
              this.Robs[0].Drill_LocationBlip.Remove();
            ((Entity) Game.get_Player().get_Character()).set_FreezePosition(true);
            this.Drill = new RobFleeca.Driller();
            this.Drill.CamMode = (int) Function.Call<int>((Hash) -8264872624829745862L, new InputArgument[0]);
            Function.Call((Hash) 6507594667565250308L, new InputArgument[1]
            {
              InputArgument.op_Implicit(1)
            });
            ((Entity) Game.get_Player().get_Character()).set_Position(this.FleecaVaultDrill_Locations[this.Robs[0].List_Index]);
            ((Entity) Game.get_Player().get_Character()).set_Heading(this.FleecaVaultDrill_Heading[this.Robs[0].List_Index]);
            ((Entity) Game.get_Player().get_Character()).set_FreezePosition(true);
            Function.Call((Hash) 6507594667565250308L, new InputArgument[1]
            {
              InputArgument.op_Implicit(this.Drill.CamMode)
            });
            this.Robs[0].Objective_Index = 12;
            break;
          }
          break;
        case 12:
          Function.Call<bool>((Hash) -2136817780763624675L, new InputArgument[2]
          {
            InputArgument.op_Implicit(2),
            InputArgument.op_Implicit(74)
          });
          bool flag = (bool) Function.Call<bool>((Hash) -2136817780763624675L, new InputArgument[2]
          {
            InputArgument.op_Implicit(2),
            InputArgument.op_Implicit(174)
          });
          this.DisplayHelpTextThisFrame("~INPUT_FRONTEND_LEFT~ to quit drilling");
          if (flag)
          {
            if (this.Drill.Drilling)
            {
              this.Drill.RemoveDriller();
              if (!this.Robs[0].Drill_LocationBlip.Exists())
              {
                ((Entity) Game.get_Player().get_Character()).set_FreezePosition(false);
                this.Robs[0].Drill_LocationBlip = (Blip) Function.Call<Blip>((Hash) 6486199071725192374L, new InputArgument[3]
                {
                  InputArgument.op_Implicit((float) this.FleecaVaultDrill_Locations[this.Robs[0].List_Index].X),
                  InputArgument.op_Implicit((float) this.FleecaVaultDrill_Locations[this.Robs[0].List_Index].Y),
                  InputArgument.op_Implicit((float) this.FleecaVaultDrill_Locations[this.Robs[0].List_Index].Z)
                });
              }
            }
            this.Robs[0].Objective_Index = 10;
          }
          Function.Call((Hash) 1465062155054416227L, new InputArgument[1]
          {
            InputArgument.op_Implicit(this.WantedLevel)
          });
          Game.get_Player().set_WantedLevel(0);
          if (this.Robs[0].Drilling_Done)
          {
            Function.Call((Hash) 1465062155054416227L, new InputArgument[1]
            {
              InputArgument.op_Implicit(0)
            });
            if (Game.get_Player().get_WantedLevel() <= this.WantedLevel)
              Game.get_Player().set_WantedLevel(this.WantedLevel);
            int num3 = 0;
            Function.Call((Hash) -1691864432734772949L, new InputArgument[1]
            {
              InputArgument.op_Implicit(&num3)
            });
            Function.Call((Hash) -1565002832890405996L, new InputArgument[11]
            {
              InputArgument.op_Implicit(0),
              InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling"),
              InputArgument.op_Implicit("outro"),
              InputArgument.op_Implicit(1f),
              InputArgument.op_Implicit(0.01f),
              InputArgument.op_Implicit(10000),
              InputArgument.op_Implicit(0),
              InputArgument.op_Implicit(0.0f),
              InputArgument.op_Implicit(1),
              InputArgument.op_Implicit(1),
              InputArgument.op_Implicit(1)
            });
            Function.Call((Hash) 6397096036273113831L, new InputArgument[2]
            {
              InputArgument.op_Implicit(num3),
              InputArgument.op_Implicit(false)
            });
            Function.Call((Hash) 4172351724727787723L, new InputArgument[1]
            {
              InputArgument.op_Implicit(num3)
            });
            Function.Call((Hash) 6537601060411640379L, new InputArgument[2]
            {
              InputArgument.op_Implicit(Game.get_Player().get_Character()),
              InputArgument.op_Implicit(num3)
            });
            Function.Call((Hash) 4053593907568086412L, new InputArgument[1]
            {
              InputArgument.op_Implicit(&num3)
            });
            this.Robs[0].Teller.set_AlwaysKeepTask(true);
            Script.Wait(2500);
            Prop boxDoor1 = this.Robs[0].BoxDoor;
            ((Entity) boxDoor1).set_Heading(((Entity) boxDoor1).get_Heading() - 90f);
            Script.Wait(500);
            ((Entity) this.Robs[0].CashEnvelope).Delete();
            Script.Wait(2500);
            Prop boxDoor2 = this.Robs[0].BoxDoor;
            ((Entity) boxDoor2).set_Heading(((Entity) boxDoor2).get_Heading() + 90f);
            Script.Wait(1000);
            this.Drill.RemoveDriller();
            ((Entity) Game.get_Player().get_Character()).set_FreezePosition(false);
            this.Robs[0].Objective_Index = 13;
            break;
          }
          break;
        case 13:
          UI.ShowSubtitle("~y~Leave ~w~the ~g~bank.", 0);
          Vector3 position3 = ((Entity) Game.get_Player().get_Character()).get_Position();
          if ((double) ((Vector3) ref position3).DistanceTo(this.EnterExitBank_Locations[this.Robs[0].List_Index]) < 2.0)
          {
            Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
            {
              InputArgument.op_Implicit(this.Robs[0].Checkpoint_Sound),
              InputArgument.op_Implicit("CHECKPOINT_PERFECT"),
              InputArgument.op_Implicit("HUD_MINI_GAME_SOUNDSET"),
              InputArgument.op_Implicit(1)
            });
            Vehicle vehicle = (Vehicle) Function.Call<Vehicle>((Hash) -5561822742956362377L, new InputArgument[0]);
            if (Entity.op_Inequality((Entity) vehicle, (Entity) null))
              Function.Call((Hash) -582048865869445338L, new InputArgument[2]
              {
                InputArgument.op_Implicit(vehicle),
                InputArgument.op_Implicit(true)
              });
            this.Robs[0].Objective_Index = 14;
            break;
          }
          break;
        case 14:
          UI.ShowSubtitle("Lose The Cops.", 1000);
          if (Game.get_Player().get_WantedLevel() < 1)
          {
            this.Robs[0].Objective_Index = 15;
            this.Passed_Index = 0;
            this.BankAvalible[this.Robs[0].List_Index] = false;
            break;
          }
          break;
        case 15:
          this.Robs[0].Objective_Index = -1;
          break;
      }
      if (this.Robs[0].Objective_Index > -1 && this.Robs[0].Objective_Index < 7 && (!((Entity) this.Robs[0].Teller).get_IsAlive() && !this.Robs[0].Faild))
      {
        this.BankAvalible[this.Robs[0].List_Index] = false;
        Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
        {
          InputArgument.op_Implicit(-1),
          InputArgument.op_Implicit("ScreenFlash"),
          InputArgument.op_Implicit("MissionFailedSounds"),
          InputArgument.op_Implicit(1)
        });
        Function.Call((Hash) -5676599620247143319L, new InputArgument[1]
        {
          InputArgument.op_Implicit("GENERIC_FAILED")
        });
        this.WhoDied = "THE ~b~TELLER ";
        this.Robs[0].Faild = true;
        this.run = true;
        this.step = 0;
        this.Robs[0].RemoveRob();
        this.Robs.RemoveAt(0);
      }
      if (Game.get_Player().get_IsDead())
      {
        while (!Game.get_IsScreenFadedOut())
          Script.Wait(10);
        while (Game.get_IsScreenFadedOut())
          Script.Wait(4000);
        this.BankAvalible[this.Robs[0].List_Index] = false;
        Function.Call((Hash) -5676599620247143319L, new InputArgument[1]
        {
          InputArgument.op_Implicit("GENERIC_FAILED")
        });
        this.WhoDied = "YOU ";
        this.Robs[0].Faild = true;
        this.run = true;
        this.step = 0;
        this.Robs[0].RemoveRob();
        this.Robs.RemoveAt(0);
      }
    }
    if (Function.Call<int>((Hash) 2675767815307398015L, new InputArgument[0]) > 18 || Function.Call<int>((Hash) 2675767815307398015L, new InputArgument[0]) < 7)
    {
      for (int index = 0; index < this.BankAvalible.Count; ++index)
      {
        if (!this.BankAvalible[index])
          this.BankAvalible[index] = true;
      }
    }
    if (this.Robs.Count < 1 && Function.Call<int>((Hash) 2675767815307398015L, new InputArgument[0]) >= 7 && Function.Call<int>((Hash) 2675767815307398015L, new InputArgument[0]) < 18)
    {
      for (int index = 0; index < this.Bank_Locations.Count; ++index)
      {
        if (this.BankAvalible[index] && Game.get_Player().get_WantedLevel() == 0)
          World.DrawMarker((MarkerType) 1, this.Bank_Locations[index], new Vector3(0.0f, 0.0f, 0.0f), new Vector3(0.0f, 0.0f, 0.0f), new Vector3(2f, 2f, 0.5f), Color.FromArgb(51, (int) byte.MaxValue, 107), false, true, 2, false, "", "", false);
        else
          World.DrawMarker((MarkerType) 1, this.Bank_Locations[index], new Vector3(0.0f, 0.0f, 0.0f), new Vector3(0.0f, 0.0f, 0.0f), new Vector3(2f, 2f, 0.5f), Color.FromArgb((int) byte.MaxValue, 0, 0), false, true, 2, false, "", "", false);
      }
    }
    switch (this.Passed_Index)
    {
      case 0:
        this.Scale = (int) Function.Call<int>((Hash) 1296532278728670831L, new InputArgument[1]
        {
          InputArgument.op_Implicit("MIDSIZED_MESSAGE")
        });
        this.time = Game.get_GameTime() + 1500;
        this.Passed_Index = 1;
        break;
      case 1:
        if (Game.get_GameTime() > this.time)
        {
          if (Function.Call<bool>((Hash) -8795499778314053874L, new InputArgument[1]
          {
            InputArgument.op_Implicit(this.Scale)
          }) != null)
          {
            Function.Call((Hash) 2451857716230485796L, new InputArgument[3]
            {
              InputArgument.op_Implicit("SuccessNeutral"),
              InputArgument.op_Implicit(8500),
              InputArgument.op_Implicit(false)
            });
            Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
            {
              InputArgument.op_Implicit(-1),
              InputArgument.op_Implicit("CHECKPOINT_PERFECT"),
              InputArgument.op_Implicit("HUD_MINI_GAME_SOUNDSET"),
              InputArgument.op_Implicit(1)
            });
            Function.Call((Hash) -5676599620247143319L, new InputArgument[1]
            {
              InputArgument.op_Implicit("MICHAEL_BIG_01")
            });
            Function.Call((Hash) -656248923347195570L, new InputArgument[2]
            {
              InputArgument.op_Implicit(this.Scale),
              InputArgument.op_Implicit("SHOW_SHARD_MIDSIZED_MESSAGE")
            });
            if (this.Robs[0].List_Index == 0 && !this.BankRobbed1)
            {
              this.KeysData.SetValue<bool>("settings", "BankRobbed1", (M0) 1);
              this.KeysData.Save();
              this.BankRobbed1 = true;
            }
            if (this.Robs[0].List_Index == 1 && !this.BankRobbed2)
            {
              this.KeysData.SetValue("settings", "BankRobbed2", "True");
              this.KeysData.Save();
              this.BankRobbed2 = true;
            }
            if (this.Robs[0].List_Index == 2 && !this.BankRobbed3)
            {
              this.KeysData.SetValue("settings", "BankRobbed3", "True");
              this.KeysData.Save();
              this.BankRobbed3 = true;
            }
            if (this.Robs[0].List_Index == 3 && !this.BankRobbed4)
            {
              this.KeysData.SetValue("settings", "BankRobbed4", "True");
              this.KeysData.Save();
              this.BankRobbed4 = true;
            }
            if (this.Robs[0].List_Index == 4 && !this.BankRobbed5)
            {
              this.KeysData.SetValue("settings", "BankRobbed5", "True");
              this.KeysData.Save();
              this.BankRobbed5 = true;
            }
            if (this.Robs[0].List_Index == 5 && !this.BankRobbed6)
            {
              this.KeysData.SetValue("settings", "BankRobbed6", "True");
              this.KeysData.Save();
              this.BankRobbed6 = true;
            }
            int num1 = 0;
            if (this.BankRobbed1)
              ++num1;
            if (this.BankRobbed2)
              ++num1;
            if (this.BankRobbed3)
              ++num1;
            if (this.BankRobbed4)
              ++num1;
            if (this.BankRobbed5)
              ++num1;
            if (this.BankRobbed6)
              ++num1;
            Function.Call((Hash) -9208871647656321451L, new InputArgument[1]
            {
              InputArgument.op_Implicit("STRING")
            });
            Function.Call((Hash) 7789129354908300458L, new InputArgument[1]
            {
              InputArgument.op_Implicit("~g~ROBBERY SUCCESS")
            });
            Function.Call((Hash) 3904107679495919961L, new InputArgument[0]);
            int num2 = (int) Function.Call<int>((Hash) -3084046921057706712L, new InputArgument[2]
            {
              InputArgument.op_Implicit(this.MinCash),
              InputArgument.op_Implicit(this.MaxCash)
            });
            Player player = Game.get_Player();
            player.set_Money(player.get_Money() + num2);
            Function.Call((Hash) -9208871647656321451L, new InputArgument[1]
            {
              InputArgument.op_Implicit("STRING")
            });
            Function.Call((Hash) 7789129354908300458L, new InputArgument[1]
            {
              InputArgument.op_Implicit("Banks Robbed " + num1.ToString() + "/6~n~Money earned  " + num2.ToString())
            });
            Function.Call((Hash) 3904107679495919961L, new InputArgument[0]);
            Function.Call((Hash) -4145164815407030701L, new InputArgument[0]);
            this.time = Game.get_GameTime() + 10000;
            this.Passed_Index = 2;
            break;
          }
          break;
        }
        break;
      case 2:
        if (Function.Call<bool>((Hash) -8795499778314053874L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.Scale)
        }) != null)
        {
          if (Game.get_GameTime() <= this.time)
          {
            Function.Call((Hash) 1005998793517194209L, new InputArgument[5]
            {
              InputArgument.op_Implicit(this.Scale),
              InputArgument.op_Implicit((int) byte.MaxValue),
              InputArgument.op_Implicit((int) byte.MaxValue),
              InputArgument.op_Implicit((int) byte.MaxValue),
              InputArgument.op_Implicit((int) byte.MaxValue)
            });
            break;
          }
          if (Game.get_GameTime() < this.time + 100)
          {
            Function.Call((Hash) -656248923347195570L, new InputArgument[2]
            {
              InputArgument.op_Implicit(this.Scale),
              InputArgument.op_Implicit("SHARD_ANIM_OUT")
            });
            Function.Call((Hash) -4336821193739516250L, new InputArgument[1]
            {
              InputArgument.op_Implicit(1)
            });
            Function.Call((Hash) -2983856120574135014L, new InputArgument[1]
            {
              InputArgument.op_Implicit(0.33f)
            });
            Function.Call((Hash) -4145164815407030701L, new InputArgument[0]);
            this.time -= 100;
            break;
          }
          if (Game.get_GameTime() < this.time + 2000)
          {
            Function.Call((Hash) 1005998793517194209L, new InputArgument[5]
            {
              InputArgument.op_Implicit(this.Scale),
              InputArgument.op_Implicit((int) byte.MaxValue),
              InputArgument.op_Implicit((int) byte.MaxValue),
              InputArgument.op_Implicit((int) byte.MaxValue),
              InputArgument.op_Implicit((int) byte.MaxValue)
            });
            break;
          }
          this.Passed_Index = 3;
          break;
        }
        break;
      case 3:
        Function.Call((Hash) 2095068147598518289L, new InputArgument[1]
        {
          InputArgument.op_Implicit(&this.Scale)
        });
        this.Passed_Index = -1;
        if (this.Robs.Count > 0)
        {
          this.Robs[0].RemoveRob();
          this.Robs.RemoveAt(0);
          break;
        }
        break;
    }
    if (this.run)
    {
      switch (this.step)
      {
        case 0:
          this.Scale = (int) Function.Call<int>((Hash) 1296532278728670831L, new InputArgument[1]
          {
            InputArgument.op_Implicit("MIDSIZED_MESSAGE")
          });
          this.time = Game.get_GameTime() + 1500;
          this.step = 1;
          break;
        case 1:
          if (Game.get_GameTime() > this.time)
          {
            if (Function.Call<bool>((Hash) -8795499778314053874L, new InputArgument[1]
            {
              InputArgument.op_Implicit(this.Scale)
            }) != null)
            {
              Function.Call((Hash) 2451857716230485796L, new InputArgument[3]
              {
                InputArgument.op_Implicit("SuccessNeutral"),
                InputArgument.op_Implicit(8000),
                InputArgument.op_Implicit(false)
              });
              Function.Call((Hash) -656248923347195570L, new InputArgument[2]
              {
                InputArgument.op_Implicit(this.Scale),
                InputArgument.op_Implicit("SHOW_SHARD_MIDSIZED_MESSAGE")
              });
              Function.Call((Hash) -9208871647656321451L, new InputArgument[1]
              {
                InputArgument.op_Implicit("STRING")
              });
              Function.Call((Hash) 7789129354908300458L, new InputArgument[1]
              {
                InputArgument.op_Implicit("ROBBERY FAILED")
              });
              Function.Call((Hash) 3904107679495919961L, new InputArgument[0]);
              Function.Call((Hash) -9208871647656321451L, new InputArgument[1]
              {
                InputArgument.op_Implicit("STRING")
              });
              Function.Call((Hash) 7789129354908300458L, new InputArgument[1]
              {
                InputArgument.op_Implicit(this.WhoDied + "~w~DIED")
              });
              Function.Call((Hash) 3904107679495919961L, new InputArgument[0]);
              Function.Call((Hash) -4336821193739516250L, new InputArgument[1]
              {
                InputArgument.op_Implicit(6)
              });
              Function.Call((Hash) -4145164815407030701L, new InputArgument[0]);
              this.time = Game.get_GameTime() + 8000;
              this.step = 2;
              break;
            }
            break;
          }
          break;
        case 2:
          if (Function.Call<bool>((Hash) -8795499778314053874L, new InputArgument[1]
          {
            InputArgument.op_Implicit(this.Scale)
          }) != null)
          {
            if (Game.get_GameTime() <= this.time)
            {
              Function.Call((Hash) 1005998793517194209L, new InputArgument[5]
              {
                InputArgument.op_Implicit(this.Scale),
                InputArgument.op_Implicit((int) byte.MaxValue),
                InputArgument.op_Implicit((int) byte.MaxValue),
                InputArgument.op_Implicit((int) byte.MaxValue),
                InputArgument.op_Implicit((int) byte.MaxValue)
              });
              break;
            }
            if (Game.get_GameTime() < this.time + 100)
            {
              Function.Call((Hash) -656248923347195570L, new InputArgument[2]
              {
                InputArgument.op_Implicit(this.Scale),
                InputArgument.op_Implicit("SHARD_ANIM_OUT")
              });
              Function.Call((Hash) -4336821193739516250L, new InputArgument[1]
              {
                InputArgument.op_Implicit(1)
              });
              Function.Call((Hash) -2983856120574135014L, new InputArgument[1]
              {
                InputArgument.op_Implicit(0.33f)
              });
              Function.Call((Hash) -4145164815407030701L, new InputArgument[0]);
              this.time -= 100;
              break;
            }
            if (Game.get_GameTime() < this.time + 2000)
            {
              Function.Call((Hash) 1005998793517194209L, new InputArgument[5]
              {
                InputArgument.op_Implicit(this.Scale),
                InputArgument.op_Implicit((int) byte.MaxValue),
                InputArgument.op_Implicit((int) byte.MaxValue),
                InputArgument.op_Implicit((int) byte.MaxValue),
                InputArgument.op_Implicit((int) byte.MaxValue)
              });
              break;
            }
            this.step = 3;
            break;
          }
          break;
        case 3:
          Function.Call((Hash) 2095068147598518289L, new InputArgument[1]
          {
            InputArgument.op_Implicit(&this.Scale)
          });
          this.step = -1;
          if (this.Robs.Count > 0)
          {
            this.Robs[0].RemoveRob();
            this.Robs.RemoveAt(0);
            break;
          }
          break;
      }
    }
    if (this.Drill == null)
      return;
    if (Game.get_Player().get_IsDead() && this.Drill.Drilling)
      this.Drill.RemoveDriller();
    if (!this.Drill.Drilling)
      return;
    UI.ShowSubtitle("Drill the ~g~safety deposit box", 1000);
    Function.Call((Hash) -100848937243707716L, new InputArgument[2]
    {
      InputArgument.op_Implicit(2),
      InputArgument.op_Implicit(37)
    });
    Function.Call((Hash) -100848937243707716L, new InputArgument[2]
    {
      InputArgument.op_Implicit(2),
      InputArgument.op_Implicit(27)
    });
    Function.Call((Hash) 1005998793517194209L, new InputArgument[5]
    {
      InputArgument.op_Implicit(this.Drill.ScaleFormDrilling),
      InputArgument.op_Implicit((int) byte.MaxValue),
      InputArgument.op_Implicit((int) byte.MaxValue),
      InputArgument.op_Implicit((int) byte.MaxValue),
      InputArgument.op_Implicit((int) byte.MaxValue)
    });
    float num4 = 0.0f;
    if (Game.get_CurrentInputMode() == 1)
    {
      num4 = (float) Function.Call<float>((Hash) -1424092350868114077L, new InputArgument[2]
      {
        InputArgument.op_Implicit(2),
        InputArgument.op_Implicit(32)
      });
      this.Drill.DrillSpeed = (float) Function.Call<float>((Hash) -1424092350868114077L, new InputArgument[2]
      {
        InputArgument.op_Implicit(2),
        InputArgument.op_Implicit(24)
      });
    }
    if (Game.get_CurrentInputMode() == null)
    {
      num4 = (float) (0.0 - (double) (float) Function.Call<float>((Hash) -1424092350868114077L, new InputArgument[2]
      {
        InputArgument.op_Implicit(2),
        InputArgument.op_Implicit(240)
      }) + 0.899999976158142);
      if (Function.Call<bool>((Hash) 6342219533232326959L, new InputArgument[2]
      {
        InputArgument.op_Implicit(2),
        InputArgument.op_Implicit(241)
      }) != null)
      {
        if ((double) this.Drill.DrillSpeed < 1.0)
          this.Drill.DrillSpeed += 0.125f;
        else
          this.Drill.DrillSpeed = 1f;
      }
      if (Function.Call<bool>((Hash) 6342219533232326959L, new InputArgument[2]
      {
        InputArgument.op_Implicit(2),
        InputArgument.op_Implicit(242)
      }) != null)
      {
        if ((double) this.Drill.DrillSpeed > 0.0)
          this.Drill.DrillSpeed -= 0.125f;
        else
          this.Drill.DrillSpeed = 0.0f;
      }
    }
    if (this.Drill.ResetTime < Game.get_GameTime())
    {
      if ((double) this.Drill.DrillSpeed > 0.0)
      {
        if (Function.Call<bool>((Hash) -234804619577095963L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.Drill.Sound)
        }) != null)
          Function.Call((Hash) -1846684210194370067L, new InputArgument[6]
          {
            InputArgument.op_Implicit(this.Drill.Sound),
            InputArgument.op_Implicit("Drill"),
            InputArgument.op_Implicit(this.Drill.Drill_Prop),
            InputArgument.op_Implicit("DLC_HEIST_FLEECA_SOUNDSET"),
            InputArgument.op_Implicit(1),
            InputArgument.op_Implicit(0)
          });
      }
      else
        Function.Call((Hash) -6651601026601448523L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.Drill.Sound)
        });
      if ((double) this.Drill.DrillPosition == 0.0)
      {
        if (Function.Call<bool>((Hash) 2237014829242392265L, new InputArgument[4]
        {
          InputArgument.op_Implicit(Game.get_Player().get_Character()),
          InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling"),
          InputArgument.op_Implicit("drill_straight_idle"),
          InputArgument.op_Implicit(3)
        }) == null)
          Function.Call((Hash) -1565002832890405996L, new InputArgument[11]
          {
            InputArgument.op_Implicit(Game.get_Player().get_Character()),
            InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling"),
            InputArgument.op_Implicit("drill_straight_idle"),
            InputArgument.op_Implicit(6f),
            InputArgument.op_Implicit(0.01f),
            InputArgument.op_Implicit(-1),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0.0f),
            InputArgument.op_Implicit(1),
            InputArgument.op_Implicit(1),
            InputArgument.op_Implicit(1)
          });
      }
      if ((double) this.Drill.DrillPosition > 0.0)
      {
        if (Function.Call<bool>((Hash) 2237014829242392265L, new InputArgument[4]
        {
          InputArgument.op_Implicit(Game.get_Player().get_Character()),
          InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling"),
          InputArgument.op_Implicit("drill_right_end"),
          InputArgument.op_Implicit(3)
        }) == null)
          Function.Call((Hash) -1565002832890405996L, new InputArgument[11]
          {
            InputArgument.op_Implicit(Game.get_Player().get_Character()),
            InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling"),
            InputArgument.op_Implicit("drill_right_end"),
            InputArgument.op_Implicit(3f),
            InputArgument.op_Implicit(0.01f),
            InputArgument.op_Implicit(-1),
            InputArgument.op_Implicit(0),
            InputArgument.op_Implicit(0.0f),
            InputArgument.op_Implicit(1),
            InputArgument.op_Implicit(1),
            InputArgument.op_Implicit(1)
          });
      }
      if ((double) this.Drill.DrillTemperature < 1.0 && (double) this.Drill.DrillPosition > (double) this.Drill.DrillDepth - 0.200000002980232)
      {
        if ((double) this.Drill.DrillSpeed > 0.200000002980232 & (double) this.Drill.DrillSpeed < 0.800000011920929)
          this.Drill.DrillDepth += 0.0003f;
        if ((double) this.Drill.DrillSpeed > 0.300000011920929 & (double) this.Drill.DrillSpeed < 0.699999988079071)
          this.Drill.DrillDepth += 0.0003f;
        if ((double) this.Drill.DrillDepth > 0.776000022888184 && (double) this.Drill.DrillSpeed > 0.200000002980232 & (double) this.Drill.DrillSpeed < 0.699999988079071)
          this.Drill.DrillDepth += 0.005f;
      }
      if (((double) num4 > 0.75 && (double) this.Drill.DrillSpeed > 0.0 || (double) num4 > 0.0 && (double) this.Drill.DrillSpeed > 0.75) && ((double) this.Drill.DrillPosition > (double) this.Drill.DrillDepth - 0.200000002980232 && (double) this.Drill.DrillTemperature < 1.0))
        this.Drill.DrillTemperature += 0.015f;
      if (((double) this.Drill.DrillSpeed == 0.0 || (double) this.Drill.DrillPosition == 0.0) && (double) this.Drill.DrillTemperature > 0.0)
        this.Drill.DrillTemperature -= 0.005f;
      if ((double) this.Drill.DrillSpeed < 0.00999999977648258)
        Function.Call((Hash) -4323085940105063473L, new InputArgument[2]
        {
          InputArgument.op_Implicit(this.Drill.DrillFX),
          InputArgument.op_Implicit(0)
        });
      if ((double) num4 > 0.0)
      {
        if ((double) this.Drill.DrillPosition < (double) this.Drill.DrillDepth - 0.200000002980232)
          this.Drill.DrillPosition += 0.05f;
        if ((double) this.Drill.DrillPosition < (double) this.Drill.DrillDepth)
        {
          this.Drill.DrillPosition += 0.01f;
          if ((double) this.Drill.DrillSpeed > 0.0)
          {
            Function.Call((Hash) -4323085940105063473L, new InputArgument[2]
            {
              InputArgument.op_Implicit(this.Drill.DrillFX),
              InputArgument.op_Implicit(0)
            });
            Function.Call((Hash) 7798175403732277905L, new InputArgument[1]
            {
              InputArgument.op_Implicit("fm_mission_controler")
            });
            this.Drill.DrillFX = (int) Function.Call<int>((Hash) 8025670286167043613L, new InputArgument[12]
            {
              InputArgument.op_Implicit("scr_drill_debris"),
              InputArgument.op_Implicit(this.Drill.Drill_Prop),
              InputArgument.op_Implicit(0.0f),
              InputArgument.op_Implicit(-0.55f),
              InputArgument.op_Implicit(0.01f),
              InputArgument.op_Implicit(90f),
              InputArgument.op_Implicit(90f),
              InputArgument.op_Implicit(90f),
              InputArgument.op_Implicit(0.8f),
              InputArgument.op_Implicit(0),
              InputArgument.op_Implicit(0),
              InputArgument.op_Implicit(0)
            });
            Function.Call((Hash) 6848931988011301858L, new InputArgument[4]
            {
              InputArgument.op_Implicit(this.Drill.DrillFX),
              InputArgument.op_Implicit("power"),
              InputArgument.op_Implicit(0.7f),
              InputArgument.op_Implicit(0)
            });
          }
          else
            Function.Call((Hash) -4323085940105063473L, new InputArgument[2]
            {
              InputArgument.op_Implicit(this.Drill.DrillFX),
              InputArgument.op_Implicit(0)
            });
        }
      }
      else
      {
        this.Drill.DrillPosition = 0.0f;
        Function.Call((Hash) -4323085940105063473L, new InputArgument[2]
        {
          InputArgument.op_Implicit(this.Drill.DrillFX),
          InputArgument.op_Implicit(0)
        });
      }
      Function.Call((Hash) -5950608294521673290L, new InputArgument[3]
      {
        InputArgument.op_Implicit(this.Drill.Sound),
        InputArgument.op_Implicit("DrillState"),
        InputArgument.op_Implicit(0.0)
      });
      if ((double) num4 > (double) this.Drill.DrillDepth && (double) num4 < (double) this.Drill.DrillDepth + 0.200000002980232)
        Function.Call((Hash) -5950608294521673290L, new InputArgument[3]
        {
          InputArgument.op_Implicit(this.Drill.Sound),
          InputArgument.op_Implicit("DrillState"),
          InputArgument.op_Implicit(0.5)
        });
      if ((double) num4 > (double) this.Drill.DrillDepth && (double) num4 > (double) this.Drill.DrillDepth + 0.200000002980232)
        Function.Call((Hash) -5950608294521673290L, new InputArgument[3]
        {
          InputArgument.op_Implicit(this.Drill.Sound),
          InputArgument.op_Implicit("DrillState"),
          InputArgument.op_Implicit(1.0)
        });
      if ((double) this.Drill.DrillDepth > 0.32600000500679 && !this.Drill.Pin_one)
      {
        Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
        {
          InputArgument.op_Implicit(this.Drill.PinSound),
          InputArgument.op_Implicit("Drill_Pin_Break"),
          InputArgument.op_Implicit("DLC_HEIST_FLEECA_SOUNDSET"),
          InputArgument.op_Implicit(1)
        });
        this.Drill.Pin_one = true;
      }
      if ((double) this.Drill.DrillDepth > 0.476000010967255 && !this.Drill.Pin_two)
      {
        Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
        {
          InputArgument.op_Implicit(this.Drill.PinSound),
          InputArgument.op_Implicit("Drill_Pin_Break"),
          InputArgument.op_Implicit("DLC_HEIST_FLEECA_SOUNDSET"),
          InputArgument.op_Implicit(1)
        });
        this.Drill.Pin_two = true;
      }
      if ((double) this.Drill.DrillDepth > 0.625 && !this.Drill.Pin_three)
      {
        Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
        {
          InputArgument.op_Implicit(this.Drill.PinSound),
          InputArgument.op_Implicit("Drill_Pin_Break"),
          InputArgument.op_Implicit("DLC_HEIST_FLEECA_SOUNDSET"),
          InputArgument.op_Implicit(1)
        });
        this.Drill.Pin_three = true;
      }
      if ((double) this.Drill.DrillDepth > 0.776000022888184 && !this.Drill.Pin_four)
      {
        Function.Call((Hash) 7477453855356397301L, new InputArgument[4]
        {
          InputArgument.op_Implicit(this.Drill.PinSound),
          InputArgument.op_Implicit("Drill_Pin_Break"),
          InputArgument.op_Implicit("DLC_HEIST_FLEECA_SOUNDSET"),
          InputArgument.op_Implicit(1)
        });
        this.Drill.Pin_four = true;
      }
      if ((double) this.Drill.DrillTemperature > 0.990000009536743 || (double) this.Drill.DrillPosition > (double) this.Drill.DrillDepth + 0.300000011920929)
      {
        if (Function.Call<bool>((Hash) -234804619577095963L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.Drill.Sound)
        }) == null)
        {
          Function.Call((Hash) -5950608294521673290L, new InputArgument[3]
          {
            InputArgument.op_Implicit(this.Drill.Sound),
            InputArgument.op_Implicit("DrillState"),
            InputArgument.op_Implicit(0.0)
          });
          Function.Call((Hash) -6651601026601448523L, new InputArgument[1]
          {
            InputArgument.op_Implicit(this.Drill.Sound)
          });
        }
        if (Function.Call<bool>((Hash) -234804619577095963L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.Drill.PinSound)
        }) == null)
          Function.Call((Hash) -6651601026601448523L, new InputArgument[1]
          {
            InputArgument.op_Implicit(this.Drill.PinSound)
          });
        Function.Call((Hash) -1846684210194370067L, new InputArgument[6]
        {
          InputArgument.op_Implicit(this.Drill.FailSound),
          InputArgument.op_Implicit("Drill_Jam"),
          InputArgument.op_Implicit(Game.get_Player().get_Character()),
          InputArgument.op_Implicit("DLC_HEIST_FLEECA_SOUNDSET"),
          InputArgument.op_Implicit(1),
          InputArgument.op_Implicit(20)
        });
        this.Drill.Fail();
      }
    }
    Function.Call((Hash) -3421767765689742354L, new InputArgument[7]
    {
      InputArgument.op_Implicit(this.Drill.ScaleFormDrilling),
      InputArgument.op_Implicit("SET_TEMPERATURE"),
      InputArgument.op_Implicit(this.Drill.DrillTemperature),
      InputArgument.op_Implicit(-1082130432),
      InputArgument.op_Implicit(-1082130432),
      InputArgument.op_Implicit(-1082130432),
      InputArgument.op_Implicit(-1082130432)
    });
    Function.Call((Hash) -3421767765689742354L, new InputArgument[7]
    {
      InputArgument.op_Implicit(this.Drill.ScaleFormDrilling),
      InputArgument.op_Implicit("SET_DRILL_POSITION"),
      InputArgument.op_Implicit(this.Drill.DrillPosition),
      InputArgument.op_Implicit(-1082130432),
      InputArgument.op_Implicit(-1082130432),
      InputArgument.op_Implicit(-1082130432),
      InputArgument.op_Implicit(-1082130432)
    });
    Function.Call((Hash) -3421767765689742354L, new InputArgument[7]
    {
      InputArgument.op_Implicit(this.Drill.ScaleFormDrilling),
      InputArgument.op_Implicit("SET_SPEED"),
      InputArgument.op_Implicit(this.Drill.DrillSpeed),
      InputArgument.op_Implicit(-1082130432),
      InputArgument.op_Implicit(-1082130432),
      InputArgument.op_Implicit(-1082130432),
      InputArgument.op_Implicit(-1082130432)
    });
    if (this.Robs.Count <= 0 || (double) this.Drill.DrillPosition <= 0.800000011920929)
      return;
    Function.Call((Hash) -4323085940105063473L, new InputArgument[2]
    {
      InputArgument.op_Implicit(this.Drill.DrillFX),
      InputArgument.op_Implicit(0)
    });
    if (Function.Call<bool>((Hash) -234804619577095963L, new InputArgument[1]
    {
      InputArgument.op_Implicit(this.Drill.Sound)
    }) == null)
      Function.Call((Hash) -6651601026601448523L, new InputArgument[1]
      {
        InputArgument.op_Implicit(this.Drill.Sound)
      });
    this.Drill.DrillTemperature = 0.0f;
    this.Drill.DrillSpeed = 0.0f;
    this.Robs[0].Drilling_Done = true;
  }

  public void OnKeyUp(object o, KeyEventArgs e)
  {
    this.KeysData = ScriptSettings.Load("scripts//RobFleeca.ini");
    Keys keys = (Keys) this.KeysData.GetValue<Keys>("settings", "StartKey", (M0) 85);
    if (e.KeyCode != keys || Game.get_Player().get_WantedLevel() >= 1 || (this.Robs.Count >= 1 || Function.Call<int>((Hash) 2675767815307398015L, new InputArgument[0]) < 7) || Function.Call<int>((Hash) 2675767815307398015L, new InputArgument[0]) >= 18)
      return;
    for (int list_index = 0; list_index < this.Bank_Locations.Count; ++list_index)
    {
      Vector3 bankLocation = this.Bank_Locations[list_index];
      if ((double) ((Vector3) ref bankLocation).DistanceTo(((Entity) Game.get_Player().get_Character()).get_Position()) < 12.0 && this.BankAvalible[list_index])
        this.Robs.Add(new RobFleeca.Rob(list_index));
    }
  }

  private void DisplayHelpTextThisFrame(string text)
  {
    Function.Call((Hash) -8860350453193909743L, new InputArgument[1]
    {
      InputArgument.op_Implicit("STRING")
    });
    Function.Call((Hash) 7789129354908300458L, new InputArgument[1]
    {
      InputArgument.op_Implicit(text)
    });
    Function.Call((Hash) 2562546386151446694L, new InputArgument[4]
    {
      InputArgument.op_Implicit(0),
      InputArgument.op_Implicit(0),
      InputArgument.op_Implicit(1),
      InputArgument.op_Implicit(-1)
    });
  }

  public class Rob
  {
    public int Objective_Index;
    public int List_Index;
    public Ped Teller;
    public bool TellerCower;
    public Ped Hostage1;
    public Ped Hostage2;
    public Ped Hostage3;
    public bool Hostage3Cower;
    public Prop Cam1;
    public Prop Cam2;
    public Prop Cam3;
    public Prop Cam4;
    public Prop Cam5;
    public Prop BoxWall;
    public Prop BoxDoor;
    public Prop CashEnvelope;
    public bool Faild;
    public bool Drilling_Done;
    public Blip Drill_LocationBlip;
    public bool Teller_Door_Open;
    public bool Vault_Door_Open;
    public int Alarm_Sound;
    public int Vault_Sound;
    public int Checkpoint_Sound;

    public Rob(int list_index)
    {
      this.Objective_Index = 0;
      this.List_Index = list_index;
      this.Teller_Door_Open = false;
      this.Vault_Door_Open = false;
      this.Faild = false;
      this.Drilling_Done = false;
      this.TellerCower = false;
      this.Hostage3Cower = false;
      Function.Call((Hash) -3189321952077349130L, new InputArgument[1]
      {
        InputArgument.op_Implicit("amb@prop_human_atm@female@idle_a")
      });
      Function.Call((Hash) -3189321952077349130L, new InputArgument[1]
      {
        InputArgument.op_Implicit("anim@heists@fleeca_bank@bank_vault_door")
      });
      Function.Call((Hash) -3189321952077349130L, new InputArgument[1]
      {
        InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling")
      });
      while (true)
      {
        if (Function.Call<bool>((Hash) -3444786327252301684L, new InputArgument[1]
        {
          InputArgument.op_Implicit("amb@prop_human_atm@female@idle_a")
        }) == null)
        {
          if (Function.Call<bool>((Hash) -3444786327252301684L, new InputArgument[1]
          {
            InputArgument.op_Implicit("anim@heists@fleeca_bank@bank_vault_door")
          }) == null)
          {
            if (Function.Call<bool>((Hash) -3444786327252301684L, new InputArgument[1]
            {
              InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling")
            }) == null)
            {
              if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
              {
                InputArgument.op_Implicit("HEIST_FLEECA_DRILL"),
                InputArgument.op_Implicit(0),
                InputArgument.op_Implicit(-1)
              }) == null)
              {
                if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                {
                  InputArgument.op_Implicit("HEIST_FLEECA_DRILL_2"),
                  InputArgument.op_Implicit(0),
                  InputArgument.op_Implicit(-1)
                }) == null)
                {
                  if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                  {
                    InputArgument.op_Implicit("DLC_MPHEIST\\HEIST_FLEECA_DRILL"),
                    InputArgument.op_Implicit(0),
                    InputArgument.op_Implicit(-1)
                  }) == null)
                  {
                    if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                    {
                      InputArgument.op_Implicit("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2"),
                      InputArgument.op_Implicit(0),
                      InputArgument.op_Implicit(-1)
                    }) == null)
                    {
                      if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                      {
                        InputArgument.op_Implicit("SAFE_CRACK"),
                        InputArgument.op_Implicit(0),
                        InputArgument.op_Implicit(-1)
                      }) == null)
                      {
                        if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                        {
                          InputArgument.op_Implicit("DLC_Biker_Cracked_Sounds"),
                          InputArgument.op_Implicit(0),
                          InputArgument.op_Implicit(-1)
                        }) == null)
                        {
                          if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                          {
                            InputArgument.op_Implicit("HUD_MINI_GAME_SOUNDSET"),
                            InputArgument.op_Implicit(0),
                            InputArgument.op_Implicit(-1)
                          }) == null)
                          {
                            if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                            {
                              InputArgument.op_Implicit("MissionFailedSounds"),
                              InputArgument.op_Implicit(0),
                              InputArgument.op_Implicit(-1)
                            }) == null)
                            {
                              if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                              {
                                InputArgument.op_Implicit("dlc_heist_fleeca_bank_door_sounds"),
                                InputArgument.op_Implicit(0),
                                InputArgument.op_Implicit(-1)
                              }) == null)
                              {
                                if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                                {
                                  InputArgument.op_Implicit("vault_door"),
                                  InputArgument.op_Implicit(0),
                                  InputArgument.op_Implicit(-1)
                                }) == null)
                                {
                                  if (Function.Call<bool>((Hash) 3423943577717663365L, new InputArgument[3]
                                  {
                                    InputArgument.op_Implicit("Alarms"),
                                    InputArgument.op_Implicit(0),
                                    InputArgument.op_Implicit(-1)
                                  }) == null)
                                  {
                                    if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                                    {
                                      InputArgument.op_Implicit("DLC_HEIST_FLEECA_SOUNDSET"),
                                      InputArgument.op_Implicit(0),
                                      InputArgument.op_Implicit(-1)
                                    }) == null)
                                      Script.Wait(100);
                                    else
                                      break;
                                  }
                                  else
                                    break;
                                }
                                else
                                  break;
                              }
                              else
                                break;
                            }
                            else
                              break;
                          }
                          else
                            break;
                        }
                        else
                          break;
                      }
                      else
                        break;
                    }
                    else
                      break;
                  }
                  else
                    break;
                }
                else
                  break;
              }
              else
                break;
            }
            else
              break;
          }
          else
            break;
        }
        else
          break;
      }
      this.Alarm_Sound = -1;
      this.Vault_Sound = -1;
      this.Checkpoint_Sound = -1;
      this.Alarm_Sound = (int) Function.Call<int>((Hash) 4828851653567843141L, new InputArgument[0]);
      while (this.Alarm_Sound == -1)
        Script.Wait(0);
      this.Vault_Sound = (int) Function.Call<int>((Hash) 4828851653567843141L, new InputArgument[0]);
      while (this.Vault_Sound == -1)
        Script.Wait(0);
      this.Checkpoint_Sound = (int) Function.Call<int>((Hash) 4828851653567843141L, new InputArgument[0]);
      while (this.Checkpoint_Sound == -1)
        Script.Wait(0);
    }

    public void RemoveRob()
    {
      if (Function.Call<bool>((Hash) -234804619577095963L, new InputArgument[1]
      {
        InputArgument.op_Implicit(this.Alarm_Sound)
      }) == null)
        Function.Call((Hash) -6651601026601448523L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.Alarm_Sound)
        });
      Function.Call((Hash) 3837005861822892282L, new InputArgument[1]
      {
        InputArgument.op_Implicit(this.Alarm_Sound)
      });
      if (Function.Call<bool>((Hash) -234804619577095963L, new InputArgument[1]
      {
        InputArgument.op_Implicit(this.Vault_Sound)
      }) == null)
        Function.Call((Hash) -6651601026601448523L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.Vault_Sound)
        });
      Function.Call((Hash) 3837005861822892282L, new InputArgument[1]
      {
        InputArgument.op_Implicit(this.Vault_Sound)
      });
      if (Function.Call<bool>((Hash) -234804619577095963L, new InputArgument[1]
      {
        InputArgument.op_Implicit(this.Checkpoint_Sound)
      }) == null)
        Function.Call((Hash) -6651601026601448523L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.Checkpoint_Sound)
        });
      Function.Call((Hash) 3837005861822892282L, new InputArgument[1]
      {
        InputArgument.op_Implicit(this.Checkpoint_Sound)
      });
      Function.Call((Hash) -690633835676816890L, new InputArgument[1]
      {
        InputArgument.op_Implicit("anim@heists@fleeca_bank@bank_vault_door")
      });
      Function.Call((Hash) -690633835676816890L, new InputArgument[1]
      {
        InputArgument.op_Implicit("amb@prop_human_atm@female@idle_a")
      });
      Function.Call((Hash) -690633835676816890L, new InputArgument[1]
      {
        InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling")
      });
      Game.get_Player().set_WantedLevel((int) Function.Call<int>((Hash) 5517638295545943838L, new InputArgument[0]));
      Function.Call((Hash) 1465062155054416227L, new InputArgument[1]
      {
        InputArgument.op_Implicit(0)
      });
      if (Blip.op_Inequality(((Entity) this.Teller).get_CurrentBlip(), (Blip) null))
        ((Entity) this.Teller).get_CurrentBlip().Remove();
      if (Entity.op_Inequality((Entity) this.Teller, (Entity) null))
        ((Entity) this.Teller).MarkAsNoLongerNeeded();
      if (Blip.op_Inequality(((Entity) this.Hostage1).get_CurrentBlip(), (Blip) null))
        ((Entity) this.Hostage1).get_CurrentBlip().Remove();
      if (Entity.op_Inequality((Entity) this.Hostage1, (Entity) null))
        ((Entity) this.Hostage1).MarkAsNoLongerNeeded();
      if (Blip.op_Inequality(((Entity) this.Hostage2).get_CurrentBlip(), (Blip) null))
        ((Entity) this.Hostage2).get_CurrentBlip().Remove();
      if (Entity.op_Inequality((Entity) this.Hostage2, (Entity) null))
        ((Entity) this.Hostage2).MarkAsNoLongerNeeded();
      if (Blip.op_Inequality(((Entity) this.Hostage3).get_CurrentBlip(), (Blip) null))
        ((Entity) this.Hostage3).get_CurrentBlip().Remove();
      if (Entity.op_Inequality((Entity) this.Hostage3, (Entity) null))
        ((Entity) this.Hostage3).MarkAsNoLongerNeeded();
      if (Entity.op_Inequality((Entity) this.Cam1, (Entity) null))
      {
        if (((Entity) this.Cam1).get_CurrentBlip().Exists())
          ((Entity) this.Cam1).get_CurrentBlip().Remove();
        ((Entity) this.Cam1).MarkAsNoLongerNeeded();
      }
      if (Entity.op_Inequality((Entity) this.Cam2, (Entity) null))
      {
        if (((Entity) this.Cam2).get_CurrentBlip().Exists())
          ((Entity) this.Cam2).get_CurrentBlip().Remove();
        ((Entity) this.Cam2).MarkAsNoLongerNeeded();
      }
      if (Entity.op_Inequality((Entity) this.Cam3, (Entity) null))
      {
        if (((Entity) this.Cam3).get_CurrentBlip().Exists())
          ((Entity) this.Cam3).get_CurrentBlip().Remove();
        ((Entity) this.Cam3).MarkAsNoLongerNeeded();
      }
      if (Entity.op_Inequality((Entity) this.Cam4, (Entity) null))
      {
        if (((Entity) this.Cam4).get_CurrentBlip().Exists())
          ((Entity) this.Cam4).get_CurrentBlip().Remove();
        ((Entity) this.Cam4).MarkAsNoLongerNeeded();
      }
      if (Entity.op_Inequality((Entity) this.Cam5, (Entity) null))
      {
        if (((Entity) this.Cam5).get_CurrentBlip().Exists())
          ((Entity) this.Cam5).get_CurrentBlip().Remove();
        ((Entity) this.Cam5).MarkAsNoLongerNeeded();
      }
      if (Blip.op_Inequality(this.Drill_LocationBlip, (Blip) null))
        this.Drill_LocationBlip.Remove();
      if (Entity.op_Inequality((Entity) this.BoxWall, (Entity) null))
        ((Entity) this.BoxWall).MarkAsNoLongerNeeded();
      if (Entity.op_Inequality((Entity) this.BoxDoor, (Entity) null))
        ((Entity) this.BoxDoor).MarkAsNoLongerNeeded();
      if (Entity.op_Inequality((Entity) this.CashEnvelope, (Entity) null))
        ((Entity) this.CashEnvelope).MarkAsNoLongerNeeded();
      this.Faild = false;
    }
  }

  public class Driller
  {
    public int ScaleFormDrilling;
    public int DrillingSound;
    public bool Drilling;
    public Prop Drill_Prop;
    public Prop CashPickup;
    public bool Pin_one;
    public bool Pin_two;
    public bool Pin_three;
    public bool Pin_four;
    public bool Reset;
    public float DrillSpeed;
    public float DrillDepth;
    public float DrillPosition;
    public float DrillTemperature;
    public int Sound;
    public int PinSound;
    public int FailSound;
    public int DrillFX;
    public int ResetTime;
    public int CamMode;

    public Driller()
    {
      Game.get_Player().get_Character().get_Weapons().Give((WeaponHash) -1569615261, 0, true, true);
      Function.Call((Hash) -1333207332612738240L, new InputArgument[1]
      {
        InputArgument.op_Implicit(false)
      });
      ((Entity) Game.get_Player().get_Character()).set_FreezePosition(true);
      int num = (int) Function.Call<int>((Hash) -4245688709631248378L, new InputArgument[1]
      {
        InputArgument.op_Implicit("DRILLING")
      });
      while (true)
      {
        if (Function.Call<bool>((Hash) -8795499778314053874L, new InputArgument[1]
        {
          InputArgument.op_Implicit(num)
        }) == null)
          Script.Wait(100);
        else
          break;
      }
      this.ScaleFormDrilling = num;
      Function.Call((Hash) -3421767765689742354L, new InputArgument[7]
      {
        InputArgument.op_Implicit(num),
        InputArgument.op_Implicit("SET_SPEED"),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432)
      });
      Function.Call((Hash) -3421767765689742354L, new InputArgument[7]
      {
        InputArgument.op_Implicit(num),
        InputArgument.op_Implicit("SET_HOLE_DEPTH"),
        InputArgument.op_Implicit(0.1f),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432)
      });
      Function.Call((Hash) -3421767765689742354L, new InputArgument[7]
      {
        InputArgument.op_Implicit(num),
        InputArgument.op_Implicit("SET_DRILL_POSITION"),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432)
      });
      Function.Call((Hash) -3421767765689742354L, new InputArgument[7]
      {
        InputArgument.op_Implicit(num),
        InputArgument.op_Implicit("SET_TEMPERATURE"),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432),
        InputArgument.op_Implicit(-1082130432)
      });
      Function.Call((Hash) -5184338789570016586L, new InputArgument[1]
      {
        InputArgument.op_Implicit("fm_mission_controler")
      });
      Function.Call((Hash) -3189321952077349130L, new InputArgument[1]
      {
        InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling")
      });
      while (true)
      {
        if (Function.Call<bool>((Hash) -3444786327252301684L, new InputArgument[1]
        {
          InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling")
        }) == null)
        {
          if (Function.Call<bool>((Hash) -8718333986571631532L, new InputArgument[1]
          {
            InputArgument.op_Implicit("fm_mission_controler")
          }) == null)
          {
            if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
            {
              InputArgument.op_Implicit("HEIST_FLEECA_DRILL"),
              InputArgument.op_Implicit(0),
              InputArgument.op_Implicit(-1)
            }) == null)
            {
              if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
              {
                InputArgument.op_Implicit("HEIST_FLEECA_DRILL_2"),
                InputArgument.op_Implicit(0),
                InputArgument.op_Implicit(-1)
              }) == null)
              {
                if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                {
                  InputArgument.op_Implicit("DLC_MPHEIST\\HEIST_FLEECA_DRILL"),
                  InputArgument.op_Implicit(0),
                  InputArgument.op_Implicit(-1)
                }) == null)
                {
                  if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                  {
                    InputArgument.op_Implicit("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2"),
                    InputArgument.op_Implicit(0),
                    InputArgument.op_Implicit(-1)
                  }) == null)
                  {
                    if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                    {
                      InputArgument.op_Implicit("SAFE_CRACK"),
                      InputArgument.op_Implicit(0),
                      InputArgument.op_Implicit(-1)
                    }) == null)
                    {
                      if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                      {
                        InputArgument.op_Implicit("DLC_Biker_Cracked_Sounds"),
                        InputArgument.op_Implicit(0),
                        InputArgument.op_Implicit(-1)
                      }) == null)
                      {
                        if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                        {
                          InputArgument.op_Implicit("HUD_MINI_GAME_SOUNDSET"),
                          InputArgument.op_Implicit(0),
                          InputArgument.op_Implicit(-1)
                        }) == null)
                        {
                          if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                          {
                            InputArgument.op_Implicit("MissionFailedSounds"),
                            InputArgument.op_Implicit(0),
                            InputArgument.op_Implicit(-1)
                          }) == null)
                          {
                            if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                            {
                              InputArgument.op_Implicit("dlc_heist_fleeca_bank_door_sounds"),
                              InputArgument.op_Implicit(0),
                              InputArgument.op_Implicit(-1)
                            }) == null)
                            {
                              if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                              {
                                InputArgument.op_Implicit("vault_door"),
                                InputArgument.op_Implicit(0),
                                InputArgument.op_Implicit(-1)
                              }) == null)
                              {
                                if (Function.Call<bool>((Hash) 3423943577717663365L, new InputArgument[3]
                                {
                                  InputArgument.op_Implicit("Alarms"),
                                  InputArgument.op_Implicit(0),
                                  InputArgument.op_Implicit(-1)
                                }) == null)
                                {
                                  if (Function.Call<bool>((Hash) -143271042976408167L, new InputArgument[3]
                                  {
                                    InputArgument.op_Implicit("DLC_HEIST_FLEECA_SOUNDSET"),
                                    InputArgument.op_Implicit(0),
                                    InputArgument.op_Implicit(-1)
                                  }) == null)
                                    Script.Wait(100);
                                  else
                                    break;
                                }
                                else
                                  break;
                              }
                              else
                                break;
                            }
                            else
                              break;
                          }
                          else
                            break;
                        }
                        else
                          break;
                      }
                      else
                        break;
                    }
                    else
                      break;
                  }
                  else
                    break;
                }
                else
                  break;
              }
              else
                break;
            }
            else
              break;
          }
          else
            break;
        }
        else
          break;
      }
      this.Sound = (int) Function.Call<int>((Hash) 4828851653567843141L, new InputArgument[0]);
      this.PinSound = (int) Function.Call<int>((Hash) 4828851653567843141L, new InputArgument[0]);
      this.FailSound = (int) Function.Call<int>((Hash) 4828851653567843141L, new InputArgument[0]);
      Model model;
      ((Model) ref model).\u002Ector("hei_prop_heist_drill");
      ((Model) ref model).Request(10000);
      Prop prop = World.CreateProp(model, ((Entity) Game.get_Player().get_Character()).get_Position(), false, false);
      this.Drill_Prop = prop;
      ((Entity) prop).set_FreezePosition(true);
      ((Entity) prop).set_HasCollision(false);
      Function.Call((Hash) 7753999234533660383L, new InputArgument[15]
      {
        InputArgument.op_Implicit(prop),
        InputArgument.op_Implicit(Game.get_Player().get_Character()),
        InputArgument.op_Implicit(Game.get_Player().get_Character().GetBoneIndex((Bone) 28422)),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(0),
        InputArgument.op_Implicit(0),
        InputArgument.op_Implicit(0),
        InputArgument.op_Implicit(0),
        InputArgument.op_Implicit(2),
        InputArgument.op_Implicit(1)
      });
      ((Entity) prop).set_IsInvincible(true);
      ((Model) ref model).MarkAsNoLongerNeeded();
      Vector3.op_Addition(((Entity) Game.get_Player().get_Character()).get_Position(), Vector3.op_Multiply(((Entity) Game.get_Player().get_Character()).get_ForwardVector(), 1f));
      Function.Call((Hash) -1565002832890405996L, new InputArgument[11]
      {
        InputArgument.op_Implicit(Game.get_Player().get_Character()),
        InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling"),
        InputArgument.op_Implicit("drill_right_end"),
        InputArgument.op_Implicit(1f),
        InputArgument.op_Implicit(0.1f),
        InputArgument.op_Implicit(2000),
        InputArgument.op_Implicit(0),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(1),
        InputArgument.op_Implicit(1),
        InputArgument.op_Implicit(1)
      });
      this.Drilling = true;
      this.DrillSpeed = 0.0f;
      this.DrillPosition = 0.0f;
      this.DrillDepth = 0.1f;
      this.DrillTemperature = 0.0f;
      this.Pin_one = false;
      this.Pin_two = false;
      this.Pin_three = false;
      this.Pin_four = false;
      this.Reset = false;
      this.CamMode = 1;
    }

    public void Fail()
    {
      Function.Call((Hash) -4323085940105063473L, new InputArgument[2]
      {
        InputArgument.op_Implicit(this.DrillFX),
        InputArgument.op_Implicit(0)
      });
      Function.Call((Hash) -1565002832890405996L, new InputArgument[11]
      {
        InputArgument.op_Implicit(Game.get_Player().get_Character()),
        InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling"),
        InputArgument.op_Implicit("drill_straight_fail"),
        InputArgument.op_Implicit(1f),
        InputArgument.op_Implicit(0.1f),
        InputArgument.op_Implicit(2000),
        InputArgument.op_Implicit(0),
        InputArgument.op_Implicit(0.0f),
        InputArgument.op_Implicit(1),
        InputArgument.op_Implicit(1),
        InputArgument.op_Implicit(1)
      });
      this.DrillPosition = 0.0f;
      this.DrillSpeed = 0.0f;
      this.DrillTemperature = 0.0f;
      this.Reset = false;
      this.ResetTime = Game.get_GameTime() + 1000;
    }

    public unsafe void RemoveDriller()
    {
      Function.Call((Hash) 3824154378443735381L, new InputArgument[2]
      {
        InputArgument.op_Implicit(2),
        InputArgument.op_Implicit(37)
      });
      Function.Call((Hash) 3824154378443735381L, new InputArgument[2]
      {
        InputArgument.op_Implicit(2),
        InputArgument.op_Implicit(27)
      });
      Function.Call((Hash) -1333207332612738240L, new InputArgument[1]
      {
        InputArgument.op_Implicit(true)
      });
      ((Entity) Game.get_Player().get_Character()).set_FreezePosition(false);
      Game.get_Player().set_CanControlCharacter(true);
      Game.get_Player().get_Character().get_Task().ClearAllImmediately();
      if (Entity.op_Inequality((Entity) this.Drill_Prop, (Entity) null))
        ((Entity) this.Drill_Prop).Delete();
      if (Function.Call<bool>((Hash) -234804619577095963L, new InputArgument[1]
      {
        InputArgument.op_Implicit(this.Sound)
      }) == null)
        Function.Call((Hash) -6651601026601448523L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.Sound)
        });
      if (this.Sound != 0)
        Function.Call((Hash) 3837005861822892282L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.Sound)
        });
      if (Function.Call<bool>((Hash) -234804619577095963L, new InputArgument[1]
      {
        InputArgument.op_Implicit(this.PinSound)
      }) == null)
        Function.Call((Hash) -6651601026601448523L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.PinSound)
        });
      if (this.PinSound != 0)
        Function.Call((Hash) 3837005861822892282L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.PinSound)
        });
      if (Function.Call<bool>((Hash) -234804619577095963L, new InputArgument[1]
      {
        InputArgument.op_Implicit(this.FailSound)
      }) == null)
        Function.Call((Hash) -6651601026601448523L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.FailSound)
        });
      if (this.FailSound != 0)
        Function.Call((Hash) 3837005861822892282L, new InputArgument[1]
        {
          InputArgument.op_Implicit(this.FailSound)
        });
      Function.Call((Hash) -4323085940105063473L, new InputArgument[2]
      {
        InputArgument.op_Implicit(this.DrillFX),
        InputArgument.op_Implicit(0)
      });
      this.Drilling = false;
      this.Pin_one = false;
      this.Pin_two = false;
      this.Pin_three = false;
      this.Pin_four = false;
      Function.Call((Hash) 2095068147598518289L, new InputArgument[1]
      {
        InputArgument.op_Implicit(&this.ScaleFormDrilling)
      });
      Function.Call((Hash) 6873033708056672621L, new InputArgument[1]
      {
        InputArgument.op_Implicit("fm_mission_controler")
      });
      Function.Call((Hash) -690633835676816890L, new InputArgument[1]
      {
        InputArgument.op_Implicit("anim@heists@fleeca_bank@drilling")
      });
    }
  }
}

/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Crew check. Red Hammer Studios classes
Author: Whiztler
Script version: 1.00

Game type: N/A
File: ADF_crewCheck_RHS.sqf
****************************************************************
Instructions:

Below you can configure the classnames for:
- crew allowed to operate aircraft/helicopters.
- crew allowed to operate MBT's and APC's.
- Which aircraft vehicles have crew check restrictions.
- Which armored vehicles have crew check restrictions.
- Whitelisted vehicles (by name given in the editor or script)

These classes are automatically added to the vanilla classes when
RHS is active on the server.
****************************************************************/

// Red Hammer Studios Escalation classes (BluFor and Redfor) of units that are ALLOWED to operate (jet) aircraft
ADF_CC_airJetPilotArray append [
	"rhsusf_airforce_jetpilot"				// never place a comma after the last entry!!!
];

// Red Hammer Studios Escalation classes (BluFor and Redfor) of units that are ALLOWED to operate a helicopter as a pilot
ADF_CC_airHeliPilotArray append [
	"rhsusf_army_ocp_helipilot",
	"rhsusf_army_ucp_helipilot",
	"rhsusf_usmc_marpat_d_helipilot",
	"rhsusf_usmc_marpat_wd_helipilot"		// never place a comma after the last entry!!!
];

// Red Hammer Studios Escalation classes (BluFor and Redfor) of units that are ALLOWED to operate helicopter as crew
ADF_CC_airHeliCrewArray append [
	"rhsusf_army_ocp_helicrew",
	"rhsusf_army_ucp_helicrew",
	"rhsusf_usmc_marpat_wd_helicrew",
	"rhsusf_usmc_marpat_d_helicrew"			// never place a comma after the last entry!!!
];

// Red Hammer Studios Escalation classes (BluFor and Redfor) of units that are ALLOWED to operate armored vehicles (MBT's and APC's)
ADF_CC_cavCrewArray append [
	"rhsusf_army_ocp_crewman",
	"rhsusf_army_ocp_combatcrewman",
	"rhsusf_army_ucp_crewman",
	"rhsusf_army_ucp_combatcrewman",
	"rhsusf_usmc_marpat_wd_crewman",
	"rhsusf_usmc_marpat_wd_combatcrewman",
	"rhsusf_usmc_marpat_d_crewman",
	"rhsusf_usmc_marpat_d_combatcrewman"	// never place a comma after the last entry!!!
];

// aircraft/helicopters Red Hammer Studios Escalation classes (BluFor and Redfor)
ADF_CC_airVeh_Restric append [
	"RHS_Mi24V_vvsc",
	"RHS_Mi24Vt_vvs",
	"RHS_Mi24V_vdv",
	"RHS_Mi24V_FAB_vvsc",
	"RHS_Mi24V_FAB_vvs",
	"RHS_Mi24V_FAB_vdv",
	"RHS_Mi24V_UPK23_vvs",
	"RHS_Mi24V_UPK23_vdv",
	"RHS_Mi24V_UPK23_vvsc",
	"RHS_Mi24V_AT_vvs",
	"RHS_Mi24V_AT_vdv",
	"RHS_Mi24V_AT_vvsc",
	"RHS_Ka52_UPK23_vvs",
	"RHS_Ka52_vvs",
	"RHS_Ka52_UPK23_vvsc",
	"RHS_Mi8AMTSh_vvs",
	"RHS_Mi8AMTSh_vvsc",
	"RHS_Mi8AMTSh_UPK23_vvs",
	"RHS_Mi8AMTSh_FAB_vvs",
	"RHS_Mi8AMTSh_UPK23_vvsc",
	"RHS_Mi8AMTSh_FAB_vvsc",
	"RHS_Mi8MTV3_vvs",
	"RHS_Mi8MTV3_vvsc",
	"RHS_Mi8MTV3_UPK23_vvs",
	"RHS_Mi8MTV3_FAB_vvs",
	"RHS_Mi8MTV3_vdv",
	"RHS_Mi8MTV3_UPK23_vvsc",
	"RHS_Mi8MTV3_UPK23_vdv",
	"RHS_Mi8MTV3_FAB_vvsc",
	"RHS_Mi8MTV3_FAB_vdv",
	"RHS_AH64D",
	"RHS_AH64D_GS",
	"RHS_AH64D_CS",
	"RHS_AH64D_wd",
	"RHS_AH64D_wd_GS",
	"RHS_AH64D_wd_CS",
	"RHS_AH64D_AA",
	"RHS_AH64D_wd_AA",
	"RHS_AH64DGrey",		
	"RHS_AH1Z",
	"RHS_AH1Z_GS",
	"RHS_AH1Z_CS",
	"RHS_AH1Z_wd",
	"RHS_AH1Z_wd_GS",
	"RHS_AH1Z_wd_CS",
	"RHS_CH_47F_10",
	"RHS_CH_47F_light",
	"RHS_UH1Y",
	"RHS_UH1Y_d",
	"RHS_UH1Y_FFAR",
	"RHS_UH1Y_FFAR_d",
	"RHS_UH1Y_UNARMED",
	"RHS_UH1Y_UNARMED_d",
	"RHS_UH60M",
	"RHS_UH60M_MEV",
	"RHS_UH60M_d",
	"RHS_UH60M_MEV_d",
	"RHS_UH60M_MEV2",
	"RHS_UH60M_MEV2_d",
	"RHS_C130J",
	"RHS_A10"								// never place a comma after the last entry!!!
];

// armored vehicles Red Hammer Studios Escalation classes (BluFor and Redfor)
ADF_CC_armVeh_Restric append [
	"rhs_2s3_tv",
	"rhs_zsu234_aa",
	"rhs_zsu234_chdkz",
	"rhs_bmd2",
	"rhs_bmd2_chdkz",
	"rhs_bmd1",
	"rhs_bmd1k",
	"rhs_bmd1p",
	"rhs_bmd1pk",
	"rhs_bmd1r",
	"rhs_bmp1_vdv",
	"rhs_bmp1_tv",
	"rhs_bmp1_msv",
	"rhs_bmp1_vmf",
	"rhs_bmp1_vv",
	"rhs_bmp1p_vdv",
	"rhs_bmp1k_vdv",
	"rhs_bmp1d_vdv",
	"rhs_prp3_vdv",
	"rhs_bmp2e_vdv",
	"rhs_bmp3_msv",
	"rhs_bmp3_late_msv",
	"rhs_bmp3m_msv",
	"rhs_sprut_vdv",
	"rhs_bmd4_vdv",
	"rhs_t72bb_chdkz",
	"rhs_t90_tv",
	"rhs_t72bb_tv",
	"rhs_t72ba_tv",
	"rhs_t72bc_tv",
	"rhs_t72bd_tv",
	"rhs_t80bvk",
	"rhs_t80a",
	"rhs_t80bk",
	"rhs_t80bv",
	"rhs_t80",
	"rhs_t80b",
	"RHS_M2A2_BUSKI",		
	"RHS_M2A2_BUSKI_WD",
	"RHS_M2A2_wd",
	"RHS_M2A3",
	"RHS_M2A3_BUSKIII",
	"RHS_M2A3_BUSKI_wd",
	"RHS_M6_wd",
	"rhsusf_m109_usarmy",
	"rhsusf_m109d_usarmy",
	"rhsusf_m1a1aimwd_usarmy",
	"rhsusf_m1a1aimd_usarmy",
	"rhsusf_m1a1aim_tuski_wd",
	"rhsusf_m1a1fep_d",
	"rhsusf_m1a1fep_wd",
	"rhsusf_m1a1fep_od",
	"rhsusf_m1a2sep1d_usarmy",
	"rhsusf_m1a2sep1wd_usarmy",
	"rhsusf_m1a2sep1tuskid_usarmy",
	"rhsusf_m113_usarmy",
	"rhsusf_m113d_usarmy"					// never place a comma after the last entry!!!			
];






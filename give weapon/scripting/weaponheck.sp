#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

public Plugin myinfo =
{
	name = "give weapon to client",
	author = "neo mark",
	description = "plugin for who like programing language",
	version = "1.0",
	url = "http://www.sourcemod.net/"
};

public void OnPluginStart()
{
	RegConsoleCmd("sm_knife", knife);
	RegConsoleCmd("sm_usp", usp);
	RegConsoleCmd("sm_awp", awp);
	RegConsoleCmd("sm_m4a1", m4a1);
	RegConsoleCmd("sm_ak47", ak47);
}

public Action usp(int client, int args) {
	GivePlayerItem(client, "weapon_usp_silencer");
}
public Action awp(int client, int args) {
	GivePlayerItem(client, "weapon_awp");
}
public Action m4a1(int client, int args) {
	GivePlayerItem(client, "weapon_m4a1");
}
public Action knife(int client, int args) {
	GivePlayerItem(client, "weapon_knife");
}
public Action ak47(int client, int args) {
	GivePlayerItem(client, "give weapon_ak47");
}

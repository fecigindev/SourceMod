#include <sourcemod>
#include <sdkhooks>
 
public Plugin myinfo =
{
	name = "My First Plugin",
	author = "Me",
	description = "My first plugin ever",
	version = "1.0",
	url = "http://www.sourcemod.net/"
};

public void OnPluginStart()
{
	RegConsoleCmd("sm_jumpheck", Test);
}

public int MenuHandler1(Menu menu, MenuAction action, int param1, int param2)
{
	/* Jika suatu opsi dipilih, beri tahu klien tentang item tersebut. */
	if (action == MenuAction_Select)
	{
		ServerCommand("exec my_config.cfg"); 
		char info[32];
		bool found = menu.GetItem(param2, info, sizeof(info));
		PrintToConsole(param1, "Anda memilih item: %d (ditemukan? %d info: %s)", param2, found, info);
	}
	/* Jika menu dibatalkan, cetak pesan ke server tentang hal itu. */
	else if (action == MenuAction_Cancel)
	{
		PrintToServer("Menu klien %d dibatalkan. Alasan: %d", param1, param2);
	}
	/* Jika menu telah berakhir, hancurkan */
	else if (action == MenuAction_End)
	{
		delete menu;
	}
}

public Action Test(int client, int args) {
	GivePlayerItem(client, "weapon_usp_silencer");
	Menu menu = new Menu(MenuHandler1);
	menu.SetTitle("Do you like apples?");
	menu.AddItem("yes", "Yes");
	menu.AddItem("no", "No");
	menu.ExitButton = false;
	menu.Display(client, 20);
 
	return Plugin_Handled;
}

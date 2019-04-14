#include <sourcemod>
#include <sdktools>
 
public Plugin myinfo =
{
	name = "My First Plugin",
	author = "Me",
	description = "My first plugin ever",
	version = "1.0.0.0",
	url = "http://www.sourcemod.net/"
}
 
public void OnPluginStart()
{
	RegAdminCmd("sm_myslap", Command_MySlap, ADMFLAG_SLAY);
}
 
public Action Command_MySlap(int client, int args)
{
	char arg1[32], arg2[32];
 
	/* By default, we set damage = 0 */
	int damage = 0;
 
	/* Get the first argument */
	GetCmdArg(1, arg1, sizeof(arg1));
 
	/* If there are 2 or more arguments, we set damage to
	 * what the user specified. If a damage isn't specified
	 * then it will stay zero. */
	if (args >= 2)
	{
		GetCmdArg(2, arg2, sizeof(arg2));
		damage = StringToInt(arg2);
	}
 
	/* Try and find a matching player */
	int target = FindTarget(client, arg1);
	if (target == -1)
	{
		/* FindTarget() automatically replies with the 
		 * failure reason and returns -1 so we know not 
		 * to continue
		 */
		return Plugin_Handled;
	}
 
	SlapPlayer(target, damage);
 
	char name[MAX_NAME_LENGTH];
 
	GetClientName(target, name, sizeof(name));
	ReplyToCommand(client, "[SM] You slapped %s for %d damage!", name, damage);
 
	return Plugin_Handled;
}

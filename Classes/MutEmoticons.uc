//================================================================================
// MutEmoticons.
//================================================================================
class MutEmoticons extends Mutator
	Config(MutEmoticons);

var() config array<sSmileyMessageType> Smileys;
struct sSmileyMessageType
{
	var string Event;
	var Texture Icon;
};

const Version= "1A";

function PreBeginPlay ()
{
	Super.PreBeginPlay();
	if ( Level.Game.IsA('ASGameInfo') )
	{
		Level.Game.HUDType=string(Class'SmileyHudAS');
	} else {
		if ( Level.Game.IsA('DeathMatch') )
		{
			Level.Game.HUDType=string(Class'SmileyHudDM');
		} else {
			if ( Level.Game.IsA('xTeamGame') )
			{
				Level.Game.HUDType=string(Class'SmileyHudTDM');
			} else {
				if ( Level.Game.IsA('CTFGame') )
				{
					Level.Game.HUDType=string(Class'SmileyHudCTF');
				} else {
					if ( Level.Game.IsA('ONSOnslaughtGame') )
					{
						Level.Game.HUDType=string(Class'SmileyHudONS');
					} else {
						if ( Level.Game.IsA('xBombingRun') )
						{
							Level.Game.HUDType=string(Class'SmileyHudBR');
						} else {
							if ( Level.Game.IsA('xDoubleDom') )
							{
								Level.Game.HUDType=string(Class'SmileyHudONS');
							} else {
								if ( Level.Game.IsA('Invasion') )
								{
									Level.Game.HUDType=string(Class'SmileyHudINV');
								} else {
									if ( Level.Game.IsA('xMutantGame') )
									{
										Level.Game.HUDType=string(Class'SmileyHudMUT');
									} else {
										if ( Level.Game.IsA('xLastManStandingGame') )
										{
											Level.Game.HUDType=string(Class'SmileyHudLMS');
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return;
}

function bool CheckReplacement (Actor Other, byte B)
{
	local EmoticonsReplicationInfo RepInfo;

	if ( Other.IsA('PlayerController') &&  !Other.IsA('MessagingSpectator') )
	{
		RepInfo=Spawn(Class'EmoticonsReplicationInfo',Other);
		RepInfo.Master=self;
		return True;
	}
	return Super.CheckReplacement(Other,B);
	return;
}

function string GetHumanReadableName ()
{
	return "Mut" $ FriendlyName @ "1A";
	return;
}

defaultproperties
{
    Smileys(0)=(Event=">:(",Icon=Texture'Smileys.MAD')
    Smileys(1)=(Event=":(",Icon=Texture'Smileys.11_FROWN')
    Smileys(2)=(Event=":)",Icon=Texture'Smileys.19_GREENLI2')
    Smileys(3)=(Event=":p",Icon=Texture'Smileys.17_TONGUE1')
    Smileys(4)=(Event=":d",Icon=Texture'Smileys.19_GREENLI1')
    Smileys(5)=(Event=":D",Icon=Texture'Smileys.16_BIGGRIN')
    Smileys(6)=(Event=":|",Icon=Texture'Smileys.12_INDIFFE')
    Smileys(7)=(Event=":/",Icon=Texture'Smileys.13_OHWELL')
    Smileys(8)=(Event=":-",Icon=Texture'Smileys.18_REDFACE')
    Smileys(9)=(Event="B)",Icon=Texture'Smileys.COOL')
    Smileys(10)=(Event="xD",Icon=Texture'Smileys.SCREAM6')

    bAddToServerPackages=True
    FriendlyName="Emoticons"
}

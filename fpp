/*
Jona Gurskis 2019/04/29 - 2019/05/10
First programming practice
Text bassed RPG Fallout.
*/

#include <iostream>
#include <windows.h>
#include <string>
#include <conio.h>
#include <fstream>
#include <chrono>
#include <time.h>
#include <ctime>
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
using namespace std;
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
void menu();
void pick();
void status();
void help();
void Function();
void fight();
void enemy();
void levelup();
void gameover();
void loot();
void store();
void load();
void map();
void Megaton();
void Vault101();
void RivetCity();
void Vault87();
void Wasteland();
void ProjectPurity();
void RavenRock();
void story();
void Choice();
void Victory();
void Highscore();


//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
int weapon;
int health, MAXhealth;
int rad, MAXrad, radDmg;
int money;
int stimpack, radaway;
int que = 0;
char input = 'a';
int randnum;
int priesas, priesodmg;
int Exp, xp, xpnext = 100;
int level = 1;
int ArmorAmount;
int score = 0;
int Escore;
//int lootnum;
int radresBonus;
string name;
int killcount = 0;
int questN = 0;
int questkills = 0;

string questO = "";
string enemyName;
string Quest = "NAME";
string func, func2, func3, func4;
string area;
string rase;
string EquipedArmor, weaponE;
string Unarmed = "Unarmed";
string Rags = "Rags";
string choice;

string ArmorCE = "Combat Armor", ArmorPE = "Power Armor", ArmorRE = "Raider armor", ArmorME = "Metal Armor", ArmorVE = "Vault Suit";
string GunPE = "Pistol", GunAE = "Assault rifle", GunSE = "Shotgun", GunME = "Minigun", GunEE = "Fatman";
string MeleeAE = "Axe", MeleeBE = "Baseball Bat", MeleeCE = "Super Sledge";

int CombatArmor = 0; int ArmorC = 20, ArmorCRR = 25;
int PowerArmor = 0; int ArmorP = 25, ArmorPRR = 100;
int RaiderArmor = 0; int ArmorR = 10, ArmorRRR = 15;
int MetalArmor = 0; int ArmorM = 15, ArmorMRR = 5;
int ArmoredVaultSuit = 0; int ArmorV = 5, ArmorVRR = 75;

int Pistol = 0; int GunP = 10;
int AssaultRifle = 0; int GunA = 20;
int Shotgun = 0; int GunS = 30;
int Minigun = 0; int GunM = 40;
int FatMan = 0; int GunE = 100;
int Axe = 0; int MeleeA = 25;
int BaseballBat = 0; int MeleeB = 15;
int SuperSledge = 0; int MeleeC = 65;


//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
int main()
{
	HWND console = GetConsoleWindow();
	RECT r;
	GetWindowRect(console, &r);
	MoveWindow(console, r.left, r.top, 1000, 510, TRUE);

	//map();
	menu();

}

void menu()
{

	while (true)
	{
		cout << R"(

						  __      _ _             _   
						 / _|    | | |           | |  
						| |_ __ _| | | ___  _   _| |_ 
						|  _/ _` | | |/ _ \| | | | __|
						| || (_| | | | (_) | |_| | |_ 
						|_| \__,_|_|_|\___/ \__,_|\__|
	                         
                              )" << '\n';

		cout << "		                      ***********************************************\n\n";
		cout << "							 1 - PLAY GAME.\n";
		cout << "							 2 - LOAD GAME.\n";
		cout << "							 3 - SCORES LIST.\n";
		cout << "							 5 - Exit.\n\n";

		switch (_getch())
		{
		case '1':
			cout << "\n                         GAME \n\n";
			pick();
			break;
		case '2':
			cout << "\n                         GAME LOADED \n\n";
			load();
			break;
		case '3':
			cout << "\n                         SCORES LIST\n\n";
			
			break;
		case '4':
			cout << "\n                         End of Program.\n";
			exit(1);
		default:
			cout << "\n                         No, wrong input my man. \n";
			cout << "                           Choose again.\n";
			break;
		}
	}
}

void pick()
{
	cout << "What creature do you want to play: " << endl;
	cout << "> Human." << endl;
	cout << "> Ghoul." << endl;
	cout << "> Mutant." << endl;
	cin >> rase;
	if (rase == "Human" || rase == "human")
	{
		Quest = "Following in His Footsteps.";
		questO = "Go to Megaton and ask around for information.";
		Pistol = 1;
		ArmoredVaultSuit = 1;
		weaponE = GunPE;
		weapon = GunP;
		health = 100;
		MAXhealth = 100;
		rad = 0;
		radresBonus = ArmorVRR;
		MAXrad = 100 + radresBonus;
		money = 0;
		ArmorAmount = ArmorV;
		EquipedArmor = ArmorVE;
		area = "Vault 101";
		Vault101();

	}
	else if (rase == "Ghoul" || rase == "ghoul")
	{
		Quest = "Big Trouble in Big Town.";
		questO = "Ask about the bomb in the center of the city.";
		Axe = 1;
		RaiderArmor = 1;
		weaponE = MeleeAE;
		weapon = MeleeA;
		health = 125;
		MAXhealth = 125;
		rad = 0;
		radresBonus = ArmorRRR;
		MAXrad = 500 + radresBonus;
		money = 0;
		ArmorAmount = ArmorR;
		EquipedArmor = ArmorRE;
		area = "Megaton";
		Megaton();

	}
	else if (rase == "mutant" || rase == "Mutant")
	{
		Quest = "You gotta shoot'em in the head.";
		questO = "Kill 50 creatures.";
		SuperSledge = 1;
		MetalArmor = 1;
		weaponE = MeleeCE;
		weapon = MeleeC;
		health = 200;
		MAXhealth = 200;
		rad = 0;
		radresBonus = ArmorMRR;
		MAXrad = 1000 + radresBonus;
		money = 0;
		ArmorAmount = ArmorM;
		EquipedArmor = ArmorME;
		area = "Vault 87";
		Vault87();

	}
	else
	{
		cout << "No such creature exists" << endl;
		pick();
	}
}

void status()
{
	//help();
	cout << "---------------STATS---------------" << endl;
	cout << "Creature kill count: " << killcount << endl;
	cout << health << "/" << MAXhealth << " Health" << endl;
	cout << rad << "/" << MAXrad << " Radiation" << endl;
	cout << xp << "/" << xpnext << " Experience" << endl;
	cout << "Your character level - " << level << "." << endl;
	cout << "You have: " << score << " Score." << endl;
	cout << "Caps/Money: " << money << endl;
	cout << "Stimpacks: " << stimpack << endl;
	cout << "Radaway: " << radaway << endl;
	cout << "Weapon: " << weaponE << " With: " << weapon << " damage." << endl;
	cout << "Your Armor: " << EquipedArmor << " With: " << ArmorAmount << " armor." << endl;
	cout << "---------------STATS---------------" << endl;
	cout << "" << endl;
	cout << "--------------------------AREA-----------------------" << endl;
	cout << "			" << area << "." << endl;
	cout << "--------------------------AREA-----------------------" << endl;
	cout << "" << endl;
	cout << "Current quest: " << Quest << endl;
	cout << "Quest objective: " << questO << endl;
}

void help()
{
	cout << "--------------------------------------------------------------HELP------------------------------------------------------" << endl;
	cout << "Possible functions are: Travel, Fight, Equip, Open inventory, Unequip, use, examine, Save game, Exit now, Achievements." << endl;
	cout << "------------------------------------------------------------------------------------------------------------------------\n" << endl;
}

void Function()
{
	cin >> func >> func2;
	if (func == "Fight" || func == "fight")
	{
		fight();
	}
	else if (func == "Travel" || func == "travel")
	{
		srand(time(0));
		randnum = rand() % 10;
		if (randnum == 0 || randnum == 1 || randnum == 2 || randnum == 3 || randnum == 4)
		{
			cout << "you see someting moving in front of you do you want to walk closer?" << endl;
			cin >> input;
			if (!(input == 'Y' || input == 'y' || input == 'N' || input == 'n'))
			{
				cout << "Not [y/n], try again: " << endl;
				cin.clear();
				cin.ignore(132, '\n');
				cin >> input;
			}
			if (input == 'Y' || input == 'y')
			{
				fight();
				if (func2 == "Megaton" || func2 == "megaton")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Megaton";
					system("cls");
					Megaton();
				}
				if (func2 == "Vault101" || func2 == "vault101")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Vault101";
					system("cls");
					Vault101();
				}
				if (func2 == "Wasteland" || func2 == "wasteland")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Wasteland";
					system("cls");
					Wasteland();
				}
				if (func2 == "Rivet" || func2 == "rivet")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Rivet City";
					system("cls");
					RivetCity();
				}
				if (func2 == "Project" || func2 == "project")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Project Purity";
					system("cls");
					ProjectPurity();
				}
				if (func2 == "Raven" || func2 == "raven")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Raven Rock";
					system("cls");
					RavenRock();
				}
				if (func2 == "Vault87" || func2 == "vault87")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Vault87";
					system("cls");
					Vault87();
				}
				else
				{
					cout << "No location close called: " << func2 << " exists." << endl;
				}
			}
			else if (input == 'N' || input == 'n')
			{
				if (func2 == "Megaton" || func2 == "megaton")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Megaton";
					system("cls");
					Megaton();
				}
				if (func2 == "Vault101" || func2 == "vault101")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Vault101";
					system("cls");
					Vault101();
				}
				if (func2 == "Wasteland" || func2 == "wasteland")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Wasteland";
					system("cls");
					Wasteland();
				}
				if (func2 == "Rivet" || func2 == "rivet")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Rivet City";
					system("cls");
					RivetCity();
				}
				if (func2 == "Project" || func2 == "project")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Project Purity";
					system("cls");
					ProjectPurity();
				}
				if (func2 == "Raven" || func2 == "raven")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Raven Rock";
					system("cls");
					RavenRock();
				}
				if (func2 == "Vault87" || func2 == "vault87")
				{
					cout << "Traveling to: " << func2 << endl;
					area = "Vault87";
					system("cls");
					Vault87();
				}
				else
				{
					cout << "No location close called: " << func2 << endl;
				}
			}
		}
		else if (randnum == 5 || randnum == 6 || randnum == 7 || randnum == 8 || randnum == 9)
		{
		if (func2 == "Megaton" || func2 == "megaton")
		{
			cout << "Traveling to: " << func2 << endl;
			area = "Megaton";
			system("cls");
			Megaton();
		}
		if (func2 == "Vault101" || func2 == "vault101")
		{
			cout << "Traveling to: " << func2 << endl;
			area = func2;
			system("cls");
			Vault101();
		}
		if (func2 == "Wasteland" || func2 == "wasteland")
		{
			cout << "Traveling to: " << func2 << endl;
			area = func2;
			system("cls");
			Wasteland();
		}
		if (func2 == "Rivet" || func2 == "rivet")
		{
			cout << "Traveling to: " << func2 << endl;
			area = "Rivet City";
			system("cls");
			RivetCity();
		}
		if (func2 == "Project" || func2 == "project")
		{
			cout << "Traveling to: " << func2 << endl;
			area = "Project Purity";
			system("cls");
			ProjectPurity();
		}
		if (func2 == "Raven" || func2 == "raven")
		{
			cout << "Traveling to: " << func2 << endl;
			area = "Raven Rock";
			system("cls");
			RavenRock();
		}
		if (func2 == "Vault87" || func2 == "vault87")
		{
			cout << "Traveling to: " << func2 << endl;
			area = "Vault87";
			system("cls");
			Vault87();
		}
			else
			{
				cout << "No location close called: " << func2 << " exists." << endl;
			}
		}
	}
	else if (func == "take" || func == "Take")
	{
		cout << "you have picked up: " << func2 << endl;
	}
	else if (func == "help" || func == "Help")
	{
		help();
	}
	else if (func == "use" || func == "Use")
	{
		if (func2 == "stimpack" || func2 == "Stimpack")
		{
			if (stimpack > 0)
			{
				stimpack = stimpack - 1;
				health = health + 25;
				cout << "You have used a Stimpack and gained 25 health back." << endl;
			}
			else
			{
				cout << "You dont have any Stimpacks." << endl;
			}
		}
		else if (func2 == "radaway" || func2 == "Radaway")
		{
			if (radaway > 0)
			{
				radaway = radaway - 1;
				rad = rad - 100;
				cout << "You have used a radaway and cured 100 of your radiation." << endl;
			}
			else
			{
				cout << "You dont have any Radway." << endl;
			}
		}
		else
		{
			cout << "Item: " << func2 << " doesn't exist" << endl;
		}
	}
	else if (func == "exit" || func == "Exit")
	{
		exit(1);
	}
	else if (func == "equip" || func == "Equip")
	{
	if (func2 == "Combat" || func2 == "combat")
		{
			if (CombatArmor >= 1)
			{
			ArmorAmount = ArmorC;
			EquipedArmor = ArmorCE;
			radresBonus = ArmorCRR;
			MAXrad = MAXrad + radresBonus;
			system("cls");
			status();
			cout << "You have equiped Combat Armor" << endl;
			}
			else
			{
			cout << "You dont have this item." << endl;
			}
		}
	if (func2 == "Power" || func2 == "power")
	{
		if (PowerArmor >= 1)
		{
			ArmorAmount = ArmorP;
			EquipedArmor = ArmorPE;
			radresBonus = ArmorPRR;
			MAXrad = MAXrad + radresBonus;
			system("cls");
			status();
			cout << "You have equiped Power Armor" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Raider" || func2 == "raider")
	{
		if (RaiderArmor >= 1)
		{
			ArmorAmount = ArmorR;
			EquipedArmor = ArmorRE;
			radresBonus = ArmorRRR;
			MAXrad = MAXrad + radresBonus;
			system("cls");
			status();
			cout << "You have equiped Raider Armor" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Metal" || func2 == "metal")
	{
		if (MetalArmor >= 1)
		{
			ArmorAmount = ArmorM;
			EquipedArmor = ArmorME;
			radresBonus = ArmorMRR;
			MAXrad = MAXrad + radresBonus;
			system("cls");
			status();
			cout << "You have equiped Metal Armor" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Vault" || func2 == "vault")
	{
		if (ArmoredVaultSuit >= 1)
		{
			ArmorAmount = ArmorV;
			EquipedArmor = ArmorVE;
			radresBonus = ArmorVRR;
			MAXrad = MAXrad + radresBonus;
			system("cls");
			status();
			cout << "You have equiped Armored Vault Suit" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Pistol" || func2 == "pistol")
	{
		if (Pistol >= 1)
		{
			weaponE = GunPE;
			weapon = GunP;
			system("cls");
			status();
			cout << "You have equiped Pistol" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Assault" || func2 == "assault")
	{
		if (AssaultRifle >= 1)
		{
			weaponE = GunAE;
			weapon = GunA;
			system("cls");
			status();
			cout << "You have equiped Assault Rifle" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Shotgun" || func2 == "shotgun")
	{
		if (Shotgun >= 1)
		{
			weaponE = GunSE;
			weapon = GunS;
			system("cls");
			status();
			cout << "You have equiped Shotgun" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Minigun" || func2 == "minigun")
	{
		if (Minigun >= 1)
		{
			weaponE = GunME;
			weapon = GunM;
			system("cls");
			status();
			cout << "You have equiped Minigun" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Fatman" || func2 == "fatman")
	{
		if (FatMan >= 1)
		{
			weaponE = GunEE;
			weapon = GunE;
			system("cls");
			status();
			cout << "You have equiped Fatman" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Axe" || func2 == "axe")
	{
		if (Axe >= 1)
		{
			weaponE = MeleeAE;
			weapon = MeleeA;
			system("cls");
			status();
			cout << "You have equiped Axe" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Baseball" || func2 == "baseball")
	{
		if (BaseballBat >= 1)
		{
			weaponE = MeleeBE;
			weapon = MeleeA;
			system("cls");
			status();
			cout << "You have equiped Baseball bat" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	if (func2 == "Super" || func2 == "super")
	{
		if (SuperSledge >= 1)
		{
			weaponE = MeleeCE;
			weapon = MeleeC;
			system("cls");
			status();
			cout << "You have equiped Super sledge" << endl;
		}
		else
		{
			cout << "You dont have this item." << endl;
		}
	}
	}
	else if (func == "Open" || func == "open")
	{
		if (func2 == "inventory" || func2 == "Inventory")
		{
			cout << "---------------INVENTORY---------------" << endl;
			if (CombatArmor >= 1)
			{
				cout << "Combat Armor." << endl;
			}
			if (PowerArmor >= 1)
			{
				cout << "Power Armor." << endl;
			}
			if (RaiderArmor >= 1)
			{
				cout << "Raider Armor." << endl;
			}
			if (MetalArmor >= 1)
			{
				cout << "Metal Armor." << endl;
			}
			if (ArmoredVaultSuit >= 1)
			{
				cout << "Vault Suit." << endl;
			}
			if (Pistol >= 1)
			{
				cout << "pistol." << endl;
			}
			if (AssaultRifle >= 1)
			{
				cout << "Assault rifle." << endl;
			}
			if (Shotgun >= 1)
			{
				cout << "Shotgun." << endl;
			}
			if (Minigun >= 1)
			{
				cout << "Minigun." << endl;
			}
			if (FatMan >= 1)
			{
				cout << "Fatman." << endl;
			}
			if (Axe >= 1)
			{
				cout << "Axe." << endl;
			}
			if (BaseballBat >= 1)
			{
				cout << "Baseball bat." << endl;
			}
			if (SuperSledge >= 1)
			{
				cout << "Super sledge." << endl;
			}
			if (stimpack >= 1)
			{
				cout << "Stimpacks: " << stimpack << endl;
			}
			if (radaway >= 1)
			{
				cout << "Radaways: " << radaway << endl;
			}
			if (money >= 1)
			{
				cout << "Bottle caps: " << money << endl;
			}
		}
	}
	else if (func == "unequip" || func == "Unequip")
	{
		if (func2 == "pistol" || func2 == "Pistol" || func2 == "Asssault" || func2 == "assault" || func2 == "shotgun" || func2 == "Shotgun" || func2 == "minigun" || func2 == "Minigun" || func2 == "Fatman" || func2 == "fatman" || func2 == "axe" || func2 == "Axe" || func2 == "Baseball" || func2 == "baseball" || func2 == "Super" || func2 == "super")
		{
			weaponE = Unarmed;
			weapon = 1;
			system("cls");
			status();
			cout << "You have unequiped: " << func2 << endl;
		}
		else if (func2 == "Combat" || func2 == "combat" || func2 == "Raider" || func2 == "raider" || func2 == "Vault" || func2 == "vault" || func2 == "Power" || func2 == "power" || func2 == "Metal" || func2 == "metal")
		{
			ArmorAmount = 0;
			EquipedArmor = Rags;
			MAXrad = MAXrad - radresBonus;
			system("cls");
			status();
			cout << "You have unequiped: " << func2 << endl;
		}
	}
	else if (func == "save" || func == "Save" && func2 == "game" || func2 == "Game")
		{
		cout << "SAVING YOUR GAME." << endl;
		ofstream outFile;
		outFile.open("SAVE.txt");
		//FUNKCIJOS KURIAS ISSAUGO

		//intai
		outFile << weapon << endl;
		outFile << health << endl;
		outFile << MAXhealth << endl;
		outFile << radDmg << endl;
		outFile << MAXrad << endl;
		outFile << rad << endl;
		outFile << money << endl;
		outFile << stimpack << endl;
		outFile << radaway << endl;
		outFile << que << endl;
		outFile << input << endl;
		outFile << randnum << endl;
		outFile << priesas << endl;
		outFile << priesodmg << endl;
		outFile << Exp << endl;
		outFile << xp << endl;
		outFile << xpnext << endl;
		outFile << level << endl;
		outFile << ArmorAmount << endl;
		outFile << score << endl;
		outFile << Escore << endl;
		outFile << radresBonus << endl;
		outFile << name << endl;
		outFile << killcount << endl;
		outFile << questN << endl;
		outFile << questkills << endl;

		//itemai
		outFile << CombatArmor << endl;
		outFile << PowerArmor << endl;
		outFile << RaiderArmor << endl;
		outFile << MetalArmor << endl;
		outFile << ArmoredVaultSuit << endl;
		outFile << Pistol << endl;
		outFile << AssaultRifle << endl;
		outFile << Shotgun << endl;
		outFile << Minigun << endl;
		outFile << FatMan << endl;
		outFile << Axe << endl;
		outFile << BaseballBat << endl;
		outFile << SuperSledge << endl;

		//stringai
		outFile << questO << endl;
		outFile << Quest << endl;
		outFile << enemyName << endl;
		outFile << func << endl;
		outFile << func2 << endl;
		outFile << func3 << endl;
		outFile << func4 << endl;
		outFile << area << endl;
		outFile << rase << endl;
		outFile << EquipedArmor << endl;
		outFile << weaponE << endl;
		outFile << choice << endl;
		//FUNKCIJOS KURIAS ISSAUGO
		outFile.close();
		cout << "GAME SAVED." << endl;
		}
	else if (func == "examine" || func == "Examine")
	{
			if (func2 == "combat" || func2 == "Combat")
			{
				cout << "pre-war military armor, old but reliable" << endl;
				cout << "It provides: " << ArmorC << " Armor and " << ArmorCRR << " radiation resistance" << endl;
			}
			if (func2 == "power" || func2 == "Power")
			{
				cout << "old pre-war armor, great armor" << endl;
				cout << "It provides: " << ArmorP << " Armor and " << ArmorPRR << " radiation resistance" << endl;
			}
			if (func2 == "raider" || func2 == "Raider")
			{
				cout << "Raider Armor made out of salvaged materiels" << endl;
				cout << "It provides: " << ArmorR << " Armor and " << ArmorRRR << " radiation resistance" << endl;
			}
			if (func2 == "metal" || func2 == "Metal")
			{
				cout << "Home made strong armor" << endl;
				cout << "It provides: " << ArmorM << " Armor and " << ArmorMRR << " radiation resistance" << endl;
			}
			if (func2 == "vault" || func2 == "Vault")
			{
				cout << "Vault suit with a few additions" << endl;
				cout << "It provides: " << ArmorV << " Armor and " << ArmorVRR << " radiation resistance" << endl;
			}
			if (func2 == "pistol" || func2 == "Pistol")
			{
				cout << "a 10mm pistol" << endl;
				cout << "It Deals: " << GunP << " Damage." << endl;
			}
			if (func2 == "assault" || func2 == "Assault")
			{
				cout << "a 7,62 assault rifle" << endl;
				cout << "It Deals: " << GunA << " Damage." << endl;
			}
			if (func2 == "Shotgun" || func2 == "sfhotgun")
			{
				cout << "a 12gauge automatic combat Shotgun" << endl;
				cout << "It Deals: " << GunS << " Damage." << endl;
			}
			if (func2 == "minigun" || func2 == "Minigun")
			{
				cout << "a 10mm Minigun a killing machine" << endl;
				cout << "It Deals: " << GunM << " Damage." << endl;
			}
			if (func2 == "fatman" || func2 == "Fatman")
			{
				cout << "one of a kind hand held atomic weapon" << endl;
				cout << "It Deals: " << GunE << " Damage." << endl;
			}
			if (func2 == "axe" || func2 == "Axe")
			{
				cout << "a rusty and bloody axe" << endl;
				cout << "It Deals: " << MeleeA << " Damage." << endl;
			}
			if (func2 == "baseball" || func2 == "Baseball")
			{
				cout << "a regular baseball bat" << endl;
				cout << "It Deals: " << MeleeB << " Damage." << endl;
			}
			if (func2 == "super" || func2 == "Super")
			{
				cout << "Greatest sledge in the world" << endl;
				cout << "It Deals: " << MeleeC << " Damage." << endl;
			}
	}
	else if (func == "achievements" || func == "Achievements")
	{
	cout << "---------------ACHIEVEMENTS--------------" << endl;
		if (rase == "human" || rase == "Human")
		{
			if (questN >= 1)
			{
				cout << "Completed quest: Following in his footsteps - Achievement earned." << endl;
			}
			else
			{
				cout << "Complete quest: following in his footsteps." << endl;
			}
			if (questN >= 2)
			{
				cout << "Completed quest: Scientific Pursuits - Achievement earned." << endl;
			}
			else
			{
				cout << "Complete quest: Scientific Pursuits." << endl;
			}
			if (questN >= 3)
			{
				cout << "Completed quest: The American Dream - Achievement earned." << endl;
			}
			else
			{
				cout << "Complete quest: The American Dream." << endl;
			}
			if (questN >= 4)
			{
				cout << "Completed quest: Waters of life / Waters of Death - Achievement earned." << endl;
			}
			else
			{
				cout << "Complete quest : Waters of life / Waters of Death" << endl;
			}
			if (questN >= 5)
			{
				cout << "Completed the Human Campaing - Achievement earned." << endl; 
			}
			else
			{
				cout << "Complete the Human Campaing." << endl;
			}
		}
		if (rase == "Ghoul" || rase == "ghoul")
		{
			if (questN >= 1)
			{
				cout << "Completed quest: Big Trouble in Big Town - Achievement earned." << endl;
			}
			else
			{
				cout << "Complete quest: Big Trouble in Big Town" << endl;
			}
			if (questN >= 2)
			{
				cout << "Completed quest: The power of ATOM - Achievement earned." << endl;
			}
			else
			{
				cout << "Complete quest: The power of ATOM" << endl;
			}
			if (questN >= 3)
			{
				cout << "Completed quest: Wasteland Survival guide - Achievement earned." << endl;
			}
			else
			{
				cout << "Complete quest: Wasteland Survival guide" << endl;
			}
			if (questN >= 4)
			{
				cout << "Completed the Ghoul campaing - Achievement earned." << endl;
			}
			else
			{
				cout << "Complete the Ghoul campaing" << endl;
			}
		}
		if (rase == "Mutant" || rase == "mutant")
		{
			if (questN >= 1)
			{
				cout << "Completed quest: You gotta shoot'em in the head - Achievement earned." << endl;
			}
			else
			{
				cout << "Complete quest: You gotta shoot'em in the head" << endl;
			}
			if (questN >= 2)
			{
				cout << "Completed the Mutant campaing - Achievement earned." << endl;
			}
			else
			{
				cout << "Complete the Mutant campaing" << endl;
			}
		}
		if (weaponE == GunEE)
		{
			cout << "Equiped Fatman - Achievement earned." << endl;
		}
		else
		{
			cout << "Equip Fatman." << endl;
		}
		if (weaponE == MeleeCE)
		{
			cout << "Equiped Super Sledge - Achievement earned." << endl;
		}
		else
		{
			cout << "Equip Super Sledge." << endl;
		}
		if (money == 1000)
		{
			cout << "Collected 1000 caps - Achievement earned." << endl;
		}
		else
		{
			cout << "Collect 1000 caps." << endl;
		}
		if (killcount == 25)
		{
			cout << "Killed 25 Creatures - Achievement earned." << endl;
		}
		else
		{
			cout << "Kill 25 Creatures." << endl;
		}
		if (EquipedArmor == ArmorPE)
		{
			cout << "Equiped Power Armor - Achievement earned." << endl;
		}
		else
		{
			cout << "Equip Power Armor." << endl;
		}
	}
	else
	{
	cout << "Cant recognise the input try again." << endl;
	Function();
	}
	Function();
}

void fight()
{
	enemy();
	do {
		rad = rad + radDmg;
		health = health + ArmorAmount - priesodmg;
		priesas = priesas - weapon;
		cout << "you dealt: " << weapon << "damage." << endl;
		Sleep(500);
		cout << enemyName << " has dealt: " << priesodmg << " damage and has caused " << radDmg << " radiation damage." << endl;
		Sleep(500);
	} while (priesas > 0 && health > 0 && rad < MAXrad);
	if (priesas <= 0 && health > 0 && rad < MAXrad)
	{
		questkills + 1;
		cout << "\n" << enemyName << " is dead." << endl;
		cout << "you got some xp." << endl;
		score = score + Escore;
		xp = xp + Exp;
		cout << "now you have: " << xp << "/" << xpnext << "\n" << endl;
		loot();
		levelup();
	}
	else if (health <= 0 || rad >= MAXrad)
	{
		gameover();
	}
}

void enemy()
{
	//do {
		srand(time(0));
		randnum = rand() % 8;

		if (randnum == 0)
		{
			cout << R"(
		.--.       .--.
	   `    \     /    `  _
     `\.===. \.^./ .===./`
            \/`"`\/
         ,  |     |  ,
        / `\|`-.-'|/` \
       /    |  \  |    \
    .-' ,-'`|   ; |`'-, '-.
        |   |    \|   | 
        |   |    ;|   |
        |   \    /   |
        |    `._/'   |
       .'             `.
    _,'                 `,_
    `                     `
)" << endl;
			//enemyAlive = true;
			enemyName = "Radroach";
			killcount++;
			priesas = 10;
			priesodmg = 1;
			radDmg = 5;
			Exp = 5;
			Escore = 10;
			cout << "you have been attacked by a " << enemyName << "!" << endl;
		}
		else if (randnum == 1)
		{
			cout << R"(
                 .,
        .    ____/__,
      .' \  / \==\```
     /    \ 77 \ |
    /_.----\\__,-----.
<--(\_|_____<__|_____/
    \  ````/|   ``/```
     `.   / |    I|
       `./  |____I|
            !!!!!!!
            | | I |
            | | I |
            \ \ I |
            | | I |
           _|_|_I_|
          /__/____|  `                     `
)" << endl;
			//enemyAlive = true;
			enemyName = "Raider";
			killcount++;
			priesas = 100;
			priesodmg = 10;
			Exp = 25;
			Escore = 25;
			cout << "you have been attacked by a " << enemyName << "!" << endl;
		}
		else if (randnum == 2)
		{
			cout << R"(
     ____          ____
    |oooo|        |oooo|
    |oooo| .----. |oooo|
    |Oooo|/\_||_/\|oooO|
    `----' / __ \ `----'
    ,/ |#|/\/__\/\|#| \,
   /  \|#|| |/\| ||#|/  \
  / \_/|_|| |/\| ||_|\_/ \
 |_\/    o\=----=/o    \/_|
 <_>      |=\__/=|      <_>
 <_>      |------|      <_>
 | |   ___|======|___   | |
//\\  / |O|======|O| \  //\\
|  |  | |O+------+O| |  |  |
|\/|  \_+/        \+_/  |\/|
\__/  _|||        |||_  \__/
      | ||        || |
     [==|]        [|==]
     [===]        [===]
      >_<          >_<
     || ||        || ||
     || ||        || ||
     || ||        || ||   
   __|\_/|__    __|\_/|__
  /___n_n___\  /___n_n___\
)" << endl;
			//enemyAlive = true;
			enemyName = "Sentrybot";
			killcount++;
			priesas = 200;
			priesodmg = 20;
			Exp = 75;
			Escore = 40;
			cout << "you have been attacked by a " << enemyName << "!" << endl;
		}
		else if (randnum == 3)
		{
			cout << R"(
           _......._
       .-'.'.'.'.'.'.`-.
     .'.'.'.'.'.'.'.'.'.`.
    /.'.'               '.\
    |.'    _.--...--._     |
    \    `._.-.....-._.'   /
    |     _..- .-. -.._   |
 .-.'    `.   ((@))  .'   '.-.
( ^ \      `--.   .-'     / ^ )
 \  /         .   .       \  /
 /          .'     '.  .-    \
( _.\    \ (_`-._.-'_)    /._\)
 `-' \   ' .--.          / `-'
     |  / /|_| `-._.'\   |
     |   |       |_| |   /-.._
 _..-\   `.--.______.'  |
      \       .....     |
       `.  .'      `.  /
         \           .'
          `-..___..-`
)" << endl;
			//enemyAlive = true;
			enemyName = "Super Mutant";
			killcount++;
			priesas = 150;
			priesodmg = 15;
			radDmg = 25;
			Exp = 50;
			Escore = 30;
			cout << "you have been attacked by a " << enemyName << "!" << endl;
		}
		else if (randnum == 4)
		{
			cout << R"(
             __                  __
            ( _)                ( _)
           / / \\              / /\_\_
          / /   \\            / / | \ \
         / /     \\          / /  |\ \ \
        /  /   ,  \ ,       / /   /|  \ \
       /  /    |\_ /|      / /   / \   \_\
      /  /  |\/ _ '_| \   / /   /   \    \\
     |  /   |/  0 \0\    / |    |    \    \\
     |    |\|      \_\_ /  /    |     \    \\
     |  | |/    \.\ o\o)  /      \     |    \\
     \    |     /\\`v-v  /        |    |     \\
      | \/    /_| \\_|  /         |    | \    \\
      | |    /__/_ `-` /   _____  |    |  \    \\
      \|    [__]  \_/  |_________  \   |   \    ()
       /    [___] (    \         \  |\ |   |   //
      |    [___]                  |\| \|   /  |/
     /|    [____]                  \  |/\ / / ||
snd (  \   [____ /     ) _\      \  \    \| | ||
     \  \  [_____|    / /     __/    \   / / //
     |   \ [_____/   / /        \    |   \/ //
     |   /  '----|   /=\____   _/    |   / //
  __ /  /        |  /   ___/  _/\    \  | ||
 (/-(/-\)       /   \  (/\/\)/  |    /  | /
               (/\/\)           /   /   //
                      _________/   /    /
                     \____________/    (                     `
)" << endl;
			//enemyAlive = true;
			enemyName = "Deathclaw";
			killcount++;
			priesas = 300;
			priesodmg = 50;
			Exp = 120;
			Escore = 100;
			cout << "you have been attacked by a " << enemyName << "!" << endl;
		}
		else if (randnum == 5)
		{
			cout << R"(
 ___    ___
( _<    >_ )
//        \\
\\___..___//
 `-(    )-'
   _|__|_
  /_|__|_\
  /_|__|_\
  /_\__/_\
   \ || /  _)
     ||   ( )
     \\___//
      `---'
)" << endl;
			//enemyAlive = true;
			enemyName = "Giant Scorpion";
			killcount++;
			priesas = 170;
			priesodmg = 10;
			radDmg = 25;
			Exp = 90;
			Escore = 60;
			cout << "you have been attacked by a " << enemyName << "!" << endl;
		}
		else if (randnum == 6)
		{
			cout << R"(
    ___
 __/ / \
|    |/\
|_--\   \              /-
     \   \-___________/ /
      \                :
      |                :
      |       ___ \    )
       \|  __/     \  )
        | /         \  \
        |l           ( l
        |l            ll
        |l            |l
       / l           / l
       --/           --`                     `
)" << endl;
			//enemyAlive = true;
			enemyName = "Rabit Dog";
			killcount++;
			priesas = 90;
			priesodmg = 15;
			Exp = 20;
			Escore = 15;
			cout << "you have been attacked by a " << enemyName << "!" << endl;
		}
		else if (randnum == 7)
		{
			cout << R"(
                        _,--~~~,
                       .'        `.
                       |           ;
                       |           :
                      /_,-==/     .'
                    /'`\*  ;      :      
                  :'    `-        :      
                  `~*,'     .     :      
                     :__.,._  `;  :      
                     `\'    )  '  `,     
                         \-/  '     )     
                         :'          \ _
                          `~---,-~    `,)
          ___                   \     /~`\
    \---__ `;~~~-------------~~~(| _-'    `,
  ---, ' \`-._____     _______.---'         \
 \--- `~~-`,      ~~~~~~                     `,
\----      )                                   \
\----.  __ /                                    `-
 \----'` -~____  
               ~~~~~--------,.___     -szaman-
                                 ```\_
)" << endl;
			//enemyAlive = true;
			enemyName = "Radioactive Ghoul";
			killcount++;
			priesas = 100;
			priesodmg = 1;
			radDmg = 60;
			Exp = 100;
			Escore = 70;
			cout << "you have been attacked by a " << enemyName << "!" << endl;
			//system("PAUSE");
		}
	//}while (priesas <= 0);
}

void levelup()
{
	if (xp >= xpnext)
	{
		//do {
		level = level + 1;
		cout << "YOU HAVE LEVELD UP TO LEVEL: " << level << endl;
		xp = xp - xpnext;
		xpnext = xpnext + 100;
		score = score + 100;
		cout << "you also gained some of your health back.\n" << endl;
		MAXhealth = MAXhealth + 25;
		health = MAXhealth;
	}
	//} while (xp >= xpnext);
}

void gameover()
{
	if (health > 0 || rad < MAXrad)
	{
		cout << "you were killed. " << endl;
	}
	else if (rad >= MAXrad)
	{
		cout << "you died of radiation poisoning. " << endl;
	}
	cout << R"(

				 _____                                              _
				|  __ \                                            | |
				| |  \/ __ _ _ __ ___   ___    _____   _____ _ __  | |
				| | __ / _` | '_ ` _ \ / _ \  / _ \ \ / / _ \ '__| | |
				| |_\ \ (_| | | | | | |  __/ | (_) \ V /  __/ |    |_|
				 \____/\__,_|_| |_| |_|\___|  \___/ \_/ \___|_|    (_)



							)" << endl;
	cout << "You have earned: " << score << " score." << endl;
	cout << "Enter your name to display in highscore screen: ";
	cin >> name;
	cout << "PRESS ANY KEY TO EXIT THE GAME. " << endl;
	_getch();
	exit(1);
}

void Victory()
{
	if (rase == "human" || rase == "Human")
	{
		if (choice == "poison" || choice == "Poison")
		{
			cout << R"(
				           __xxxxxxxxxxxxxxxx___.
                        _gxXXXXXXXXXXXXXXXXXXXXXXXX!x_
                   __x!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!x_
                ,gXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx_
              ,gXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!_
            _!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!.
          gXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXs
        ,!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!.
       g!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
      iXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
     ,XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
     !XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
   ,XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
   !XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXi
  dXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  !XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   XXXXXXXXXXXXXXXXXXXf~~~VXXXXXXXXXXXXXXXXXXXXXXXXXXvvvvvvvvXXXXXXXXXXXXXX!
   !XXXXXXXXXXXXXXXf`       'XXXXXXXXXXXXXXXXXXXXXf`          '~XXXXXXXXXXP
    vXXXXXXXXXXXX!            !XXXXXXXXXXXXXXXXXX!              !XXXXXXXXX
     XXXXXXXXXXv`              'VXXXXXXXXXXXXXXX                !XXXXXXXX!
     !XXXXXXXXX.                 YXXXXXXXXXXXXX!                XXXXXXXXX
      XXXXXXXXX!                 ,XXXXXXXXXXXXXX                VXXXXXXX!
      'XXXXXXXX!                ,!XXXX ~~XXXXXXX               iXXXXXX~
       'XXXXXXXX               ,XXXXXX   XXXXXXXX!             xXXXXXX!
        !XXXXXXX!xxxxxxs______xXXXXXXX   'YXXXXXX!          ,xXXXXXXXX
         YXXXXXXXXXXXXXXXXXXXXXXXXXXX`    VXXXXXXX!s. __gxx!XXXXXXXXXP
          XXXXXXXXXXXXXXXXXXXXXXXXXX!      'XXXXXXXXXXXXXXXXXXXXXXXXX!
          XXXXXXXXXXXXXXXXXXXXXXXXXP        'YXXXXXXXXXXXXXXXXXXXXXXX!
          XXXXXXXXXXXXXXXXXXXXXXXX!     i    !XXXXXXXXXXXXXXXXXXXXXXXX
          XXXXXXXXXXXXXXXXXXXXXXXX!     XX   !XXXXXXXXXXXXXXXXXXXXXXXX
          XXXXXXXXXXXXXXXXXXXXXXXXx_   iXX_,_dXXXXXXXXXXXXXXXXXXXXXXXX
          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXP
          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
           ~vXvvvvXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXf
                    'VXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXvvvvvv~
                      'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX~
                  _    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXv`
                 -XX!  !XXXXXXX~XXXXXXXXXXXXXXXXXXXXXX~   Xxi
                  YXX  '~ XXXXX XXXXXXXXXXXXXXXXXXXX`     iXX`
                  !XX!    !XXX` XXXXXXXXXXXXXXXXXXXX      !XX
                  !XXX    '~Vf  YXXXXXXXXXXXXXP YXXX     !XXX
                  !XXX  ,_      !XXP YXXXfXXXX!  XXX     XXXV
                  !XXX !XX           'XXP 'YXX!       ,.!XXX!
                  !XXXi!XP  XX.                  ,_  !XXXXXX!
                  iXXXx X!  XX! !Xx.  ,.     xs.,XXi !XXXXXXf
                   XXXXXXXXXXXXXXXXX! _!XXx  dXXXXXXX.iXXXXXX
                   VXXXXXXXXXXXXXXXXXXXXXXXxxXXXXXXXXXXXXXXX!
                   YXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXV
                    'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
                    'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXf
                       VXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXf
                         VXXXXXXXXXXXXXXXXXXXXXXXXXXXXv`
                          ~vXXXXXXXXXXXXXXXXXXXXXXXf`
                              ~vXXXXXXXXXXXXXXXXv~
                                 '~VvXXXXXXXV~~
                                       ~~
				)" << endl;
			Highscore();
		}
		else if (choice == "purify" || choice == "Purify")
		{
			cout << R"(
________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
___¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
¶¶¶¶______¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_______¶¶¶¶
¶¶¶_______¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶________¶¶¶
¶¶________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶________¶¶¶
¶¶¶_____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶______¶¶¶
¶¶¶____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶____¶¶¶¶
_¶¶¶___¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶____¶¶¶
_¶¶¶¶___¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶¶__¶¶¶¶
___¶¶¶¶__¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶¶¶
____¶¶¶¶¶¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶¶¶¶¶¶¶
______¶¶¶¶¶¶__¶¶¶¶¶¶¶¶¶¶¶¶¶¶___¶¶¶¶¶¶
_______________¶¶¶¶¶¶¶¶¶¶¶¶
_________________¶¶¶¶¶¶¶¶
___________________¶¶¶¶
___________________¶¶¶¶
___________________¶¶¶¶
___________________¶¶¶¶
_______________¶¶¶¶¶¶¶¶¶¶¶¶
____________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
____________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
____________¶¶¶____________¶¶¶
____________¶¶¶____________¶¶¶
____________¶¶¶____________¶¶¶
____________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
____________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
__________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
_________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
)" << endl;
			Highscore();
		}
	}
	else if (rase == "ghoul" || rase == "Ghoul")
	{
	cout << R"(
________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
___¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
¶¶¶¶______¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_______¶¶¶¶
¶¶¶_______¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶________¶¶¶
¶¶________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶________¶¶¶
¶¶¶_____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶______¶¶¶
¶¶¶____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶____¶¶¶¶
_¶¶¶___¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶____¶¶¶
_¶¶¶¶___¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶¶__¶¶¶¶
___¶¶¶¶__¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶¶¶
____¶¶¶¶¶¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶¶¶¶¶¶¶¶¶
______¶¶¶¶¶¶__¶¶¶¶¶¶¶¶¶¶¶¶¶¶___¶¶¶¶¶¶
_______________¶¶¶¶¶¶¶¶¶¶¶¶
_________________¶¶¶¶¶¶¶¶
___________________¶¶¶¶
___________________¶¶¶¶
___________________¶¶¶¶
___________________¶¶¶¶
_______________¶¶¶¶¶¶¶¶¶¶¶¶
____________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
____________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
____________¶¶¶____________¶¶¶
____________¶¶¶____________¶¶¶
____________¶¶¶____________¶¶¶
____________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
____________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
__________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
_________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
)" << endl;
	Highscore();
	}
	else if (rase == "Mutant" || rase == "mutant")
	{
	cout << R"(
				           __xxxxxxxxxxxxxxxx___.
                        _gxXXXXXXXXXXXXXXXXXXXXXXXX!x_
                   __x!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!x_
                ,gXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx_
              ,gXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!_
            _!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!.
          gXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXs
        ,!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!.
       g!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
      iXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
     ,XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
     !XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
   ,XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
   !XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXi
  dXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  !XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   XXXXXXXXXXXXXXXXXXXf~~~VXXXXXXXXXXXXXXXXXXXXXXXXXXvvvvvvvvXXXXXXXXXXXXXX!
   !XXXXXXXXXXXXXXXf`       'XXXXXXXXXXXXXXXXXXXXXf`          '~XXXXXXXXXXP
    vXXXXXXXXXXXX!            !XXXXXXXXXXXXXXXXXX!              !XXXXXXXXX
     XXXXXXXXXXv`              'VXXXXXXXXXXXXXXX                !XXXXXXXX!
     !XXXXXXXXX.                 YXXXXXXXXXXXXX!                XXXXXXXXX
      XXXXXXXXX!                 ,XXXXXXXXXXXXXX                VXXXXXXX!
      'XXXXXXXX!                ,!XXXX ~~XXXXXXX               iXXXXXX~
       'XXXXXXXX               ,XXXXXX   XXXXXXXX!             xXXXXXX!
        !XXXXXXX!xxxxxxs______xXXXXXXX   'YXXXXXX!          ,xXXXXXXXX
         YXXXXXXXXXXXXXXXXXXXXXXXXXXX`    VXXXXXXX!s. __gxx!XXXXXXXXXP
          XXXXXXXXXXXXXXXXXXXXXXXXXX!      'XXXXXXXXXXXXXXXXXXXXXXXXX!
          XXXXXXXXXXXXXXXXXXXXXXXXXP        'YXXXXXXXXXXXXXXXXXXXXXXX!
          XXXXXXXXXXXXXXXXXXXXXXXX!     i    !XXXXXXXXXXXXXXXXXXXXXXXX
          XXXXXXXXXXXXXXXXXXXXXXXX!     XX   !XXXXXXXXXXXXXXXXXXXXXXXX
          XXXXXXXXXXXXXXXXXXXXXXXXx_   iXX_,_dXXXXXXXXXXXXXXXXXXXXXXXX
          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXP
          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
           ~vXvvvvXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXf
                    'VXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXvvvvvv~
                      'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX~
                  _    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXv`
                 -XX!  !XXXXXXX~XXXXXXXXXXXXXXXXXXXXXX~   Xxi
                  YXX  '~ XXXXX XXXXXXXXXXXXXXXXXXXX`     iXX`
                  !XX!    !XXX` XXXXXXXXXXXXXXXXXXXX      !XX
                  !XXX    '~Vf  YXXXXXXXXXXXXXP YXXX     !XXX
                  !XXX  ,_      !XXP YXXXfXXXX!  XXX     XXXV
                  !XXX !XX           'XXP 'YXX!       ,.!XXX!
                  !XXXi!XP  XX.                  ,_  !XXXXXX!
                  iXXXx X!  XX! !Xx.  ,.     xs.,XXi !XXXXXXf
                   XXXXXXXXXXXXXXXXX! _!XXx  dXXXXXXX.iXXXXXX
                   VXXXXXXXXXXXXXXXXXXXXXXXxxXXXXXXXXXXXXXXX!
                   YXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXV
                    'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX!
                    'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXf
                       VXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXf
                         VXXXXXXXXXXXXXXXXXXXXXXXXXXXXv`
                          ~vXXXXXXXXXXXXXXXXXXXXXXXf`
                              ~vXXXXXXXXXXXXXXXXv~
                                 '~VvXXXXXXXV~~
                                       ~~
				)" << endl;
	Highscore();
	}
	cout << "" << endl;
	cout << "You have earned: " << score << " score." << endl;
	cout << "Enter your name to display in highscore screen: ";
	cin >> name;
	cout << "PRESS ANY KEY TO EXIT THE GAME. " << endl;
	_getch();
	exit(1);
}

void loot()
{
		srand(time(0));
		randnum = rand() % 17;

		if (randnum == 17)
		{
			srand(time(0));
			randnum = rand() % 100;
			randnum = randnum + 1;
			money = money + randnum + 1;
			cout << "You got: " << randnum << " caps." << endl;
		}
		else if (randnum == 1)
		{
			CombatArmor = CombatArmor + 1;
			cout << "You got: " << "CombatArmor." << endl;
		}
		else if (randnum == 2)
		{
			PowerArmor = PowerArmor + 1;
			cout << "You got: " << "PowerArmor." << endl;
		}
		else if (randnum == 3)
		{
			RaiderArmor = RaiderArmor + 1;
			cout << "You got: " << "RaiderArmor." << endl;
		}
		else if (randnum == 4)
		{
			MetalArmor = MetalArmor + 1;
			cout << "You got: " << "MetalArmor." << endl;
		}
		else if (randnum == 5)
		{
			ArmoredVaultSuit = ArmoredVaultSuit + 1;
			cout << "You got: " << "ArmoredVaultSuit." << endl;
		}
		else if (randnum == 6)
		{
			Pistol = Pistol + 1;
			cout << "You got: " << "Pistol." << endl;
		}
		else if (randnum == 7)
		{
			AssaultRifle = AssaultRifle + 1;
			cout << "You got: " << "AssaultRifle." << endl;
		}
		else if (randnum == 8)
		{
			Shotgun = Shotgun + 1;
			cout << "You got: " << "Shotgun." << endl;
		}
		else if (randnum == 9)
		{
			Minigun = Minigun + 1;
			cout << "You got: " << "Minigun." << endl;
		}
		else if (randnum == 10)
		{
			FatMan = FatMan + 1;
			cout << "You got: " << "FatMan." << endl;
		}
		else if (randnum == 11)
		{
			Axe = Axe + 1;
			cout << "You got: " << "Axe." << endl;
		}
		else if (randnum == 12)
		{
			BaseballBat = BaseballBat + 1;
			cout << "You got: " << "BaseballBat." << endl;
		}
		else if (randnum == 13)
		{
			SuperSledge = SuperSledge + 1;
			cout << "You got: " << "SuperSledge." << endl;
		}
		else if (randnum == 14)
		{
			srand(time(0));
			randnum = rand() % 3;
			randnum = randnum + 1;
			stimpack = stimpack + randnum;
			cout << "You got: " << randnum << " Stimpack." << endl;
		}
		else if (randnum == 15)
		{
			srand(time(0));
			randnum = rand() % 3;
			radaway = radaway + randnum + 1;
			cout << "You got: " << randnum << " Radaway." << endl;
		}
		else if (randnum == 16)
		{
			cout << "You got no loot." << endl;
		}
}

void store()
{
	system("cls");
		cout << "-------------------HELP----------------------" << endl;
		cout << "Possible functions are: Buy, Sell, Exit Shop." << endl;
		cout << "-------------------HELP----------------------\n" << endl;
		cout << "You have: " << money << " caps." << endl;
		cout << "---------------BUY----------------" << endl;
		cout << "Items you are able to buy: " << endl;
		cout << "ARMOR: Combat Armor(40), Power Armor(50), Raider Armor(20), Metal Armor(30)." << endl;
		cout << "WEAPONS: Pistol(20), Assault Rifle(40), Shotgun(60), Minigun(80), Fatman(200), Axe(50), Baseball bat(30)." << endl;
		cout << "HEALTH: Stimpack(50), Radaway(30).\n" << endl;
		cout << "---------------SELL---------------" << endl;
		cout << "Items you are able to Sell: " << endl;
		if (CombatArmor >= 1)
		{
			cout << "Combat Armor, ";
		}
		if (PowerArmor >= 1)
		{
			cout << "Power Armor, ";
		}
		if (RaiderArmor >= 1)
		{
			cout << "Raider Armor, ";
		}
		if (MetalArmor >= 1)
		{
			cout << "Metal Armor, ";
		}
		if (ArmoredVaultSuit >= 1)
		{
			cout << "Vault Suit, ";
		}
		cout << "" << endl;
		if (Pistol >= 1)
		{
			cout << "Pistol, ";
		}
		if (AssaultRifle >= 1)
		{
			cout << "Assault rifle, ";
		}
		if (Shotgun >= 1)
		{
			cout << "Combat Shotgun, ";
		}
		if (Minigun >= 1)
		{
			cout << "Minigun, ";
		}
		if (FatMan >= 1)
		{
			cout << "Fatman, ";
		}
		if (BaseballBat >= 1)
		{
			cout << "Baseball bat, ";
		}
		if (Axe >= 1)
		{
			cout << "Axe, ";
		}
		if (SuperSledge >= 1)
		{
			cout << "Super sledge, ";
		}
		cout << "" << endl;
		if (stimpack >= 1)
		{
			cout << stimpack << " - Stimpacks" << endl;
		}
		if (radaway >= 1)
		{
			cout << radaway << " - Radaways" << endl;
		}
		cin >> func3 >> func4;
	if (func3 == "Buy" || func3 == "buy")
	{
		if (func4 == "Combat" || func4 == "combat")
		{
			if (money >= 40)
			{
				money = money - 40;
				CombatArmor = CombatArmor + 1;
				cout << "You just bought Combat Armor" << endl;
			}
			else
			{
				cout << "Not enouth caps" << endl;
			}
		}
		else if (func4 == "Power" || func4 == "power")
		{
			if (money >= 50)
			{
				money = money - 50;
				PowerArmor = PowerArmor + 1;
				cout << "You just bought Power Armor" << endl;
			}
			else
			{
				cout << "Not enouth caps" << endl;
			}
		}
		else if (func4 == "Raider" || func4 == "raider")
		{
			if (money >= 20)
			{
				money = money - 20;
				RaiderArmor = RaiderArmor + 1;
				cout << "You just bought Raider Armor" << endl;
			}
			else
			{
				cout << "Not enouth caps" << endl;
			}
		}
		else if (func4 == "Metal" || func4 == "metal")
		{
			if (money >= 30)
			{
				money = money - 30;
				MetalArmor = MetalArmor + 1;
				cout << "You just bought Metal Armor" << endl;
			}
			else
			{
				cout << "Not enouth caps" << endl;
			}
		}
		else if (func4 == "Pistol" || func4 == "pistol")
		{
			if (money >= 20)
			{
				money = money - 20;
				Pistol = Pistol + 1;
				cout << "You just bought Pistol" << endl;
			}
			else
			{
				cout << "Not enouth caps" << endl;
			}
		}
		else if (func4 == "Assault" || func4 == "assault")
		{
			if (money >= 40)
			{
				money = money - 40;
				AssaultRifle = AssaultRifle + 1;
				cout << "You just bought Assault Rifle" << endl;
			}
			else
			{
				cout << "Not enouth caps" << endl;
			}
		}
		else if (func4 == "Shotgun" || func4 == "shotgun")
		{
			if (money >= 60)
			{
				money = money - 60;
				Shotgun = Shotgun + 1;
				cout << "You just bought Shotgun" << endl;
			}
			else
			{
				cout << "Not enouth caps" << endl;
			}
		}
		else if (func4 == "Minigun" || func4 == "minigun")
		{
			if (money >= 80)
			{
				money = money - 80;
				Minigun = Minigun + 1;
				cout << "You just bought Minigun" << endl;
			}
			else
			{
				cout << "Not enouth caps" << endl;
			}
		}
		else if (func4 == "Fatman" || func4 == "fatman")
		{
		if (money >= 200)
		{
			money = money - 200;
			FatMan = FatMan + 1;
			cout << "You just bought Fatman" << endl;
		}
		else
		{
			cout << "Not enouth caps" << endl;
		}
		}
		else if (func4 == "Axe" || func4 == "axe")
		{
		if (money >= 50)
		{
			money = money - 50;
			Axe = Axe + 1;
			cout << "You just bought Axe" << endl;
		}
		else
		{
			cout << "Not enouth caps" << endl;
		}
		}
		else if (func4 == "Baseball" || func4 == "baseball")
		{
		if (money >= 30)
		{
			money = money - 30;
			BaseballBat = BaseballBat + 1;
			cout << "You just bought Baseball bat" << endl;
		}
		else
		{
			cout << "Not enouth caps" << endl;
		}

		}
		else if (func4 == "Stimpack" || func4 == "stimpack")
		{
		if (money >= 50)
		{
			money = money - 50;
			stimpack = stimpack + 1;
			cout << "You just bought a Stimpack" << endl;
		}
		else
		{
			cout << "Not enouth caps" << endl;
		}
		}
		else if (func4 == "Radaway" || func4 == "radaway")
		{
		if (money >= 30)
		{
			money = money - 30;
			radaway = radaway + 1;
			cout << "You just bought a Radaway" << endl;
		}
		else
		{
			cout << "Not enouth caps" << endl;
		}
		}
		else
		{
			cout << "Item: " << func4 << " doesnt exist." << endl;
		}
	}
	else if (func3 == "Sell" || func3 == "sell")
	{
		if (func4 == "Combat" || func4 == "combat")
		{
			if (CombatArmor >= 1)
			{
				money = money + 20;
				CombatArmor = CombatArmor - 1;
				if (EquipedArmor == ArmorCE)
				{
					ArmorAmount = 0;
					EquipedArmor = Rags;
					MAXrad = MAXrad - ArmorCRR;
				}

			}
			else
			{
				cout << "you dont have any Combat Armors." << endl;
			}
		}
		else if (func4 == "Vault" || func4 == "vault")
		{
			if (ArmoredVaultSuit >= 1)
			{
				money = money + 100;
				ArmoredVaultSuit = ArmoredVaultSuit - 1;
				cout << "You just sold Armored Vault Suit for 100 caps" << endl;
				if (EquipedArmor == ArmorVE)
				{
					ArmorAmount = 0;
					EquipedArmor = Rags;
					MAXrad = MAXrad - ArmorVRR;
				}

			}
			else
			{
				cout << "you dont have any Combat Armors." << endl;
			}
		}

		else if (func4 == "Power" || func4 == "power")
		{
			if (PowerArmor >= 1)
			{
				money = money + 25;
				PowerArmor = PowerArmor - 1;
				cout << "You just sold Power Armor for 25 caps" << endl;
				if (EquipedArmor == ArmorPE)
				{
					ArmorAmount = 0;
					EquipedArmor = Rags;
					MAXrad = MAXrad - ArmorPRR;
				}

			}
			else
			{
				cout << "you dont have any Power Armors." << endl;
			}
		}
		else if (func4 == "Raider" || func4 == "raider")
		{
			if (RaiderArmor >= 1)
			{
				money = money + 10;
				RaiderArmor = RaiderArmor - 1;
				cout << "You just sold Raider Armor for 10 caps" << endl;
				if (EquipedArmor == ArmorRE)
				{
					ArmorAmount = 0;
					EquipedArmor = Rags;
					MAXrad = MAXrad - ArmorRRR;
				}

			}
			else
			{
				cout << "you dont have any Raider Armors." << endl;
			}
		}
		else if (func4 == "Metal" || func4 == "metal")
		{
			if (MetalArmor >= 1)
			{
				money = money + 15;
				MetalArmor = MetalArmor - 1;
				cout << "You just sold Metal Armor for 15 caps" << endl;
				if (EquipedArmor == ArmorME)
				{
					ArmorAmount = 0;
					EquipedArmor = Rags;
					MAXrad = MAXrad - ArmorMRR;
				}

			}
			else
			{
				cout << "you dont have any Metal Armors." << endl;
			}
		}
		else if (func4 == "Pistol" || func4 == "pistol")
		{
			if (Pistol >= 1)
			{
				money = money + 10;
				Pistol = Pistol - 1;
				cout << "You just sold Pistol for 10 caps" << endl;
				if (weaponE == GunPE)
				{
					weaponE = Unarmed;
					weapon = 1;
				}
			}
			else
			{
				cout << "you dont have any Pistols." << endl;
			}
		}
		else if (func4 == "Assault" || func4 == "assault")
		{
			if (AssaultRifle >= 1)
			{
				money = money + 20;
				AssaultRifle = AssaultRifle - 1;
				cout << "You just sold Assault Rifle for 20 caps" << endl;
				if (weaponE == GunAE)
				{
					weaponE = Unarmed;
					weapon = 1;
				}
			}
			else
			{
				cout << "you dont have any Assault Rifles ." << endl;
			}
		}
		else if (func4 == "Shotgun" || func4 == "shotgun")
		{
			if (Shotgun >= 1)
			{
				money = money + 30;
				Shotgun = Shotgun - 1;
				cout << "You just sold Shotgun for 30 caps" << endl;
				if (weaponE == GunSE)
				{
					weaponE = Unarmed;
					weapon = 1;
				}
			}
			else
			{
				cout << "you dont have any Shotgunss." << endl;
			}
		}
		else if (func4 == "Minigun" || func4 == "minigun")
		{
			if (Minigun >= 1)
			{
				money = money + 40;
				Minigun = Minigun - 1;
				cout << "You just sold Minigun for 40 caps" << endl;
				if (weaponE == GunME)
				{
					weaponE = Unarmed;
					weapon = 1;
				}
			}
			else
			{
				cout << "you dont have any Miniguns." << endl;
			}
		}
		else if (func4 == "Fatman" || func4 == "fatman")
		{
			if (FatMan >= 1)
			{
			money = money + 100;
			FatMan = FatMan - 1;
			cout << "You just sold Fatman for 100 caps" << endl;
			if (weaponE == GunEE)
			{
				weaponE = Unarmed;
				weapon = 1;
			}
			}
		else
			{
			cout << "you dont have any Fatmans." << endl;
			}
		}
		else if (func4 == "Axe" || func4 == "axe")
		{
		if (Axe >= 1)
		{
			Axe = Axe - 1;
			money = money + 25;
			cout << "You just sold Axe for 25 caps" << endl;
			if (weaponE == MeleeAE)
			{
				weaponE = Unarmed;
				weapon = 1;
			}
		}
		else
		{
			cout << "you dont have any Axes." << endl;
		}
		}
		else if (func4 == "Baseball" || func4 == "baseball")
		{
		if (BaseballBat >= 1)
		{
			money = money + 15;
			BaseballBat = BaseballBat - 1;
			cout << "You just sold Baseball bat for 15 caps" << endl;
			if (weaponE == MeleeBE)
			{
				weaponE = Unarmed;
				weapon = 1;
			}
		}
		else
		{
			cout << "you dont have any Baseball bats." << endl;
		}
		}
		else if (func4 == "Super" || func4 == "super")
		{
		if (SuperSledge >= 1)
		{
			money = money + 65;
			SuperSledge = SuperSledge - 1;
			cout << "You just sold Super sledge for 65 caps" << endl;
			if (weaponE == MeleeCE)
			{
				weaponE = Unarmed;
				weapon = 1;
			}
		}
		else
		{
			cout << "you dont have any Baseball bats." << endl;
		}
		}
		else if (func4 == "Stimpack" || func4 == "stimpack")
		{
		if (stimpack >= 1)
		{
			money = money + 25;
			stimpack = stimpack - 1;
			cout << "You just sold a Stimpack for 25 caps" << endl;

		}
		else
		{
			cout << "you dont have any Stimpacks." << endl;
		}
		}
		else if (func4 == "Radaway" || func4 == "radaway")
		{
		if (radaway >= 1)
		{
			money = money + 15;
			radaway = radaway - 1;
			cout << "You just sold a Radaway for 15 caps" << endl;
		}
		else
		{
			cout << "you dont have any radaways." << endl;
		}
		}
		else
		{
			cout << "Item: " << func4 << " doesnt exist." << endl;
		}
	}
	if (func3 == "Exit" || func3 == "exit")
	{
		system("cls");
		Megaton();
	}
	store();
}

void Megaton()
{
	status();
	cout << "-------------------HELP--------------------" << endl;
	cout << "Possible functions are: Shop, Quest, Leave." << endl;
	cout << "-------------------HELP--------------------\n" << endl;
	cout << "Waiting for input: ";
	cin >> func3;
	if (func3 == "Shop" || func3 == "shop")
	{
		store();
	}
	if (func3 == "Leave" || func3 == "leave")
	{
		area = "Wasteland";
		system("cls");
		Wasteland();
	}
	if (func3 == "Quest" || func3 == "quest")
	{
		if (rase == "Human" || rase == "human")
		{
			if (questN == 0)
			{
				cout << "After askinga around Megaton City, you have found out that your father has went to Rivet City." << endl;
				system("pause");
				cout << "Quest has been updated." << endl;
				xp = xp + 100;
				levelup();
				questN = 1;
				story();
				area = "Wasteland";
				system("cls");
				Wasteland();
			}
		}
		if (rase == "Ghoul" || rase == "ghoul")
		{
			if (questN == 0)
			{
				cout << "The mayor of Megaton explained that the bomb is still active." << endl;
				cout << "You have offered to defuse the bomb for them." << endl;
				system("pause");
				cout << "Quest has been updated." << endl;
				xp = xp + 100;
				levelup();
				questN = 1;
				story();
				area = "Wasteland";
				system("cls");
				Wasteland();
			}
		}
		else
		{
			cout << "No quests are available in Megaton." << endl;
			system("pause");
			Megaton();
		}
	}
	else
	{
	cout << "Cant recognise the input try again." << endl;
	Megaton();
	}
}

void Vault101()
{
	system("cls");
	status();
	help();
	cout << "Possible travel locations: Megaton, Wasteland. " << endl;
	cout << "Waiting for input: " << endl;
	Function();
}

void Wasteland()
{
		system("cls");
		status();
		help();
		cout << "Possible travel locations: Vault101, Vault87, Raven Rock, Megaton, Project Purity, Rivet City." << endl;
		if (rase == "Mutant" || rase == "mutant")
		{
			cout << "You have killed: " << killcount << "/50" << endl;
			if (killcount == 50)
			{
				Victory();
			}
		}
		cout << "Waiting for input: ";
		if (rase == "Ghoul" || rase == "ghoul")
		{
			if (questN == 2)
			{
				fight();
				fight();
				fight();

				Victory();
			}
		}
		Function();
}

void RivetCity()
{
	status();
	cout << "-------------------HELP--------------------" << endl;
	cout << "Possible functions are: Shop, Quest, Leave." << endl;
	cout << "-------------------HELP--------------------\n" << endl;
	cout << "Waiting for input: ";
	cin >> func3;
	if (func3 == "Shop" || func3 == "shop")
	{
		store();
	}
	else if (func3 == "Leave" || func3 == "leave")
	{
		area = "Wasteland";
		system("cls");
		Wasteland();
	}
	else if (func3 == "Quest" || func3 == "quest")
	{
		if (rase == "Human" || rase == "human")
		{
			if (questN == 1)
			{
				cout << "After askinga around Rivet City you have meet Doctor Li" << endl;
				cout << "Doctor Li has explained your fathers plan to purify the water in the wastes." << endl;
				cout << "All of a suden you hear a radio call from you pip-boy 3000..." << endl;
				system("pause");
				cout << "Quest has been updated." << endl;
				xp = xp + 100;
				levelup();
				questN = 2;
				story();
				area = "Wasteland";
				system("cls");
				Wasteland();
			}
			else
			{
				cout << "No quests are available in RivetCity." << endl;
				system("pause");
				RivetCity();
			}
		}
	}
	else
	{
		cout << "Cant recognise the input try again." << endl;
		RivetCity();
	}
}

void Vault87()
{
	system("cls");
	status();
	help();
	cout << "Possible travel locations: RavenRock, Vault101," << endl;
	cout << "Waiting for input: ";
	Function();
}

void RavenRock()
{
	status();
	cout << "-------------------HELP-------------" << endl;
	cout << "Possible functions are: Quest, Leave." << endl;
	cout << "-------------------HELP-------------\n" << endl;
	cout << "Waiting for input: ";
	cin >> func3;
	if (func3 == "Leave" || func3 == "leave")
	{
		area = "Wasteland";
		system("cls");
		Wasteland();
	}
	else if (func3 == "Quest" || func3 == "quest")
	{
		if (rase == "Human" || rase == "human")
		{
			if (questN == 2)
			{
				cout << "President John Henry Eden has asked you to Poison the Purifiers water filtration system." << endl;
				system("pause");
				cout << "Quest has been updated." << endl;
				xp = xp + 100;
				levelup();
				questN = 3;
				story();
				area = "Wasteland";
				system("cls");
				Wasteland();
			}
		}
		if (rase == "Ghoul" || rase == "ghoul")
		{
			if (questN == 1)
			{
				cout << "In exchange for defusal kit the residents of Raven Rock ask you to defend them." << endl;
				system("pause");
				cout << "Quest has been updated." << endl;
				xp = xp + 100;
				levelup();
				questN = 2;
				story();
				area = "Wasteland";
				system("cls");
				Wasteland();
			}
			else
			{
				cout << "No quests are available in Raven Rock." << endl;
				system("pause");
				RavenRock();
			}
		}
	}
	else
	{
		cout << "Cant recognise the input try again." << endl;
		RavenRock();
	}
}

void ProjectPurity()
{
		status();
		cout << "-------------------HELP-------------" << endl;
		cout << "Possible functions are: Quest, Leave." << endl;
		cout << "-------------------HELP-------------\n" << endl;
		cout << "Waiting for input: ";
		cin >> func3;
		if (func3 == "Leave" || func3 == "leave")
		{
			area = "Wasteland";
			system("cls");
			Wasteland();
		}
		else if (func3 == "Quest" || func3 == "quest")
		{
			if (rase == "Human" || rase == "human")
			{
				if (questN == 3)
				{
					cout << "You have a choice to Purify the water or Poison it." << endl;
					Choice();
					cout << "Quest has been updated." << endl;
					xp = xp + 100;
					levelup();
					questN = 4;
					story();
					area = "Wasteland";
					system("cls");
					Wasteland();
				}
				else
				{
					cout << "No quests are available in Project Purity." << endl;
					system("pause");
					ProjectPurity();
				}
			}
		}
		else
		{
			cout << "Cant recognise the input try again." << endl;
			ProjectPurity();
		}
}

void Choice()
{
	if (rase == "Human" || rase == "human")
	{
		cout << "what is your choice?" << endl;
		cin >> choice;
		if (choice == "Purify" || choice == "purify")
		{
			cout << "You chose to purify the water." << endl;
			Victory();

		}
		else if (choice == "Poison" || choice == "posion")
		{
			cout << "You chose to poion the water." << endl;
			Victory();
		}
		else
		{
			cout << "This is not an option." << endl;
			Choice();
		}
	}
}

void load()
{
	ifstream inFile;
	inFile.open("SAVE.txt");
	//check for error
	if (inFile.fail())
	{
		cerr << "Error while opening file" << endl;
		system("pause");
		exit(1);
	}
//FUNKCIJOS KURIAS ISSAUGO

		//intai
		inFile >> weapon ;
		inFile >> health ;
		inFile >> MAXhealth ;
		inFile >> radDmg ;
		inFile >> MAXrad ;
		inFile >> rad ;
		inFile >> money ;
		inFile >> stimpack ;
		inFile >> radaway ;
		inFile >> que ;
		inFile >> input ;
		inFile >> randnum ;
		inFile >> priesas ;
		inFile >> priesodmg ;
		inFile >> Exp ;
		inFile >> xp ;
		inFile >> xpnext ;
		inFile >> level ;
		inFile >> ArmorAmount ;
		inFile >> score ;
		inFile >> Escore ;
		inFile >> radresBonus ;
		inFile >> name ;
		inFile >> killcount ;
		inFile >> questN ;
		inFile >> questkills ;

		//itemai
		inFile >> CombatArmor ;
		inFile >> PowerArmor ;
		inFile >> RaiderArmor ;
		inFile >> MetalArmor ;
		inFile >> ArmoredVaultSuit ;
		inFile >> Pistol ;
		inFile >> AssaultRifle ;
		inFile >> Shotgun ;
		inFile >> Minigun ;
		inFile >> FatMan ;
		inFile >> Axe ;
		inFile >> BaseballBat ;
		inFile >> SuperSledge ;

		//stringai
		inFile >> questO ;
		inFile >> Quest ;
		inFile >> enemyName ;
		inFile >> func ;
		inFile >> func2 ;
		inFile >> func3 ;
		inFile >> func4 ;
		inFile >> area ;
		inFile >> rase ;
		inFile >> EquipedArmor ;
		inFile >> weaponE ;
		inFile >> choice ;
//FUNKCIJOS KURIAS ISSAUGO
		inFile.close();

		inFile >> weapon >> health >> MAXhealth >> radDmg >> MAXrad >> rad >> money >> stimpack >> radaway >> que >> input >> randnum >> priesas >> priesodmg >> Exp >> xp >> xpnext >> level >> ArmorAmount >> score >> Escore >> radresBonus >> name >> killcount >> questN >> questkills >> CombatArmor >> PowerArmor >> RaiderArmor >> MetalArmor >> ArmoredVaultSuit >> Pistol >> AssaultRifle >> Shotgun >> Minigun >> FatMan >> Axe >> BaseballBat >> SuperSledge >> questO >> Quest >> enemyName >> func >> func2 >> func3 >> func4 >> area >> rase >> EquipedArmor >> weaponE >> choice;

	inFile.close();

	help();
	status();
	Function();
}

void map()
{
	int rows = 20;
	int columns = 20;
	int mapCounter = 0;
	int map[20][20] =
	{
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	};
	map[rows][columns];

	for (int x = 0; x < 20; x++)
	{
		for (int y = 0; y < 20; y++)
		{
			if (mapCounter >= 20)
			{
				cout << "" << endl;
				mapCounter = 0;
			}
			if (map[x][y] == 1)
			{
				cout << "A ";
			}
			else if (map[x][y] == 0)
			{
				cout << "  ";
			}
			mapCounter++;
		}
		mapCounter++;
	}
	system("pause");
}

void story()
{
	if (rase == "Human" || rase == "human")
	{
		if (questN == 1)
		{
			Quest = "Scientific Pursuits.";
			questO = "Go find your dad in Rivet City.";
		}
		else if (questN == 2)
		{
			Quest = "The American Dream.";
			questO = "The president of America has summoned you to the Raven Rock.";
		}
		else if (questN == 3)
		{
			Quest = "Waters of life / Waters of Death";
			questO = "Find your dad in the Project Purity facility.";
		}
	}
	else if (rase == "Ghoul" || rase == "ghoul")
	{
		if (questN == 1)
		{
			Quest = "The Power of ATOM.";
			questO = "Find defuse kit in Raven Rock.";
		}
		else if (questN == 2)
		{
			Quest = "Wasteland Survival Guide.";
			questO = "Kill 3 Creatures in the wasteland.";
		}
	}
	else if (rase == "Mutant" || rase == "mutant")
	{
		if (questN == 1)
		{
			Quest = "You gotta shoot'em in the head.";
			questO = "Kill 50 creatures.";
		}
	}
}

void Highscore() 
{
	ofstream outFile;
	outFile.open("HsList.html");

		outFile << "<!DOCTYPE html>";
		outFile << "<html>";
		outFile << "<head>";
		outFile << "<style>";
		outFile << "";
		outFile << "	html{";
		outFile << "  background: url('https://i.ibb.co/swFjk5z/Fallout-76-hed-796x419.jpg') no - repeat center center fixed;";
		outFile << "  -webkit - background - size: cover;";
		outFile << "	  -moz - background - size: cover;";
		outFile << "  -o - background - size: cover;";
		outFile << "  background - size: cover;";
		outFile << "}";
		outFile << "	table{";
		outFile << "		font - family: arial, sans - serif;";
		outFile << "		border - collapse: collapse;";
		outFile << "		width: 100 % ;";
		outFile << "	}";
		outFile << "";
		outFile << "	td, th{";
		outFile << "		border: 1px solid #dddddd;";
		outFile << "		text - align: left;";
		outFile << "		padding: 8px;";
		outFile << "	  font - size: 30px;";
		outFile << "	  font - weight: Times;";
		outFile << "";
		outFile << "}";
		outFile << "";
		outFile << "	tr:nth - child(even) {";
		outFile << "	background - color: #dddddd;";
		outFile << "	opacity : 1;";
		outFile << "	}";
		outFile << "";
		outFile << "tr:nth - child(odd) {";
		outFile << "	background - color: #dddddd;";
		outFile << "	opacity : 1;";
		outFile << "}";
		outFile << "";
		outFile << "< / style>";
		outFile << "  < / head>";
		outFile << "  <body>";
		outFile << "";
		outFile << "  <h1 align = ""center"" style = ""#dddddd:white"">FALLOUT LEADERBOARD< / h2>";
		outFile << "";
		outFile << "  <table style = ""width:600px"" align = ""center"">";
		outFile << "  <tr>";
		outFile << "  <th>Player< / th>";
		outFile << "   <th>Experience< / th>";
		outFile << "   <th>Creatures killed< / th>";
		outFile << "   <th>Achievments< / th>";
		outFile << "   <th>Score< / th>";
		outFile << "   < / tr>";
		outFile << "   <tr>";
		outFile << "   <td> "<< name <<" < / td>";
		outFile << "  < td> "<< xp <<" < / td >";
		outFile << "  < td> "<< killcount <<" < / td >";
		outFile << "  < td> "<< score <<" < / td >";
		outFile << "   < td> "<< score <<" < / td >";
		outFile << "   < / tr>";
		outFile << "   <tr>";
		outFile << "   < / tr>";
		outFile << "";
		outFile << "   < / table>";


	outFile.close();
	cout << "GAME SAVED." << endl;
}

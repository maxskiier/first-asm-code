#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//functions to satisfy compiler
void clear_screen(void);
void wait_for_enter(void);
void dev_console(void);
void main_menu(void);
int main(void);

//Polygon Project version 1.0
//By Maxwell Doose

void main_menu(void) {
	main();
}


int main(void) { //initialization
	system("clear");
	char polyin[30];
	char devin[30];
	init:
		printf("\033[38;5;46m_______       _______                                             \n");
		printf("|      |     |       |      |         \\       /          |          |\n");
		printf("|      |     |       |      |          \\     /           |          |\n");
		printf("|      |     |       |      |           \\   /            |          |\n");
		printf("|______|     |       |      |            \\ /         \\                  /\n");
		printf("|            |       |      |             |           \\                /\n");
		printf("|            |       |      |             |            \\______________/\n");
		printf("|            |       |      |             |\n");
		printf("|            |_______|      |______       |\033[0m \n");
		fflush(stdout);
		printf("\nWelcome to the \033[38;5;213mpolygon \033[38;5;32mshowcase \033[38;5;84mprogram!\033[0;21m \nPlease make sure that the terminal takes up the entire screen.\n");
		printf("Also, please note that this project is in \033[1;91mversion 1.0.\033[0m\nType '\033[4;1mtour\033[0m' to check out the polygons!\nOr, type '\033[4;1mexit\033[0m' to leave.\nType '\033[4;1mhelp\033[0m' for help.\n\033[48;5;15;38;5;16mInput>\033[0m");
		scanf("%s", polyin);

	if (strcmp(polyin, "tour")==0) {

		system("clear");
		printf("This is a \033[4;1mright triangle\033[0m. It has 3 sides and looks like this:\n");
		printf("\033[92m____________________________________________\n");
		printf("|                                           /\n");
		printf("|                                          /\n");
		printf("|                                         /\n");
		printf("|                                        /\n");
		printf("|                                       /\n");
		printf("|                                      /\n");
		printf("|                                     /\n");
		printf("|                                    /\n");
		printf("|                                   /\n");
		printf("|                                  /\n");
		printf("|                                 /\n");
		printf("|                                /\n");
		printf("|                               /\n");
		printf("|                              /\n");
		printf("|                             /\n");
		printf("|                            /\n");
		printf("|                           /\n");
		printf("|                          /\n");
		printf("|                         /\n");
		printf("|                        /\n");
		printf("|                       /\n");
		printf("|                      /\n");
		printf("|                     /\n");
		printf("|                    /\n");
		printf("|                   /\n");
		printf("|                  /\n");
		printf("|                 /\n");
		printf("|                /\n");
		printf("|               /\n");
		printf("|              /\n");
		printf("|             /\n");
		printf("|            /\n");
		printf("|           /\n");
		printf("|          /\n");
		printf("|         /\n");
		printf("|        /\n");
		printf("|       /\n");
		printf("|      /\n");
		printf("|     /\n");
		printf("|    /\n");
		printf("|   /\n");
		printf("|  /\n");
		printf("| /\n");
		printf("|/\033[0m \n");

		wait_for_enter();
		clear_screen();

		printf("This is a \033[4;1mrectangle\033[0m. It has 4 sides and is a type of quadrilateral.\n");
		printf("\n\033[92m__________________________________\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|________________________________|\033[0m \n");

		wait_for_enter();
		clear_screen();

		printf("This is \033[4;1ma square\033[0m. It has 4 sides and is a \033[4;1mspecial type of rectangle\033[0m. It is a quadrilateral and \033[4;1mall sides must be equal\033[0m.\n");
		printf("\033[92m__________________________________\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|                                |\n");
		printf("|________________________________|\033[0m \n");

		wait_for_enter();
		clear_screen();

		printf("This is \033[4;1ma pentagon\033[0m. It has 5 sides and 5 angles.\n\n");
		printf("\033[92m                  /\\ \n");
		printf("                 /  \\ \n");
		printf("                /    \\ \n");
		printf("               /      \\ \n");
		printf("              /        \\ \n");
		printf("             /          \\ \n");
		printf("            /            \\ \n");
		printf("            \\           / \n");
		printf("             \\         / \n");
		printf("              \\_______/\033[0m \n");

		wait_for_enter();
		clear_screen();

		printf("This is \033[4;1ma hexagon\033[0m . It has 6 sides and 6 angles. \n");
		printf("\033[92m                   ___________________\n");
		printf("                   /                   \\ \n");
		printf("                  /                     \\ \n");
		printf("                 /                       \\ \n");
		printf("                /                         \\ \n");
		printf("               /                           \\ \n");
		printf("               \\                          / \n");
		printf("                \\                        / \n");
		printf("                 \\                      / \n");
		printf("                  \\                    / \n");
		printf("                   \\__________________/ \033[0m");

		wait_for_enter();
		clear_screen();

		fflush(stdout);
		printf("A photo is about to be pulled up automatically, so please swipe back to the program after you are done looking at it.");
		wait_for_enter();
		clear_screen();
		system("open ~/proj/Images/oct.png");
		printf("Respectivlly, these are \033[4;1mHeptagons, Octagons, Nonagons, and Decagons\033[0m.\nA heptagon has 7 sides and 7 angles, an octagon has 8 sides and 8 angles,\n A nonagon has 9 sides and 9 angles, and a Decagon has 10 sides and 10 angles.\n");
		printf("You may minimize this window to look at the photo that has been pulled up automatically, but please maximize it again when you are finished.");
		wait_for_enter();
		clear_screen();
		fflush(stdout);
		printf("A photo is about to be pulled up automatically, so please swipe back to the program after you are done looking at it.");
		wait_for_enter();
		clear_screen();
		system("open ~/proj/Images/kite.jpg");
		printf("This is \033[4;1ma kite.\033[0m It has 4 sides and 4 angles, and is a special type of rectangle/square.");
		wait_for_enter();
		clear_screen();
		fflush(stdout);
		printf("A photo is about to be pulled up automatically, so please swipe back to the program after you are done looking at it.");
		wait_for_enter();
		clear_screen();
		system("open ~/proj/Images/parallel.jpg");
		printf("This is a \033[4;1mparallelogram\033[0m. It has 4 sides and 4 angles. All of its sides are parallel to the one on the other side.");
		wait_for_enter();
		clear_screen();
		fflush(stdout);
		printf("A photo is about to be pulled up automatically, so please swipe back to the program after you are done looking at it.");
		wait_for_enter();
		clear_screen();
		printf("This is \033[1;4ma trapezoid.\033[0m It has 4 sides and 4 angles, and looks kind of like a mountain.");
		system("open ~/proj/Images/trap.jpg");
		wait_for_enter();
		clear_screen();

		printf("That is all the shapes I have to show to you today! Press return to go back to the main menu. . .");
		fflush(stdout);
		getchar();
		getchar();
		clear_screen();
		main_menu();


	} else if (strcmp(polyin, "exit-bash")==0) {
		printf("\033[1;91mEntering bash shell. . .\033[0m");
		fflush(stdout);
		system("clear");
		system("/bin/bash");
		system("clear");
		printf("\033[1;91mExiting bash. . .\033[0m");
		fflush(stdout);
		system("clear");
		goto init;
	} else if (strcmp(polyin, "dev")==0) {
			dev_console();

	} else if (strcmp(polyin, "exit")==0) {
		return 0;

	} else if (strcmp(polyin, "clear")==0) {
		system("clear");
		goto init;

	} else if (strcmp(polyin, "help")==0) {
		printf("\033[92;4;1mPOLY HELP COMMAND\n\033[0m");
		printf("=================\n");
		printf("help--Displays help\n");
		printf("exit--exits the program\n");
		printf("exit-bash--exits to bash\n");
		printf("tour--starts the tour\n");
		printf("=================\n");
		wait_for_enter();
		clear_screen();
		goto init;

	} else {
		printf("\033[1;91mInvalid input.\033[0m \n"); //error handling
		wait_for_enter();
		clear_screen();
		goto init;
	};
}


void clear_screen(void) {
    system("clear");
}

void wait_for_enter(void) {
    fflush(stdout);
	printf("\nPress return to continue. . .");
    getchar();
	getchar(); // Wait for the user to press enter
}

void dev_console(void) {
    char devin[10];
    clear_screen();
    printf("Polygon Project Developer Console version 1.0\nWritten by Maxwell Doose and assisted by ChatGPT :)\n");
    while (1) {
        printf("\nInput> ");
        scanf("%s", devin);
        if (strcmp(devin, "ver") == 0) {
            printf("Polygon Project Developer Console version 1.0\nWritten by Maxwell Doose and assisted by ChatGPT :)\n");
        } else if (strcmp(devin, "exit") == 0) {
            main_menu();
        }
    }
}

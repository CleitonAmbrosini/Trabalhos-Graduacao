/*
* The purpose of this work is to implement an application that
* shows two colored cubes rotating, one to the center of the screen 
* and another to orbit around this first cube. Each cube faces need 
* to have a different color, in total, there will be 6 different colors.
*
* Author: Cleiton A. Ambrosini
* E-mail: cleiton.ambro@gmail.com
*/

#include <GL/glut.h>

/* Global variables */ 
GLfloat angleCube = 0.0f;
GLfloat rotationCube = 0.0f; 
int timerRefresh = 15;        

/* For the draw cubes */
void drawCube(){
	glBegin(GL_QUADS);
	// Top 						
	glColor3f(1.00f, 0.10f, 1.00f); // pink
	glVertex3f(0.25f, 0.25f, -0.25f);
	glVertex3f(-0.25f, 0.25f, -0.25f);
	glVertex3f(-0.25f, 0.25f, 0.25f);
	glVertex3f(0.25f, 0.25f, 0.25f);

	// Bottom 
	glColor3f(0.60f, 1.00f, 1.00f);     // Ligth Blue
	glVertex3f(0.25f, -0.25f, 0.25f);
	glVertex3f(-0.25f, -0.25f, 0.25f);
	glVertex3f(-0.25f, -0.25f, -0.25f);
	glVertex3f(0.25f, -0.25f, -0.25f);

	// Front 
	glColor3f(1.00f, 0.10f, 0.10f);     // Red
	glVertex3f(0.25f, 0.25f, 0.25f);
	glVertex3f(-0.25f, 0.25f, 0.25f);
	glVertex3f(-0.25f, -0.25f, 0.25f);
	glVertex3f(0.25f, -0.25f, 0.25f);

	// Back 
	glColor3f(0.13f, 0.80f, 0.00f);     // Green
	glVertex3f(0.25f, -0.25f, -0.25f);
	glVertex3f(-0.25f, -0.25f, -0.25f);
	glVertex3f(-0.25f, 0.25f, -0.25f);
	glVertex3f(0.25f, 0.25f, -0.25f);

	// Left 
	glColor3f(0.00f, 0.00f, 0.60f);     // Blue
	glVertex3f(-0.25f, 0.25f, 0.25f);
	glVertex3f(-0.25f, 0.25f, -0.25f);
	glVertex3f(-0.25f, -0.25f, -0.25f);
	glVertex3f(-0.25f, -0.25f, 0.25f);

	// Right 
	glColor3f(1.00f, 1.00f, 0.20f);     // Yellow
	glVertex3f(0.25f, 0.25f, -0.25f);
	glVertex3f(0.25f, 0.25f, 0.25f);
	glVertex3f(0.25f, -0.25f, 0.25f);
	glVertex3f(0.25f, -0.25f, -0.25f);
	glEnd();
}

/* Draw in the screen */
void display() {
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	// Center cube
	glPushMatrix();
	glTranslatef(0.0f, 0.0f, -7.0f); // position on the screen
	glRotatef(12, 1, 1, 1); // just to tilt
	glRotatef(angleCube, 0, 1, 0); // rotation on your axis each instant on Y
	drawCube(); // draw the cube
	glPopMatrix();
	
	// Cube in orbit
	glRotatef(rotationCube, 0, 0, 1); // rotation in orbit in clockwise direction each instant
	glPushMatrix();
	glTranslatef(-2.0f, 0.0f, -7.0f); // position on screen
	glRotatef(12, 1, 1, 1); // just to tilt
	glRotatef(angleCube, 0, 0, 1); // rotation on your axis each instant on Z
	drawCube(); // draw the cube
	glPopMatrix();

	glutSwapBuffers();

	// Update the rotational angle after each refresh
	angleCube += 1.0f; 
	rotationCube -= 0.3f;
}

/* Re-paint display for the moviment effect */
void timer(int value) {
	glutPostRedisplay();  // Re-paint the display
	glutTimerFunc(timerRefresh, timer, 0); // timer for re-paint
}

/* This function remolding the screen always that window is reshaped*/
void reshape(GLsizei width, GLsizei height) {  
	if (height == 0) height = 1;                
	GLfloat aspect = (GLfloat)width / (GLfloat)height;
	glViewport(0, 0, width, height);
	glMatrixMode(GL_PROJECTION);  
	glLoadIdentity();            
	gluPerspective(45.0f, aspect, 0.1f, 100.0f);
}

/* Initialize OpenGL */
void init() {
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
	glClearDepth(1.0f);
	glEnable(GL_DEPTH_TEST);
	glDepthFunc(GL_LEQUAL);
	glShadeModel(GL_SMOOTH);
	glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
}

/* Main function */
int main(int argc, char** argv) {
	glutInit(&argc, argv);            
	glutInitDisplayMode(GLUT_DOUBLE);
	glutInitWindowSize(1000, 600);   
	glutInitWindowPosition(250, 250); 
	glutCreateWindow("Cubes");          
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);       
	init();
	glutTimerFunc(0, timer, 0);     
	glutMainLoop();                 
	return 0;
}
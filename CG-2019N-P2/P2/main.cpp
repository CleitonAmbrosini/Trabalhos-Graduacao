/*
* The purpose of this work is to implement an application that
* shows a red cube rotating , a red sphere and a source light
* in the position on the sphere. 
*
* Author: Cleiton A. Ambrosini
* E-mail: cleiton.ambro@gmail.com
*/

#include <GL/glut.h>
#include <math.h>

// for cube rotation
GLfloat angleCube = 0.0f;

// light variables
GLfloat ambientLight[] = { 1.0f, 1.0f, 1.0f, 1.00f };
GLfloat light_pos[] = { -2.0, 0.0, -7.0, 0.6 };
GLfloat red[] = { 1.0f, 0.0f, 0.0f, 1.0f };

// initialing ambient light
void init(void) {
	glEnable(GL_LIGHTING);
	glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, red);
}

/* Draw in the screen */
void display() {
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	angleCube += 0.1; // rotation velocity	
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	// cube
	glPushMatrix();
	glTranslatef(2.0f, 0.0f, -7.0f);
	glRotatef(12, 1, 1, 1);
	glRotatef(angleCube, 0, 1, 0);
	glutSolidCube(1);
	glPopMatrix();

	// source light
	glEnable(GL_LIGHT0);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	glLightfv(GL_LIGHT0, GL_POSITION, light_pos);

	// sphere
	glPushMatrix();
	glTranslatef(-2.0f, 0.0f, -7.0f);
	glutSolidSphere(0.6, 20, 10);	
	glPopMatrix();
	glDisable(GL_LIGHT0);
	
	glutSwapBuffers();
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


/* Main function */
int main(int argc, char** argv) {
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(1000, 500);
	glutInitWindowPosition(1000, 500);
	glutCreateWindow("Cubes");

	init();

	glutIdleFunc(display);
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);

	glutMainLoop();
	return 0;
}
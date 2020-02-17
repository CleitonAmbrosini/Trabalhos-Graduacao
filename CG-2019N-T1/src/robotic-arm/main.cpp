/**
 * The proposal of this work is the criation of a robotic arm
 * with delimited angle rotation, movimentation and 
 * a robotic hand with with arm.
 *
 * Author: Cleiton A. Ambrosini <cleiton.ambro@gmail.com>
 */
#include <GL/glut.h>
#include <GL/gl.h>
#include <iostream>

// Classes ----------------------------------------------------------------

//Arm
class Cube {
	public:
		float x, y, z, rx ;
		
		void update() {
			glTranslatef(this->rx, 0.0, 0.0);
		}
		void display() {
			glPushMatrix();
			glScalef(this->x, this->y, this->z);
			glutWireCube(1.0);
			glPopMatrix();
		}
};

//Hand
class ObTriangle {
	public:
		float x, y, rx, ry;
		
		void update() {
			glTranslatef(this->rx, 0.0, 0.0);
		}
		void display() {
			glPushMatrix();
			glBegin(GL_TRIANGLES);                                         
				glVertex3f(0.4f, 0.8f, 0.0f);                          
				glVertex3f(0.4f, 0.1f, 0.0f);                          
				glVertex3f(this->x, 0.5f, 0.0f);                          
			glEnd();
			glPopMatrix();
		}
};

//Arm joints
class Cylinder {
	public:
		float angle;

		void update() {
			if (this->angle > 90.0) //Delimit the angular movement
			{
				this->angle = 90;
				glRotatef(this->angle, 0.0, 0.0, 1.0);
			}
			else if (this->angle < -90.0) {
				this->angle = -90;
				glRotatef(this->angle, 0.0, 0.0, 1.0);
			}
			else {
				glRotatef(this->angle, 0.0, 0.0, 1.0);
			}			
		}
		void display() {
			GLUquadricObj *quadratic;
			quadratic = gluNewQuadric();
			gluCylinder(quadratic, 0.3f, 0.2f, 0.05f, 32, 32);
		}
};

// Global variables ----------------------------------------------------------------

// Constants to define the screen size
const int WIDTH = 800;
const int HEIGHT = 800;

// Criation of the objects
Cube cubeB, cubeR, cubeG, rectangle;
ObTriangle triangleL, triangleR;
Cylinder cy1, cy2, cy3;

// Functions ----------------------------------------------------------------

// Function to delimit the area where the triangles can move
int stop(ObTriangle l, ObTriangle r) {
	if ((l.rx > 0.050) && (r.rx < -0.12)) {
		return 0;
	}
	else if ((l.rx < -0.07) && (r.rx > 0.11)) {
		return 1;
	}
}

// Function to draw on the screen (ecrã)
void display()
{
	glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glPushMatrix();
	
	/* 1º Cube "Black cube" */
	glColor3f(0.0f, 0.0f, 0.0f);
	cubeB.update();
	cubeB.display();
	
	/* 1º Cylinder "Black Cylinder" */
	glTranslatef(0.0, 0.5, 0.0);
	cy1.update();
	cy1.display();

	/* 2º Cube "Red cube"*/
	glColor3f(1.0f, 0.0f, 0.0f);
	glTranslatef(0.0, 0.5, 0.0);
	cubeR.display();

	/* 2º Cylinder "Red Cylinder"*/
	glTranslatef(0.0, 0.5, 0.0);
	cy2.update();
	cy2.display();

	/* 3º Cube "Green Cube"*/
	glColor3f(0.0f, 1.0f, 0.0f);
	glTranslatef(0.0, 0.6, 0.0);
	cubeG.display();

	/* 3º Cylinder "Green Cylinder"*/
	glTranslatef(0.0, 0.5, 0.0);
	cy3.update();
	cy3.display();

	/* Blue rectangle*/
	glColor3f(0.0f, 0.0f, 1.0f);
	glTranslatef(0.0, 0.9, 0.0);
	rectangle.display();

	/* 1º Triangle (LEFT) "Black triangle"*/
	glColor3f(0.0f, 0.0f, 0.0f);
	glTranslatef(-0.5, 0.4, 0.0);
	triangleL.update();
	if (stop(triangleL, triangleR) == 0) { //Check the limit of triangles drive
		triangleL.rx = 0.06;
		triangleR.rx = -0.12;
	}
	if (stop(triangleL, triangleR) == 1) { //Check the limit of triangles drive
		triangleL.rx = -0.07;
		triangleR.rx = 0.11;
	}
	triangleL.display();

	/* 2º Triangle (RIGHT) "Red triangle" */
	glColor3f(1.0f, 0.0f, 0.0f);
	glTranslatef(0.2, 0.0, 0.0);
	triangleR.update();
	if (stop(triangleL, triangleR) == 0) { //Check the limit of triangles drive
		triangleL.rx = 0.06;
		triangleR.rx = -0.12;
	}
	if (stop(triangleL, triangleR) == 1) { //Check the limit of triangles drive
		triangleL.rx = -0.07;
		triangleR.rx = 0.11;
	}
	triangleR.display();
	
	glPopMatrix();
	glutSwapBuffers();
}
 
// Function to mapping keyboard keys according to their functions
// the mapping with your functions are in the README arquive
void keyboard(unsigned char key, int x, int y)
{
	switch (key) {
	case 'z':
		cubeB.rx = cubeB.rx - 0.2;
		glutPostRedisplay();
		break;
	case 'x':
		cubeB.rx = cubeB.rx + 0.2;
		glutPostRedisplay();
		break;
	case 'q':
		cy1.angle = cy1.angle - 3.5;
		glutPostRedisplay();
		break;
	case 'a':
		cy1.angle = cy1.angle + 3.5;
		glutPostRedisplay();
		break;
	case 'w':
		cy2.angle = cy2.angle - 3.5;
		glutPostRedisplay();
		break;
	case 's':
		cy2.angle = cy2.angle + 3.5;
		glutPostRedisplay();
		break;
	case 'e':
		cy3.angle = cy3.angle - 3.5;
		glutPostRedisplay();
		break;
	case 'd':
		cy3.angle = cy3.angle + 3.5;
		glutPostRedisplay();
		break;
	case 'r':
		triangleL.rx = triangleL.rx + 0.02;
		triangleR.rx = triangleR.rx - 0.03;
		glutPostRedisplay();
		break;
	case 'f':
		triangleL.rx = triangleL.rx - 0.02;
		triangleR.rx = triangleR.rx + 0.03;
		glutPostRedisplay();
		break;
	default:
		break;
	}
}

// Function to set initial values for objects
void initObjects() {
	// Black cube
	cubeB.x = 0.5;
	cubeB.y = 0.4;
	cubeB.z = 1.0;

	//Green cube
	cubeG.x = 0.5;
	cubeG.y = 0.4;
	cubeG.z = 1.0;

	//Red cube
	cubeR.x = 0.5;	
	cubeR.y = 0.4;	
	cubeR.z = 1.0;

	//Rectangle
	rectangle.x = 0.5;
	rectangle.y = 1.0;
	rectangle.z = 1.0;

	//Left triangle x Right triangle
	triangleL.x = 0.1f;
	triangleR.x = 0.7f;
}

// first function to be called by the program
// function where the initial state of opengl is defined, even before any drawing is done
void initView()
{
	glViewport(0, 0, (GLsizei)WIDTH, (GLsizei)HEIGHT);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(65.0, (GLfloat)WIDTH / (GLfloat)HEIGHT, 1.0, 20.0);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	glTranslatef(0.0, 0.0, -10.0);
	initObjects();
}

// Main function. Where the API are initialized, the window is create 
// and the loop of the program is called
int main(int argc, char** argv)
{
	glutInit(&argc, argv);  
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB); 
	glutInitWindowSize(WIDTH, HEIGHT);
	glutCreateWindow("Robotic arm");
	glutDisplayFunc(display); 
	glutKeyboardFunc(keyboard); 

	initView(); 

	glutMainLoop(); 

	return 0;
}
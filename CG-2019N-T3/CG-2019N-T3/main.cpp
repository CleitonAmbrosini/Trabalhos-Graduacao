/*
* Implementation of a graphical application using OpenGL that shows a car moving on a plane.
*
* Author: Cleiton A. Ambrosini <cleiton.ambro@gmail.com>
*/
#include <GL/glut.h>
#include <gl/freeglut.h>

// => Variables =============================================
#define Vrt glVertex3s

int proj = 1, new_mouse = 0, mouse_rot = 1, mouse_trn = 0;

float turn = -100.0, tipp = 30.0, xtm = 0.0, ytm = 0.0, scl = 1.0, xcr = 0.0, x_click = 0, y_click = 0;

GLfloat lit1_spc[] = { 0.20, 0.20,  0.15, 1.00 },
lit1_dfs[] = { 0.50, 0.40,  0.45, 1.00 },
lit1_amb[] = { 0.05, 0.05,  0.05, 1.00 },
lit1_pos[] = { 0, 0,  1, 0 };

GLfloat lit2_spc[] = { 0.00,  0.00,  0.00, 1.00 },
lit2_dfs[] = { 0.30,  0.30,  0.35, 1.00 },
lit2_amb[] = { 0.20,  0.20,  0.25, 1.00 },
lit2_pos[] = { 1.50, -2.00, -4.00, 0.01 };

// => Keybord Input =============================================
void keybordSpecial(int key, int x, int y){
	if (key == GLUT_KEY_UP) {
		xcr -= 2.00;
	}
	if (key == GLUT_KEY_DOWN) {
		xcr += 2.00;
	}
	glutPostRedisplay();
}

// => Mouse Input =============================================
void Mouse(int button, int state, int x, int y){
	x_click = x;
	y_click = y;

	new_mouse = 1;
}

// => Motion
void Motion(int x, int y){
	float turn_del, tipp_del, x_del, y_del;

	static int c = 0, x_sav, y_sav;
	static float turn_save = 0.0, tipp_save = 0.0;


	if (new_mouse) {
		new_mouse = 0;
		x_sav = x_click;
		y_sav = y_click;
	}

	if (mouse_rot) {
		turn_del = x - x_sav;
		turn += turn_del;

		tipp_del = y - y_sav;
		tipp += tipp_del;
	}
	else if (mouse_trn) {
		x_del = float(x - x_sav) * 0.01;
		xtm += x_del;

		y_del = float(y - y_sav) * 0.01;
		ytm -= y_del;
	}

	x_sav = x;
	y_sav = y;

	glutPostRedisplay();
}

// => Lights   =============================================
void Init_Lights(void){
	glLightfv(GL_LIGHT1, GL_SPECULAR, lit1_spc);
	glLightfv(GL_LIGHT1, GL_DIFFUSE, lit1_dfs);
	glLightfv(GL_LIGHT1, GL_AMBIENT, lit1_amb);
	glLightfv(GL_LIGHT1, GL_POSITION, lit1_pos);

	glLightfv(GL_LIGHT2, GL_SPECULAR, lit2_spc);
	glLightfv(GL_LIGHT2, GL_DIFFUSE, lit2_dfs);
	glLightfv(GL_LIGHT2, GL_AMBIENT, lit2_amb);
	glLightfv(GL_LIGHT2, GL_POSITION, lit2_pos);

	glEnable(GL_LIGHT1);
	glEnable(GL_LIGHT2);

	glEnable(GL_AUTO_NORMAL);
	glEnable(GL_NORMALIZE);
}

// => Draw Road and Car   =============================================

// => Road
void Draw_Road(void){
	glColor3f(0.30, 0.25, 0.30);
	glEnable(GL_LIGHTING);

	glPushMatrix();
	glTranslatef(0.0, -25.0, 0.0);
	glScalef(100.0, 0.5, 10.0);
	glutSolidCube(-10.0f);
	glPopMatrix();
}

// => Wheel
void Render_Wheel(int xt, int yt, int zt)
{
	glPushMatrix();
	glTranslatef(xt, yt, zt);
	glutSolidTorus(2, 5, 12, 36);
	glPopMatrix();
}

// => Car Headlight
void Draw_esphere(){
	glPushMatrix();
	glTranslatef(-40.0, -5.0, -10.0);
	glutSolidSphere(3, 5, 5);
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-40.0, -5.0, 10.0);
	glutSolidSphere(3, 5, 5);
	glPopMatrix();

}

// => Car
void Draw_Car(void){

	Draw_esphere();

	glBegin(GL_QUADS);
	glColor3f(0.3, 0.6, 0.6);
	Vrt(-40, 0, 15); Vrt(40, 0, 15); Vrt(40, -15, 15); Vrt(-40, -15, 15);  // left
	Vrt(-40, 0, -15); Vrt(40, 0, -15); Vrt(40, -15, -15); Vrt(-40, -15, -15);  // right
	glColor3f(0.4, 0.6, 0.6);
	Vrt(40, 0, -15); Vrt(40, 0, 15); Vrt(40, -15, 15); Vrt(40, -15, -15);  // back
	Vrt(-40, 0, -15); Vrt(-40, 0, 15); Vrt(-40, -15, 15); Vrt(-40, -15, -15);  // front
	glColor3f(0.4, 0.6, 0.8);
	Vrt(-40, 0, 15); Vrt(-40, 0, -15); Vrt(40, 0, -15); Vrt(40, 0, 15);  // trunks
	Vrt(-10, 10, 15); Vrt(-10, 10, -15); Vrt(20, 10, -15); Vrt(20, 10, 15);  // roof
	glColor3f(0.7, 0.7, 0.5);
	Vrt(-20, 0, 15); Vrt(-10, 10, 15); Vrt(20, 10, 15); Vrt(25, 0, 15);  // window l
	Vrt(-20, 0, -15); Vrt(-10, 10, -15); Vrt(20, 10, -15); Vrt(25, 0, -15);  // window r
	glColor3f(0.7, 0.6, 0.5);
	Vrt(-10, 10, 15); Vrt(-20, 0, 15); Vrt(-20, 0, -15); Vrt(-10, 10, -15);  // windshield
	Vrt(20, 10, 15); Vrt(20, 10, -15); Vrt(25, 0, -15); Vrt(25, 0, 15);  // rear window
	glColor3f(0.4, 0.5, 0.5);
	Vrt(-40, -15, 15); Vrt(-40, -15, -15); Vrt(40, -15, -15); Vrt(40, -15, 15);  // bottom
	glEnd();

	glColor3f(0.3, 0.3, 0.3);
	Render_Wheel(-20, -15, 15);
	Render_Wheel(20, -15, 15);
	Render_Wheel(-20, -15, -15);
	Render_Wheel(20, -15, -15);
}

// => Display  =============================================
void Display(void){
	static float x = 2.0;

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();

	if (proj == 0) {
		glOrtho(-x, x, -x, x, 0.0, 10.0);
	}
	else {
		gluPerspective(60.0, 1.0, 1.0, 10.0);
	}

	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	glTranslatef(xtm, ytm, -4.0);      
	glRotatef(tipp, 1, 0, 0);      
	glRotatef(turn, 0, 1, 0);       
	glLightfv(GL_LIGHT1, GL_POSITION, lit1_pos);
	
	glScalef(scl, scl, scl);       
	glScalef(0.02, 0.02, 0.02);

	glLightfv(GL_LIGHT2, GL_POSITION, lit2_pos);
	Draw_Road();
	glTranslatef(xcr, 0.0, 0.0);
	Draw_Car();

	glutSwapBuffers();
}

// => Reshape =============================================
void reshape(int x, int y){
	if (y == 0 || x == 0) return;
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();

	gluPerspective(39.0, (GLdouble)x / (GLdouble)y, 0.6, 40.0);
	glMatrixMode(GL_MODELVIEW);
	glViewport(0, 0, x, y);  //Use the whole window for rendering
}

// => Init GLUT =============================================

// => Lights
void Init_GL(void){
	Init_Lights();

	glEnable(GL_DEPTH_TEST);
	glEnable(GL_LIGHTING);
	glEnable(GL_COLOR_MATERIAL);

	glColorMaterial(GL_AMBIENT_AND_DIFFUSE, GL_FRONT);
	glColorMaterial(GL_SPECULAR, GL_FRONT);

}

// => Window and GLUT
void Init_Glut(void){
	glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH);
	glutInitWindowPosition(800, 200);
	glutInitWindowSize(800, 800);
	glutCreateWindow("Car");

	glutReshapeFunc(reshape);

	glutSpecialFunc(keybordSpecial);
	glutDisplayFunc(Display);
	glutMouseFunc(Mouse);
	glutMotionFunc(Motion);
}

// => Main function =============================================
void main(int argc, char** argv){
	glutInit(&argc, argv);

	Init_Glut();
	Init_GL();

	glutMainLoop();
}
// -------------------------------------------------------------------------------------------------


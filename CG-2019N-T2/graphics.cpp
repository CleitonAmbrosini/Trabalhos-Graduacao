#include <iostream>
#include <cstdlib>
#include <cstdio> // for flushing stdout
#include <cmath>
#include <GL/glut.h>
#include <ctime>
#include <cstring> // for strlen
#include "graphics.h"
#include "board.h"

using namespace std;

GLboolean graphics::lightSwitch, graphics::mouseRotate, graphics::texBlend,
graphics::textures, graphics::editMode, graphics::deleteMode,
graphics::addMode, graphics::marble, graphics::twoPlayer;
GLuint graphics::fps, graphics::width, graphics::height, graphics::frameDelay,
graphics::plyLevel, graphics::base;
GLint graphics::mX, graphics::mY, graphics::yRot, graphics::xRot;
GLfloat graphics::lightPosition[4];

graphics::drawType graphics::drawMode;
graphics::menuOptions graphics::addUnit;
board * graphics::brd;

graphics* graphics::glClass;

graphics::graphics (int argc, char** argv)
{
  srand (time (NULL));
  glutInit (&argc, argv);
  glClass = this;
  init ();
}

void
graphics::init ()
{
  plyLevel = 3;
  yRot = xRot = 0;
  drawMode = SOLID;
  mouseRotate = editMode = deleteMode = addMode = marble = twoPlayer = GL_FALSE;
  lightSwitch = texBlend = textures = GL_TRUE;
  height = 600;
  width = 800;
  fps = 50; // should be dividable by 1000 (i.e. 1 second = 1000 ms) */
  /* glut timer only takes an int delay, so choose an fps that gives you
   * a whole number when 1000 is divided by it */
  frameDelay = 1000 / fps;
 

  glutInitWindowSize (width, height);
  glutInitWindowPosition (250, 250);
  glutInitDisplayMode (GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);
  glutCreateWindow ("Deep Blue Sea");

  glutDisplayFunc (display);
  glutReshapeFunc (reshape);
  glutSpecialFunc (keyboard2);
  glutMouseFunc (mouse);
  glutMotionFunc (motion);

  glClearColor (0.0, 0.0, 0.0, 1.0); // set to black
  glEnable (GL_DEPTH_TEST);
  glHint (GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST); // nice perspective calculations
  glHint (GL_POINT_SMOOTH_HINT, GL_NICEST); // nice point smoothing

  //create board and chess pieces here so they can load textures
  brd = new board (); //board::BLACK AI is set to BLACK by default

  glEnable (GL_LIGHTING);
  glShadeModel (GL_SMOOTH);

  graphics::lightPosition[0] = 44.0;
  graphics::lightPosition[1] = 20.0;
  graphics::lightPosition[2] = 22.0;
  graphics::lightPosition[3] = 1.0;
  GLfloat diffuse[] = {1.0, 1.0, 1.0, 1.0};
  GLfloat specular[] = {1.0, 1.0, 1.0, 1.0};
  GLfloat ambient[] = {1.0, 1.0, 1.0, 1.0};
  glLightfv (GL_LIGHT0, GL_DIFFUSE, diffuse);
  glLightfv (GL_LIGHT0, GL_SPECULAR, specular);
  glLightfv (GL_LIGHT0, GL_AMBIENT, ambient);

  glutMainLoop ();
}


/* Display callback function */
void
graphics::display ()
{
  glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  glMatrixMode (GL_MODELVIEW);

  //rotate system coordinates
  glPushMatrix ();
  rotateBoard ();

  /* drawing code goes here */
  glClass->brd->drawBoard (GL_RENDER);
  glCallList(glClass->brd->boardRender);

  glutSwapBuffers ();

  GLenum isError = glGetError ();
  if (isError != GL_NO_ERROR) /**< in case of gl error, display error */
    cerr << gluErrorString (isError) << endl;

  glPopMatrix ();
}

void
graphics::rotateBoard ()
{
  if (graphics::yRot != 0 || graphics::xRot != 0)
    {
      glTranslatef (22, 0, 22);
      glRotatef (graphics::xRot * 0.5, 1, 0, 0);
      glRotatef (graphics::yRot * 0.5, 0, 1, 0);
      glTranslatef (-22, 0, -22);
    }
}

/* Window reshape callback function -- called initially and on window reshape */
void
graphics::reshape (int w, int h)
{
  glClass->width = w + 5; // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  glClass->height = h + 5;
  glViewport (0, 0, (GLsizei) w, (GLsizei) h);

  glMatrixMode (GL_PROJECTION);
  glLoadIdentity ();
  gluPerspective (40.0, (GLfloat) w / (GLfloat) h, 1.0, 300.0);
  glMatrixMode (GL_MODELVIEW);
  glLoadIdentity ();
  gluLookAt(20.5, 50.0, 70.0, // eye position
			20.5, 0.0, 30.5, // reference viewing point (0,0,0 = centre)
			0.0, 1.0, 0.0); // up vector
  glRotatef(35.0f, 1.0f, 0.0f, 0.0f);
}

/* GLUT handles "special" keys through the glutSpecialFunc callback. */
void
graphics::keyboard2 (int key, int x, int y)
{
  switch (key)
    {
    case GLUT_KEY_LEFT: // rotate room left
      yRot += 2; //left rotate
      break;
    case GLUT_KEY_RIGHT: // rotate room right
      glClass->yRot -= 2; //left rotate
      break;
    case GLUT_KEY_UP: // rotate room left
      xRot += 2; //left rotate
      break;
    case GLUT_KEY_DOWN: // rotate room right
      glClass->xRot -= 2; //left rotate
      break;
    default:
      cout << "Key '" << key << "' pressed; Not supported." << endl;
      break;
    }
}

/* Mouse callback function */
void
graphics::mouse (int btn, int state, int x, int y)
{
  int yy = glutGet (GLUT_WINDOW_HEIGHT);
  y = yy - y;


      if (btn == GLUT_LEFT_BUTTON && state == GLUT_DOWN)
        {
          mX = x;
          mY = y;
          glClass->brd->selection (mX, mY);
        }
	  /*
  if (btn == GLUT_MIDDLE_BUTTON)
    {
      if (state == GLUT_DOWN)
        {
          mouseRotate = true;
          glutWarpPointer (glClass->width / 2, glClass->height / 2);
        }
      else if (state == GLUT_UP)
        {
          mouseRotate = false;
        }
    }
	*/
}

/* Callback function for mouse movement */
void
graphics::motion (int x, int y)
{
  static int oldX = x;
  static int oldY = y;

  if (mouseRotate)
    {
      if ((oldX - x) > 0)
        glClass->yRot += 2;
      else
        glClass->yRot -= 2;
      if ((oldY - y) > 0)
        glClass->xRot += 2;
      else
        glClass->xRot -= 2;
      oldX = x;
      oldY = y;
    }

}

graphics::~graphics ()
{
#ifdef _DEBUG_GENERIC
  cout << "Cleaning up after graphics" << endl;
#endif
}


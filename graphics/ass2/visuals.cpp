#include <stdio.h>     // - Just for some ASCII messages
#include "gl/glut.h"   // - An interface and windows
                       //   management library
#include "visuals.h"   // Header file for our OpenGL functions
#include "math.h"
#include <iostream>
#include "stdio.h"

float angle=1.0f;
int temp = 1;
bool a = false;
int xer = 0;
int yer = 0;
int scal = 1;

void DrawAxes()
{
  glColor3f(0.6, 0.6, 0.6);
  glBegin(GL_LINES);
    glVertex2f(0.0,0.0);
	glVertex2f(100.0,0.0);
	glVertex2f(0.0,0.0);
	glVertex2f(0.0,100.0);
  glEnd();
}

void Render()
{    
  
  glClear(GL_COLOR_BUFFER_BIT );  // Clean up the colour of the window
								  // and the depth buffer

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();

  DrawAxes();

  
	// NTNU LOGO

  angle=105.0;
  glTranslatef(xer, yer, 0.0);    // set poss
  glRotatef(temp, 0.0, 0.0, 1.0); // set angle
  glScalef(scal, scal, 1.0);      // set scale




	glPointSize(2000.0f);  // cap at 10?


	glBegin(GL_POINTS);
	//glScalef(100.0, 100.0, 10.0);
	glColor3f(0.0, 0.0, 1.0);
	glVertex2f(0.0,0.0);
	glEnd();

	 float x_CenterOfCircle=0.0f;
  float y_CenterOfCircle=0.0f;
  float radius=22.0f;
  glBegin(GL_TRIANGLE_FAN);
  glVertex2f(x_CenterOfCircle, y_CenterOfCircle);
  for(float CircleAngle = 0; CircleAngle<360; CircleAngle++)
     glVertex2f(x_CenterOfCircle + sinf(CircleAngle) * radius, y_CenterOfCircle + cosf(CircleAngle) * radius);
  glEnd();

	glTranslatef(30.0, 30.0, 0.0);
	makeC();

	glTranslatef(-60.0, 0.0, 0.0);
	glRotatef(90.0, 0.0, 0.0, 1.0);
	glBegin(GL_TRIANGLE_FAN);
	makeC();

	glTranslatef(-60.0, 0.0, 0.0);
	glRotatef(90.0, 0.0, 0.0, 1.0);
	makeC();

	glTranslatef(-60.0, 0.0, 0.0);
	glRotatef(90.0, 0.0, 0.0, 1.0);
	makeC();

	glTranslatef(-60.0, 0.0, 0.0);
	glRotatef(90.0, 0.0, 0.0, 1.0);
	glTranslatef(-30.0, -30.0, 0.0);
	glTranslatef(45.0, 0.0, 0.0);
	glRectf(-15.0, -30.0, 15.0, 30.0); 

	glTranslatef(-45.0, -45.0, 0.0);
	glRotatef(90.0, 0.0, 0.0, 1.0);
	glRectf(-15.0, -30.0, 15.0, 30.0);

	glTranslatef(45.0, 45.0, 0.0);
	glRotatef(90.0, 0.0, 0.0, 1.0);
	glRectf(-15.0, -30.0, 15.0, 30.0);

	glTranslatef(-45.0, -45.0, 0.0);
	glRotatef(90.0, 0.0, 0.0, 1.0);
	glRectf(-15.0, -30.0, 15.0, 30.0);


  glutSwapBuffers();             // All drawing commands applied to the 
                                 // hidden buffer, so now, bring forward
                                 // the hidden buffer and hide the visible one           

}
//
void makeC()
{
	glBegin(GL_TRIANGLE_FAN);
	glVertex2f(0.0,0.0);
	glVertex2f(0.0,30.0);
	glVertex2f(13.0,28.0);
	glVertex2f(23.0,23.0);
	glVertex2f(28.0,13.0);
	glVertex2f(30.0,0.0);
	glVertex2f(0.0,0.0);
	glVertex2f(0.0,0.0);
	glEnd();
}

//-----------------------------------------------------------


void Resize(int w, int h)
{ 
  // define the visible area of the window ( in pixels )
  if (h==0) h=1;
  glViewport(0,0,w,h); 

  // Setup viewing volume

  glMatrixMode(GL_PROJECTION); 
  glLoadIdentity();
 
  //         L	   R 	  B 	T	 N	   F
  glOrtho (-100.0, 100.0, -100.0, 100.0, 100.0,-100.0);
}

void Idle()
{
	angle= angle + 1.0f;
	if(temp<360)
	{
		temp++; // change angle
		printf("%d\n",temp); // print angle
	} else if(temp == 360)
	{
		a = true;
	}
	if (a) // after 360 degree turn
	{
		xer = -100; // set pos
		yer = 100;  // set pos
		scal = 2;   // set scale
		a = false;
	}
	
	glutPostRedisplay();
}

//-----------------------------------------------------------

void Setup()  // DON'T TOUCH IT 
{ 
	//Parameter handling
	//glShadeModel (GL_SMOOTH);
	glShadeModel (GL_FLAT);

 
	// polygon rendering mode
	glEnable(GL_COLOR_MATERIAL);
	glColorMaterial( GL_FRONT, GL_AMBIENT_AND_DIFFUSE );
  
	//Set up light source
	GLfloat light_position[] = { -50.0, 20.0, 150.0, 1.0 };
	GLfloat ambientLight[] = { 0.2, 0.2, 0.2, 1.0 };
	GLfloat diffuseLight[] = { 0.8, 0.8, 0.8, 1.0 };
	   
	glLightfv( GL_LIGHT0, GL_AMBIENT, ambientLight );
	glLightfv( GL_LIGHT0, GL_DIFFUSE, diffuseLight );
	glLightfv( GL_LIGHT0, GL_POSITION, light_position);

	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);

	glEnable(GL_POINT_SMOOTH);

	// Black background
	glClearColor(0.0f,0.0f,0.0f,1.0f);

}






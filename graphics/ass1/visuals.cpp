#include <stdio.h>     // - Just for some ASCII messages
#include "gl/glut.h"   // - An interface and windows 
                       //   management library
#include "visuals.h"   // Header file for our OpenGL functions

#include <stdlib.h>
#include <iostream>
#include <time.h>

void Render()
{    
  
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);  // Clean up the colour of the window
													   // and the depth buffer
  glMatrixMode(GL_MODELVIEW); 
  glLoadIdentity();
  /* initialize random seed: */
  srand ( time(NULL) );
  //double temp = ((double)(rand() % 10)) /10;
 //std::cout << temp << std::endl;
  glColor3f(((double)(rand() % 10)) /10, ((double)(rand() % 10)) /10, ((double)(rand() % 10)) /10);							   // Set drawing colour = orange
  glutSolidTeapot( 20.0 );							   // Draw a built-in primitive
  //glutWireTeapot(20.0);
  //glutSolidSphere(20.0,30,24);

  glutSwapBuffers();             // All drawing commands applied to the 
                                 // hidden buffer, so now, bring forward
                                 // the hidden buffer and hide the visible one
}



//-----------------------------------------------------------
int count = 0;
void Resize(int w, int h)
{ // w and h are window sizes returned by glut
  // define the visible area of the window ( in pixels )
  
  if (h==0) h=1;
  glViewport(0,0,w,h);
  std::cout << count << std::endl;
  glViewport(0,0,count*10,count*10);
  //glutReshapeFunc(Resize);
  count++;
  if(count*10 == 1000) count = 0;
  // Setup viewing volume
  glMatrixMode(GL_PROJECTION); 
  glLoadIdentity();
 
 
  //         L,      R,      B,     T,     N,      F
  glOrtho (-50.0f, 50.0f, -50.0f, 50.0f, 100.0f, -100.0f);


}


void Setup()  // DON'T TOUCH IT 
{ 
	//Parameter handling
	glShadeModel (GL_SMOOTH);
	glEnable(GL_DEPTH_TEST);

	// polygon rendering mode
	glEnable(GL_COLOR_MATERIAL);
	glColorMaterial( GL_FRONT, GL_AMBIENT_AND_DIFFUSE );
  
	//Set up light source
	GLfloat light_position[] = { 0.0, 30.0,-50.0,0.0 };

	glLightfv(GL_LIGHT0, GL_POSITION, light_position);
	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);

	// Black background
	glClearColor(0.0f,0.0f,0.0f,1.0f);

}


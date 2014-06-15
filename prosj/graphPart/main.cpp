#define volumeAddress "skull.raw"
#define volumeSizeX 256
#define volumeSizeY 256
#define volumeSizeZ 256

#include <stdio.h>
#include <iostream>
#include "marchingcubes.hpp"
#include "gl/glut.h"               

using namespace std;

vector<vertex> vertices;
void Render();
void keyboard(unsigned char, int, int);
void Idle();
void Resize(int, int);

/////////////// Main Program ///////////////////////////
int main(int argc, char* argv[])
{ 
	int largestSize = 512;

    //float spacingX = 1.0f;
    //float spacingY = 1.0f;
    //float spacingZ = 1.0f;

    uchar *** dataset  = parseRawFile(volumeAddress, volumeSizeX, volumeSizeY, volumeSizeZ);
    int start = glutGet(GLUT_ELAPSED_TIME);
    vertices = runMarchingCubes(dataset, volumeSizeX, volumeSizeY, volumeSizeZ, 1, 1, 1, 50.0);
    delete[] dataset; 
    int end = glutGet(GLUT_ELAPSED_TIME);
    cout << "Running time: " << end-start << "ms" << endl;
	
	
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_RGBA|GLUT_DOUBLE|GLUT_DEPTH);
 
  
   glutInitWindowSize(512,512);
   glutInitWindowPosition(100,100);
  
  glutCreateWindow("Common Project");

  glShadeModel(GL_SMOOTH);

  //Using Alpha Color System
	glEnable (GL_BLEND);
	glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);


	// Black background
	glClearColor(0.0f,0.0f,0.0f,1.0f);

  
  glutDisplayFunc(Render);
  glutReshapeFunc(Resize);
  glutKeyboardFunc(keyboard);
  glutIdleFunc(Idle);

  glutMainLoop();
  return 0;


}
void Render()
{    
  
	glClear(GL_COLOR_BUFFER_BIT);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

/////////////////////////////////////////////
//	TODO: Codes For Drawing Your Object    //
//                                         //
//  TIP: the points of your object are     //
//	stored on "vertices" with 3D           //
//	codinates of x, y and, z               //
//	-glBegin(GL_TRIANGLES) can be used     //
//	for drawing those points               //
//  -to draw you object you can use of     //
//	alpha chanel for coloring              //
/////////////////////////////////////////////


	glutSwapBuffers();            

}
void keyboard(unsigned char key, int x, int y) 
{
// TODO: write your code here for moving, rotating your object	
}
void Idle()
{
//TODO: write your code here for animating your object	
	glutPostRedisplay();

}
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

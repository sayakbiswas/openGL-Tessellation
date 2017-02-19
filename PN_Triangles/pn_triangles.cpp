#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <math.h>
#include <GL/glew.h>
#include <glfw3.h>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/quaternion.hpp>
#include <string>
#include <fstream>
#include <vector>
#include <common/objloader.hpp>

using namespace glm;
using namespace std;

const int window_width = 800, window_height = 600;
GLFWwindow *window;
glm::mat4 gProjectionMatrix;
glm::mat4 gViewMatrix;
GLuint programID;

typedef struct Vertex {
    float Position[4];
    float Color[4];
    float Normal[3];

    void SetPosition(float *coords) {
        Position[0] = coords[0];
        Position[1] = coords[1];
        Position[2] = coords[2];
        Position[3] = coords[3];
    }

    void SetColor(float *color) {
        Color[0] = color[0];
        Color[1] = color[1];
        Color[2] = color[4];
        Color[3] = color[3];
    }

    void SetNormal(float *normal) {
        Normal[0] = normal[0];
        Normal[1] = normal[1];
        Normal[2] = normal[2];
    }
} Vertex;

int initWindow(void);
void initOpenGL(void);
void createObjects(void);
static void keyCallback(GLFWwindow* , int, int, int, int);
static void mouseCallback(GLFWwindow*, int, int, int);
static GLuint loadStandardShaders(const char*, const char*);
static GLuint loadTessShaders(const char*, const char*, const char*, const char*);
void loadObject(char*, glm::vec4, Vertex* &, GLushort* &, int);

int main(void) {
    int errorCode = initWindow();
    if(errorCode != 0) {
        return errorCode;
    }

    initOpenGL();
}

void initOpenGL() {
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);
    glEnable(GL_CULL_FACE);

    gProjectionMatrix = glm::perspective(45.0f, 4.0f / 3.0f, 0.1f, 100.0f);

    gViewMatrix = glm::lookAt(glm::vec3(15.0f, 15.0f, 15.0f),
                              glm::vec3(0.0f, 10.0f, 0.0f),
                              glm::vec3(0.0f, 1.0f, 0.0f));

    /*programID = loadTessShaders("shaders/Tessellation.vert", "shaders/Tessellation.control", "shaders/Tessellation.eval",
                                "shaders/Tessellation.frag");*/
    programID = loadStandardShaders("shaders/Standard.vert", "shaders/Standard.frag");

    createObjects();
}

void createObjects() {

}

void loadObject(char* file, glm::vec4 color, Vertex* &out_vertices, GLushort* &out_indices, int objectID) {
    vector<glm::vec3> vertices;
    vector<glm::vec3> uvs;
    vector<glm::vec3> normal;

    bool res = loadOBJ(file, vertices, normal);

    vector<GLushort> indices;
    vector<glm::vec3> indexed_vertices;
    vector<glm::vec3> indexed_normals;
    vector<glm::vec2> indexed_uvs;


}

static GLuint loadStandardShaders(const char *vert_file_path, const char *frag_file_path) {
    GLuint vertexShaderID = glCreateShader(GL_VERTEX_SHADER);
    GLuint fragmentShaderID = glCreateShader(GL_FRAGMENT_SHADER);

    string vertexShaderCode;
    ifstream vertexShaderStream(vert_file_path, ios::in);
    if(vertexShaderStream.is_open()) {
        string line = "";
        while(std::getline(vertexShaderStream, line)) {
            vertexShaderCode += "\n" + line;
        }
        vertexShaderStream.close();
    } else {
        cout << "Couldn't open " << vert_file_path << endl;
        getchar();
        return 0;
    }

    string fragmentShaderCode;
    ifstream fragmentShaderStream(frag_file_path, ios::in);
    if(fragmentShaderStream.is_open()) {
        string line = "";
        while(std::getline(fragmentShaderStream, line)) {
            fragmentShaderCode += "\n" + line;
        }
        fragmentShaderStream.close();
    } else {
        cout << "Couldn't open " << frag_file_path << endl;
        getchar();
        return 0;
    }

    GLint result = GL_FALSE;
    int infoLogLength;

    cout << "Compiling shader " <<  vert_file_path << endl;
    char const *vertexSource = vertexShaderCode.c_str();
    glShaderSource(vertexShaderID, 1, &vertexSource, NULL);
    glCompileShader(vertexShaderID);

    glGetShaderiv(vertexShaderID, GL_COMPILE_STATUS, &result);
    glGetShaderiv(vertexShaderID, GL_INFO_LOG_LENGTH, &infoLogLength);
    if(infoLogLength > 0) {
        vector<char> vertexShaderErrorMessage(infoLogLength + 1);
        glGetShaderInfoLog(vertexShaderID, infoLogLength, NULL, &vertexShaderErrorMessage[0]);
        cout << vertexShaderErrorMessage[0] << endl;
    }

    cout << "Compiling shader " <<  frag_file_path << endl;
    char const *fragmentSource = fragmentShaderCode.c_str();
    glShaderSource(fragmentShaderID, 1, &fragmentSource, NULL);
    glCompileShader(fragmentShaderID);

    glGetShaderiv(fragmentShaderID, GL_COMPILE_STATUS, &result);
    glGetShaderiv(fragmentShaderID, GL_INFO_LOG_LENGTH, &infoLogLength);
    if(infoLogLength > 0) {
        vector<char> fragmentShaderErrorMessage(infoLogLength + 1);
        glGetShaderInfoLog(fragmentShaderID, infoLogLength, NULL, &fragmentShaderErrorMessage[0]);
        cout << fragmentShaderErrorMessage[0] << endl;
    }

    cout << "Linking shader" << endl;
    GLuint programID = glCreateProgram();
    glAttachShader(programID, vertexShaderID);
    glAttachShader(programID, fragmentShaderID);
    glLinkProgram(programID);

    glGetShaderiv(programID, GL_LINK_STATUS, &result);
    glGetShaderiv(programID, GL_INFO_LOG_LENGTH, &infoLogLength);
    if(infoLogLength > 0) {
        vector<char> programErrorMessage(infoLogLength + 1);
        glGetShaderInfoLog(programID, infoLogLength, NULL, &programErrorMessage[0]);
        cout << programErrorMessage[0] << endl;
    }

    glDetachShader(programID, vertexShaderID);
    glDetachShader(programID, fragmentShaderID);

    glDeleteShader(vertexShaderID);
    glDeleteShader(fragmentShaderID);

    return programID;
}

static GLuint loadTessShaders(const char *tess_vert_file_path, const char *tess_ctrl_file_path, const char *tess_eval_file_path,
                              const char *tess_frag_file_path) {

}

int initWindow() {
    if(!glfwInit()) {
        fprintf(stderr, "Failed to initialize GLFW!\n");
        return -1;
    }

    glfwWindowHint(GLFW_SAMPLES, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);

    window = glfwCreateWindow(window_width, window_height, "PN Triangles", NULL, NULL);
    if(window == NULL) {
        fprintf(stderr, "Failed to open GLFW window.\n");
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);

    glewExperimental = true;
    if(glewInit() != GLEW_OK) {
        fprintf(stderr, "Failed to initialize GLEW!\n");
        return -1;
    }

    glfwSetCursorPos(window, window_width / 2, window_height / 2);
    glfwSetKeyCallback(window, keyCallback);
    glfwSetMouseButtonCallback(window, mouseCallback);

    return 0;
}

static void keyCallback(GLFWwindow *window, int key, int scancode, int action, int mods) {

}

static void mouseCallback(GLFWwindow *window, int button, int action, int mods) {

}

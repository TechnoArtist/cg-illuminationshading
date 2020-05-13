#version 300 es

precision highp float;

in vec3 vertex_position;
in vec3 vertex_normal;

uniform vec3 light_ambient;
uniform vec3 light_position;
uniform vec3 light_color;
uniform vec3 camera_position;
uniform float material_shininess; // n
uniform mat4 model_matrix;
uniform mat4 view_matrix;
uniform mat4 projection_matrix;

out vec3 ambient;
out vec3 diffuse;
out vec3 specular;

void main() {
    gl_Position = projection_matrix * view_matrix * model_matrix * vec4(vertex_position, 1.0);
    
    
    ambient = light_ambient; 

    vec3 light_vector = light_position - vertex_position; 
    vec3 light_intensity = vec3(1, 1, 1) / ((vertex_position - light_position) * (vertex_position - light_position)); 
    
    diffuse = light_intensity * dot(normalize(vertex_normal), normalize(light_vector)); 
    
    vec3 reflected = normalize(reflect(normalize(light_vector), normalize(vertex_normal))); 
    vec3 view_direction = normalize(vec3(camera_position - vertex_position)); 
    
    specular = light_intensity * pow(dot(reflected, view_direction), material_shininess); 
    
}

#version 300 es

precision mediump float;

in vec3 ambient;
in vec3 diffuse;
in vec3 specular;

uniform vec3 material_color;    // Ka and Kd
uniform vec3 material_specular; // Ks

out vec4 FragColor;

void main() {
    vec3 newambient = ambient * material_color; 
    
    vec3 newdiffuse = diffuse * material_color; 
    
    vec3 newspecular = specular * material_specular; 
    
    FragColor = vec4(newambient + newdiffuse + newspecular, 1.0); 
}

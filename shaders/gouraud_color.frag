#version 300 es

precision mediump float;

in vec3 ambient;
in vec3 diffuse;
in vec3 specular;

uniform vec3 material_color;    // Ka and Kd
uniform vec3 material_specular; // Ks

out vec4 FragColor;

void main() {
    //FragColor = vec4(material_color, 1.0);
    
    vec3 newambient = ambient * material_color; 
    
    vec3 newdiffuse = diffuse * material_color; 
    
    vec3 newspecular = specular * material_specular; 
    
    //TODO Check if this is an appropriate way to add vectors
    
    FragColor = vec4(newambient + newdiffuse + newspecular, 1.0); 
}

#version 300 es

precision mediump float;

in vec3 frag_pos;
in vec3 frag_normal;

uniform vec3 light_ambient;
uniform vec3 light_position;
uniform vec3 light_color;
uniform vec3 camera_position;
uniform vec3 material_color;      // Ka and Kd
uniform vec3 material_specular;   // Ks
uniform float material_shininess; // n

out vec4 FragColor;

void main() {
    
    
    vec3 ambient = light_ambient; 
    
    /*
    vec3 vertex_position_new = vec3(model_matrix * vec4(frag_position, 1.0)); 
    vec3 vertex_normal_new = normalize(inverse(transpose(mat3(model_matrix))) * frag_normal); 
    */
    vec3 light_vector = normalize(light_position - frag_pos); 
    
    vec3 diffuse = light_color * clamp(dot(frag_normal, light_vector), 0.0, 1.0); 
    
    
    vec3 reflected = normalize(reflect(normalize(light_vector), normalize(frag_normal))); 
    vec3 view_direction = normalize(vec3(camera_position - frag_pos)); 
    
    
    vec3 specular = light_color * clamp(pow(dot(reflected, view_direction), material_shininess), 0.0, 1.0); 
    
    
    
    vec3 newambient = ambient * material_color; 
    
    vec3 newdiffuse = diffuse * material_color; 
    
    vec3 newspecular = specular * material_specular; 
    
    FragColor = vec4(newambient + newdiffuse + newspecular, 1.0); 
}

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
    /*
    NOTE change the vert outs and frag ins to determine what gets interpolated
    
    TODO gouraud = interpolate colors (phong = normals) 
        final colors? Does that mean the frag shader will end up doing nothing? 
        
    NOTE dot product = angle; 1 = same, 0 = perpendicular, -1 = opposite. 
    */
    
    
    gl_Position = projection_matrix * view_matrix * model_matrix * vec4(vertex_position, 1.0);

    vec3 light_vector = light_position - gl_Position.xyz; 
    vec3 light_intensity = vec3(1.0, 1.0, 1.0) / abs((gl_Position.xyz - light_position) * (gl_Position.xyz - light_position)); 
    
    vec3 reflected = normalize(reflect(normalize(light_vector), normalize(vertex_normal))); 
    vec3 view_direction = normalize(vec3(camera_position - gl_Position.xyz)); 
    
    
    ambient = light_ambient; 
    /*
    diffuse = light_intensity * dot(normalize(vertex_normal), normalize(light_vector)); 
    
    specular = light_intensity * pow(dot(reflected, view_direction), material_shininess); */
    
    //ambient = vec3(0.15, 0.15, 0.15); 
    //ambient = vec3(0.0, 0.0, 0.0); 
    diffuse = vec3(0.0, 0.0, 0.0); 
    specular = vec3(0.0, 0.0, 0.0); 
    
}

// Can be access ATTRIBUTE and UNIFORM
// Can be send VARYING to fragment

// Transforms the coordinates into the clip space coordinates
// uniform mat4 projectionMatrix; // No needed for ShaderMaterial
// uniform mat4 modelViewMatrix;
// Relative to the camera (position, rotation, scale)
// uniform mat4 viewMatrix; // No needed for ShaderMaterial
// Relative to the Mesh (position, rotation, scale)
// uniform mat4 modelMatrix; // No needed for ShaderMaterial

// ATTRIBUTE
// attribute vec3 position; // No needed for ShaderMaterial
// attribute vec2 uv; // No needed for ShaderMaterial
// attribute float aRandom; // geometry attribute name

// UNIFORM
uniform vec2 uFrequency; 
uniform float uTime;

// VARYING
varying vec2 vUv;
varying float vElavation;
// varying float vRandom; // sends to fragment

void main()
{
  // gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);

  vec4 modelPosition = modelMatrix * vec4(position, 1.0);

  float elevation = sin(modelPosition.x * uFrequency.x + uTime) * 0.1;
  elevation += sin(modelPosition.y * uFrequency.y + uTime) * 0.1;

  modelPosition.z += elevation; // Wave
  // modelPosition.z += aRandom * 0.1;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;

  gl_Position = projectedPosition;

  vUv = uv;
  vElavation = elevation;
  // vRandom = aRandom;
}
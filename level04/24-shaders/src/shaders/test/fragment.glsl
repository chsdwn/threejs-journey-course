// You can change what you see in fragment
// Can be access UNIFORM and VARYING

// No needed for ShaderMaterial
// precision mediump float; // highp: performance issues, lowp: bugs

// UNIFORM
uniform vec3 uColor;
uniform sampler2D uTexture;

// VARYING
varying vec2 vUv;
varying float vElavation;
// varying float vRandom; // gets aRandom from vertex

void main()
{
  // gl_FragColor = vec4(0.8, vRandom, 1.0, 1.0); // color (r,g,b,a)

  vec4 textureColor = texture2D(uTexture, vUv);
  textureColor.rgb *= vElavation * 2.0 + 0.5; // Adds shadows
  gl_FragColor = textureColor;
  // gl_FragColor = vec4(uColor, 1.0); // color (r,g,b,a)
}
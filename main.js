import * as THREE from 'three'
import GUI from 'lil-gui'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import vertexShader from './Shaders/vertex.glsl'
import fragmentShader from './Shaders/fragment.glsl'
//===============================
//Debug
//===============================
const gui = new GUI();
//===============================
//Canvas
//===============================
const canvas = document.querySelector('canvas.webgl');
//===============================
//Scene
//===============================
const scene = new THREE.Scene();
//===============================
//Test Geo
//===============================
const geometry = new THREE.PlaneGeometry(10, 10, 32, 32);
const count = geometry.attributes.position.count;
const random = new Float32Array(count);
for (let i = 0; i < count; i++)
{
    random[i] = Math.random();
}

geometry.setAttribute('aRandom', new THREE.BufferAttribute(random, 1))
//===============================
//Materials
//===============================
const material = new THREE.RawShaderMaterial({
    vertexShader: vertexShader,
    fragmentShader: fragmentShader,
    uniforms:
        {
            uFrequency: { value: new THREE.Vector2(10, 5) },
            uResolution: { value: new THREE.Vector2(0.1, 0.1) }
        }
});

material.color = new THREE.Color(0xff0000);
const mesh = new THREE.Mesh(geometry, material);

scene.add(mesh);

const sizes = {
    width: window.innerWidth,
    height: window.innerHeight
}
//===============================
//Camera
//===============================
const camera = new THREE.PerspectiveCamera(75, sizes.width / sizes.height, 0.1, 100);
camera.position.set(0.25, -0.25, 1)
scene.add(camera);
//===============================
//Controls
//===============================
const controls = new OrbitControls(camera, canvas);
controls.enableDamping = true;
//===============================
//Renderer
//===============================
const renderer = new THREE.WebGLRenderer({
    canvas: canvas
});
renderer.setSize(sizes.width, sizes.height);
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

//===============================
//Animate
//===============================
const clock = new THREE.Timer();
const animate = () => {
    controls.update();
    renderer.render(scene, camera);
    window.requestAnimationFrame(animate);
}

animate();
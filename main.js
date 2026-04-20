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
const geometry = new THREE.PlaneGeometry(1, 1, 32, 32);

//===============================
//Materials
//===============================
const material = new THREE.RawShaderMaterial({
    vertexShader: vertexShader,
    fragmentShader: fragmentShader,
    uniforms:
        {
            uFrequency: { value: new THREE.Vector2(10, 5) },
            uTime: { value: 0 },
            uColor: { value: new THREE.Color('orange') }
        }
});

gui.add(material.uniforms.uFrequency.value, 'x').min(0).max(20).step(0.01).name('frequencyX');
gui.add(material.uniforms.uFrequency.value, 'y').min(0).max(20).step(0.01).name('frequencyY');

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
    clock.update();
    const elapsedTime = clock.getElapsed();
   //Update Material
    material.uniforms.uTime.value = elapsedTime;
    material.uniforms.uColor.value = new THREE.Vector3(Math.sin(elapsedTime), Math.sin(elapsedTime) * 0.3, 1);

    controls.update();
    renderer.render(scene, camera);
    window.requestAnimationFrame(animate);
}

animate();
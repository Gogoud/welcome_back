#pragma strict

function Start () 
{
	var distances = new float[32];
	distances[8] = 9;
	distances[9] = 9;
	camera.layerCullDistances = distances;
	camera.layerCullSpherical = true;

}

function Update () {

}
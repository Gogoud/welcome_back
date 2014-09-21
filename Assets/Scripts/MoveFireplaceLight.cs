using UnityEngine;
using System.Collections;




public class MoveFireplaceLight : MonoBehaviour {



	private Vector3 		spawnPos;



    void Start () 
	{
		double currentTime = (double)System.DateTime.Now.Ticks;


		Random.seed = 		(int)currentTime;
		spawnPos = 			transform.position;
		InvokeRepeating ("UpdateLight", 0.25F, 0.25F);







	}

	/*void FixedUpdate()
	{
		rigidbody.AddForce (0,10,0);
	}*/
	

	// Update is called once per frame
	void UpdateLight () 
	{
		rigidbody.AddForce(
			Random.Range(-50F, 50F),
			Random.Range(-50F, 50F),
			Random.Range(-50F, 50F)
			);



	}

	void OnCollisionTrigger()
	{
		Invoke ("UpdateLight",0);
	}



}

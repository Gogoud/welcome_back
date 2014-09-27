using UnityEngine;
using System.Collections;

public class FollowPlayer : MonoBehaviour 
{
	//public NavMeshAgent m_Agent;
	public GameObject m_Player;
	// Use this for initialization
	void Start () 
	{
		m_Player = GameObject.FindGameObjectWithTag ("Player");
		//m_Agent = GetComponent<NavMeshAgent>();
	}
	
	// Update is called once per frame
	void Update () 
	{
		transform.LookAt(m_Player.transform);
		//m_Agent.SetDestination (m_Player.transform.position);
	}
}

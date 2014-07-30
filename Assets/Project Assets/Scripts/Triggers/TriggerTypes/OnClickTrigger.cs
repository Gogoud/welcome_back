using UnityEngine;
using System.Collections;

public class OnClickTrigger : MonoBehaviour 
{
	public void OnMouseDown()
	{
		if(gameObject.GetComponent<SuperTrigger>())
		{
			SuperTrigger[] triggerArray;
			triggerArray = gameObject.GetComponents<SuperTrigger>();
			foreach(SuperTrigger c in triggerArray)
			{
				if(c.m_OnClick){
					c.ActivateTrigger();
				}
			}
		}
	}
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerControl : MonoBehaviour
{

    public float speed;
    float speedX, speedY;

    Rigidbody2D rb;

    public VectorValue startingPosition;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();

        transform.position = startingPosition.initalValue;
    }

    // Update is called once per frame
    void FixedUpdate()
    {

        if(DialogueManager.GetInstance().dialogueIsPlaying)
        {
            return;
        }

        speedX = Input.GetAxisRaw("Horizontal") * speed;
        speedY = Input.GetAxisRaw("Vertical") * speed;
        rb.velocity = new Vector2(speedX, speedY);
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class InputHandler : MonoBehaviour
{
    [SerializeField] InputField inputField;
    [SerializeField] Text resultText;

    public void ValidateInput()
    {
        string input = inputField.text;

        if(input == "hi")
        {
            resultText.text = "valid";
            resultText.color = Color.green;
        }
        else
        {
            resultText.text = "invalid";
            resultText.color = Color.red;
        }
    }
    
}

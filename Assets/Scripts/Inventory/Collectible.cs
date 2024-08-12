using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class Collectible : MonoBehaviour, ICollectible
{
    public static event HandleCollectibleCollected OnCollectibleCollected;
    public delegate void HandleCollectibleCollected(ItemData itemData);
    public ItemData collectibleData;

    public void Collect()
    {
        Debug.Log("collected!!");
        Destroy(gameObject);
        OnCollectibleCollected?.Invoke(collectibleData);
    }
}
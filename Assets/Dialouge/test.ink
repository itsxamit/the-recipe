// Declare variables
VAR playerName = "Player"
VAR hasTalkedToElder = false
VAR hasTalkedToMerchant = false
VAR hasArtifact = false

// Entry point
-> START

=== START ===
~ playerName = "Alex" // Set player's name for this example
Elder: Ah, welcome, {playerName}. We have been <b>expecting</b> you.
+ [Why have you been expecting me?]
    -> why_expecting
+ [Who are you?]
    -> who_are_you

=== why_expecting ===
Elder: You have a special destiny, {playerName}. The village needs your help to retrieve the lost artifact.
+ [Tell me more about this artifact.]
    -> tell_more
+ [I need to know more about my destiny first.]
    -> know_destiny

=== who_are_you ===
Elder: I am the Elder of this village. My duty is to guide and protect our people.
+ [Why have you been expecting me?]
    -> why_expecting
+ [Tell me more about this artifact.]
    -> tell_more

=== tell_more ===
~ hasTalkedToElder = true
Elder: The artifact is a powerful relic, stolen from us by a band of thieves. It is said to bring prosperity to our village.
Elder: You should speak to the merchant for more information. He often deals with travelers and might know where the thieves are hiding.
+ [I will speak to the merchant.]
    -> go_to_merchant
+ [I have more questions for you.]
    -> more_questions

=== know_destiny ===
Elder: Your destiny is intertwined with the fate of our village. The artifact is crucial for our survival.
+ [Tell me more about this artifact.]
    -> tell_more
+ [I will speak to the merchant.]
    -> go_to_merchant

=== more_questions ===
Elder: What else do you need to know, {playerName}?
+ [Why was the artifact stolen?]
    -> why_stolen
+ [Who are these thieves?]
    -> who_thieves

=== why_stolen ===
Elder: The thieves believe the artifact holds great power. They seek to use it for their own gain.
+ [I will speak to the merchant.]
    -> go_to_merchant
+ [Who are these thieves?]
    -> who_thieves

=== who_thieves ===
Elder: They are a notorious group, known for their cunning and ruthlessness. Be careful, {playerName}.
+ [I will speak to the merchant.]
    -> go_to_merchant

=== go_to_merchant ===
~ hasTalkedToMerchant = true
-> merchant_scene

=== merchant_scene ===
Merchant: Ah, {playerName}, the Elder told me you might come. You seek the artifact, yes?
+ [Yes, do you know where it is?]
    -> know_where
+ [Can you tell me more about the thieves?]
    -> more_about_thieves

=== know_where ===
Merchant: I have heard rumors. The thieves were last seen near the old ruins to the north. Be cautious, it is a dangerous place.
~ hasArtifact = true
+ [Thank you, I will head to the ruins.]
    -> go_to_ruins
+ [Can you tell me more about the ruins?]
    -> more_about_ruins

=== more_about_thieves ===
Merchant: They are a tricky bunch, always on the move. But they value their hideouts. The ruins to the north are a likely spot.
+ [Thank you, I will head to the ruins.]
    -> go_to_ruins
+ [Can you tell me more about the ruins?]
    -> more_about_ruins

=== more_about_ruins ===
Merchant: The ruins are remnants of an ancient civilization. Many dangers lurk there, but also many secrets. Good luck, {playerName}.
+ [Thank you, I will head to the ruins.]
    -> go_to_ruins

=== go_to_ruins ===
-> ruins_scene

=== ruins_scene ===
{hasArtifact:
    // Continue the quest here
    Player: I have the artifact! Now I must return to the village.
    -> END
- else:
    // Player has not found the artifact
    Player: I must find the artifact in these ruins.
    -> search_ruins
}

=== search_ruins ===
Player: The ruins are vast. Where should I start looking?
+ [Search the main chamber.]
    -> main_chamber
+ [Search the hidden passage.]
    -> hidden_passage

=== main_chamber ===
Player: The main chamber is empty. I should try another area.
-> search_ruins

=== hidden_passage ===
Player: I found the artifact hidden here!
~ hasArtifact = true
-> go_to_ruins

=== END ===
Player: I should return to the village with the artifact.
-> END

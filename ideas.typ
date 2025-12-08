= Project Ideas

== Data

I have a bunch of data that I produced during work in a research institute. 

The data is produced from simulations of converations between 2 LLM agents. More specifically, the data consists of a counceling session between a "councelor" LLM and a "patient" LLM.

```json
{
  "_default": {
    "1": {
      "simulation_id": "llama3.3_latest_0.1_0_317",
      "model": "llama3.3:latest",
      "counselor_temperature": 0.1,
      "conversation": [
        { "role": "assistant", "name": "Patient", "content": "Good morning." },
        {
          "role": "assistant",
          "name": "Counselor",
          "content": "I'm Laura, your chatbot coach for a healthy lifestyle. What's your name, age, and occupation?"
        },
        {
          "role": "user",
          "name": "Patient",
          "content": "Danilo Terry, 24, Quality Manager."
        },
        ...
        ...
```

=== AIME2025

We selected Llama 3.3-70B as LLM for the agents due to its extensive parametric knowledge of medical concepts and conversational fluency, and instruction-following skills. We translated the BAP protocol into a structured system prompt to create the agents following the role-play prompt framework.

We then created three different patient personas#footnote[We used Mimesis to simulate random demographics ensuring variability across personas \url{https://mimesis.name}] corresponding to different stages of the transtheoretical model of change (TTMC):
- A _Collaborative_ patient (motivated to change, corresponding to the preparation stage in TTMC),
- a _Confused_ patient (uncertain and requiring more guidance, corresponding to the contemplation stage in TTMC),
- and an _Uncollaborative_ patient (actively resistant to suggestions, corresponding to the precontemplation stage in TTMC).

To assess the effect of model variability, we tested five temperature settings \{0.1, 0.3, 0.5, 0.7, 0.9\}, generating 10 sessions per patient type for a total of 150 simulations.

=== 
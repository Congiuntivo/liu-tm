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

=== AIME 2025 (Role-play LLMs 4 SBC) / ECAI 2025 (VALISE)

We selected Llama 3.3-70B as LLM for the agents due to its extensive parametric knowledge of medical concepts and conversational fluency, and instruction-following skills. We translated the BAP protocol into a structured system prompt to create the agents following the role-play prompt framework.

We then created three different patient personas#footnote[We used Mimesis to simulate random demographics ensuring (3 different prompts) variability across personas \url{https://mimesis.name}] corresponding to different stages of the transtheoretical model of change (TTMC):
- A _Collaborative_ patient (motivated to change, corresponding to the preparation stage in TTMC),
- a _Confused_ patient (uncertain and requiring more guidance, corresponding to the contemplation stage in TTMC),
- and an _Uncollaborative_ patient (actively resistant to suggestions, corresponding to the precontemplation stage in TTMC).

To assess the effect of model variability, we tested five temperature settings \{0.1, 0.3, 0.5, 0.7, 0.9\}, generating 10 sessions per patient type for a total of 150 simulations.

For each conversation, we have the following data:

- Prompt: {collaborative, confused, uncollaborative}
- Temperature: {0.1, 0.3, 0.5, 0.7, 0.9}
- Human evaluation of task completions
- LLM-based evaluation of task completions

=== BAP for Overweight Children

The conversations were produced for the validation of a chatbot coach for overweight children based on the BAP (Brief Action Planning) protocol. The conversations are in Italian. The prompts are always the same for both agents.

The idea was to find the best configuration (model, temperature) for the chatbot coach.

1000 conversations, 250 for each model, with 50 for each model-temperature pair.

For each conversation, we have the following data:
- Model: {qwen2.5:32b, qwen2.5:72b, llama3.2-vision:90b, aya-expanse:32b}
- Temperature: {0.1, 0.3, 0.5, 0.7, 0.9}
- Human evaluation of task completions

=== LLama3.1_70B Simulations

A bunch of simulations with Llama3.1_70B for BAP counseling sessions. The conversations are in Italian. The prompts are always the same for both agents.

250 conversations, 50 for each temperature value.

For each conversation, we have the following data:
- Temperature: {0.1, 0.3, 0.5, 0.7, 0.9}

== Possible Projects

=== Model Recognition

Test different clustering algorithms to see how they perform in recognizing the model (datasets: BAP).

- Recognize the temperature? (Hard) 

==== Clustering Algorithms

- Spectral Clustering ???
- Hierarchical Clustering ???

=== AIME 2025 Prompts

See if we manage to find the 3 prompts? and temperatures? 

=== Train a Classifier to Recognize the Temperature

Merge Llama3.1_70B and BAP for Overweight Children datasets. Try if with a classifier (e.g., Random Forest, SVM, or a simple Neural Network) we can recognize the temperature used in the simulations. 

#highlight[out of topic?]
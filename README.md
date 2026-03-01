1. **Set seeds & split**

   * Pick a random seed; use it everywhere.
   * Split data stratified by model: **train 80% / test 20%**. Save split indices.

2. **Preprocessing (fixed, label-free)**

   * Lowercase, remove clear non-linguistic artifacts.
   * Do **not** tune preprocessing with labels.
   * Save a small preprocessing script and the cleaned files.

3. **Define TF–IDF grid (a priori)**

   * Example grid (keep small):

     * `ngram_range`: (1,1), (1,2)
     * `max_features`: 10000, 50000
     * `min_df`: 1, 2
     * `sublinear_tf`: True/False (choose two)
   * Document the grid and rationale.

4. **Select vectorizer on training set only**

   * For each vectorizer config:

     * Fit TF–IDF on **training** texts only.
     * Run **k-means** on the resulting vectors with `k = number of models`.
     * Compute **internal clustering metrics** (silhouette, Davies–Bouldin, Calinski-Harabasz).
   * Choose the config that maximizes internal criteria (explain which criterion you prioritize).
   * **Fix** that vectorizer and save it.

5. **Run final k-means (training)**

   * Fit k-means on training vectors with chosen vectorizer. Use `n_init >= 10`, specify `random_state`.
   * Save centroids and cluster assignments.

6. **Evaluate clustering (post-hoc)**

   * Compare training clusters to true labels: ARI, NMI, and a confusion matrix between cluster↔model.
   * Report these but emphasize the selection used internal metrics only.

7. **Train supervised classifier**

   * Use the **same fixed TF–IDF** features.
   * Train a simple linear model (Logistic Regression or Linear SVM) on training set. Use stratified folds if you tune hyperparameters.
   * Save model and scaler/vectorizer.

8. **Evaluate classifier on test set**

   * Report: Accuracy, macro-F1, confusion matrix, per-class precision/recall.
   * Compare classifier performance to clustering (ARI/NMI on test via cluster assignment from k-means fit on training? — explain limitations if you project centroids to test).

9. **Interpretability**

   * **Centroid inspection**: list top TF–IDF terms for each k-means centroid.
   * **Prototype examples**: select 3 closest-to-centroid and 3 near-boundary conversations per cluster.
   * **LIME**: run LIME on classifier predictions for a sample of test conversations (one per class + borderline cases). Save explanations (top tokens with weights).

10. **Qualitative checklist**

    * For representative samples, tabulate: average turn length, total tokens, type–token ratio, frequency of hedging/modal verbs, question count, presence of medical terms, politeness tokens.
    * Use this to connect LIME terms to conversational behaviors.

11. **Robustness checks (concise)**

    * Run k-means with `k ± 1` and report ARI change.
    * Shuffle labels and rerun classifier to confirm chance performance.
    * Try alternate TF–IDF choices (one ablation): remove stopwords / remove bigrams and report impact.

12. **Negative / failure modes**

    * Document if HDBSCAN or density methods failed (instability) — include brief diagnostics (e.g., tiny clusters, many noise points).

13. **Reproducibility & artifacts**

    * Create a repo with: `data_manifest`, `requirements.txt`, `random_seed`, `notebook + scripts` for preprocessing, vectorizer selection, clustering, classifier, LIME.
    * Save models and TF–IDF objects to disk and include small README on how to reproduce main figures.

14. **Figures / tables to produce**

    * Bar/line of internal metric scores across TF–IDF grid.
    * ARI and NMI for clustering (train) and classifier accuracy (test).
    * Confusion matrices (clustering and classifier).
    * Top-terms table for centroids.
    * 4–6 LIME explanation examples (as small tables).
    * 1 page appendix with prototypical dialogues.

15. **Writeup checklist (short)**

    * Method: state the **assumption** `k = #models` and justify it.
    * Bias note: explicitly state vectorizer selection used only **internal** metrics on training data.
    * Discussion: connect centroid/LIME terms to qualitative observations; acknowledge limits.

16. **Final sanity**

    * Re-run full pipeline once with the same seed and verify identical outputs.
    * Run a single out-of-sample sanity test (if possible) or explain why not.

That’s it — 16 compact steps. If you want, I can:

* produce minimal example code for step 4 (vectorizer selection loop) or
* generate a template README that documents reproducibility. Which do you want next?

# Clustering Analysis of BAP Counseling Dialogues

## Research Question

> **Which textual representations best capture model-specific behavioral differences in BAP counseling dialogues?**

## Workflow Overview

### 1. Data Preparation

**Unit of analysis:** one conversation  
**Text selection:** concatenate **counselor-only turns** (patient messages removed)

**Rationale:** the research question targets _model behavior_ under a fixed counseling protocol; patient utterances introduce variability unrelated to the generating model.

---

### 2. Textual Representations

We compare three families of textual representations.

#### 2.1 Lexical Representations

- TF-IDF (unigrams)
- TF-IDF (unigrams + bigrams)
- Minimal preprocessing:
  - lowercasing
  - Italian stopword removal

These representations capture surface-level stylistic differences.

---

#### 2.2 Semantic Representations

- Multilingual Sentence-BERT embeddings
- Entire counselor text embedded as a single document
- Cosine similarity

These representations aim to capture contextual and discourse-level similarities beyond lexical overlap.

---

#### 2.3 Behavioral / Structural Representations

Low-dimensional, interpretable features describing counselor behavior:

- Number of counselor turns
- Average and variance of counselor turn length
- Question ratio
- Lexical diversity (e.g., Type–Token Ratio)
- Simple stylistic indicators (e.g., imperatives)

These features explicitly model _how_ the counselor behaves rather than _what_ is said.

---

### 3. Dimensionality Reduction (Visualization Only)

- Principal Component Analysis (PCA)
- UMAP

Dimensionality reduction is used exclusively for qualitative inspection and visualization of structure, not for clustering.

---

### 4. Clustering

**Primary method:**

- Agglomerative Hierarchical Clustering
  - Cosine distance
  - Average linkage

**Secondary method (robustness check):**

- HDBSCAN applied to embedding-based representations

Clustering is used as an exploratory probe to reveal latent structure in the data.

---

### 5. Evaluation

#### 5.1 External Validation

Known labels are used **only for evaluation**:

- Adjusted Rand Index (ARI)
- Normalized Mutual Information (NMI)

Cluster assignments are compared against the generating **LLM model**.

---

#### 5.2 Qualitative Analysis

- Inspection of representative clusters
- Comparison of counselor behaviors across clusters
- Discussion of stylistic and structural differences

---

### 6. Analysis and Interpretation

Representations are compared in terms of:

- Ability to recover model identity
- Stability of clustering structure
- Interpretability of the resulting clusters

Results are discussed in light of strong protocol constraints and the expected continuous effect of temperature.

---

## Summary

_We evaluate lexical, semantic, and behavioral representations of counselor-only BAP dialogues to determine which representations best recover the underlying LLM model via unsupervised clustering._

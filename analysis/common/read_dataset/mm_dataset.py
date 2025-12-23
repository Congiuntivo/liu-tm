from pathlib import Path
import pandas as pd
import json


def read_mm_dataset(
    file_path: Path = Path("data/many-models-bap/res.json"),
) -> pd.DataFrame:
    """Reads a multimodal dataset from the specified file path.

    Args:
        file_path (Path): The path to the dataset file.
    Returns:
        pd.DataFrame: A DataFrame containing the many-models-bap dataset.
    """
    with open(file_path, "r") as f:
        data = json.load(f)

        data = data.get("_default")
        assert type(data) is dict

        entries = list(data.values())
        df = pd.DataFrame(entries)

        df = df.drop("language_assistant", axis=1)

        return df


if __name__ == "__main__":
    df = read_mm_dataset()
    print(df.head())

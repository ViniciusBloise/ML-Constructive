import torch
import numpy as np
import pandas as pd
from tqdm import tqdm
from collections import deque
from torch.utils.data import DataLoader
from InOut.image_manager import DatasetHandler, OnlineDataSetHandler
from version1 import Settings, operations, print_sett

import sys


def main() -> int:
    print('Start probing.')

    settings = Settings()
    generator = DatasetHandler(settings)
    data_logger = tqdm(DataLoader(generator, batch_size=settings.bs, drop_last=True))

    for data in data_logger:
        x, y = data["X"], data["Y"]

    return 0


if __name__ == "__main__":
    sys.exit(main())

"""
Using frequency
===============

Using a dictionary of word frequency.
"""

import multidict as multidict

import numpy as np

import os
import re
from PIL import Image
from os import path
from wordcloud import WordCloud
import matplotlib.pyplot as plt


def getFrequencyDictForText(sentence, regex):
    fullTermsDict = multidict.MultiDict()
    tmpDict = {}

    # making dict for counting frequencies
    for text in sentence.split(" "):
        if re.match(regex, text):
            continue
        val = tmpDict.get(text, 0)
        tmpDict[text.lower()] = val + 1
    for key in tmpDict:
        fullTermsDict.add(key, tmpDict[key])
    return fullTermsDict


def makeImage(text):
    flag_mask = np.array(Image.open("generated/wordcloud/Spain-Flag.png"))

    wc = WordCloud(background_color="white", max_words=1000, mask=flag_mask)
    # generate word cloud
    wc.generate_from_frequencies(text)

    # show
    plt.imshow(wc, interpolation="bilinear")
    plt.axis("off")
    plt.show()

#word = "batiburrillo" # es
word = "méli-mélo" # fr
# get data directory (using getcwd() is needed to support running example in generated IPython notebook)
d = path.dirname(__file__) if "__file__" in locals() else os.getcwd()

regex = "une?|l(a|e)s?|des?|avec|dans|en|p(a|ou)r|sur|est|ce|être|•|□|[|]|:|sont?|ses?|du|aux?|et|ou|que|car|mais|ne|pas|plus|donc|comme" # fr text to filter out
#regex = "un|una|el|la|los|las|unos|unas|con|in|del|o|es|está|ser|estar|que|su|sus|por|no|lo|de|le|•|□|[|]"# esp text to filter out
text = open(path.join(d, f"generated/wordcloud/{word}-output_file.txt"), encoding='utf-8')
text = text.read()
makeImage(getFrequencyDictForText(text, regex))

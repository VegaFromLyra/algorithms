import re

def top_n_words(sentence, n):
  from collections import defaultdict
  freq_map = defaultdict(int)

  delimiters = '\s+|,\s+'

  for word in re.split(delimiters, sentence):
    freq_map[word] += 1

  return sorted(freq_map, key=freq_map.get, reverse=True)[0:n]

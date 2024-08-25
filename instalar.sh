#!/bin/bash
# Detectar se é Ubuntu ou Debian
if [ -x "$(command -v lsb_release)" ]; then
  if lsb_release -i | grep -qi 'ubuntu'; then
    make ubuntu
  elif lsb_release -i | grep -qi 'debian'; then
    # make debian
    echo "Desculpe, neste momento esta distribuição ainda não é suportada."
  else
    echo "Desculpe, esta distribuição não é suportada."
  fi
else
  echo "lsb_release não existe. Desculpe, não foi possível identificar a distribuição."
fi

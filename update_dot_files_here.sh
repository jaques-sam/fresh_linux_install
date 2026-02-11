#!/usr/bin/env bash

# Update all dot files from my home directory that exist in the dot_files directory
# Adds the dot_files to the git staging area

for file in dot_files/*; do
    potential_file=${HOME}/.$(basename "${file}")
    if [[ ! -f "${potential_file}" ]]; then
        continue
    fi
    cp "${potential_file}" "${file}"
done

for file in "${HOME}"/.config/fish/*; do
    potential_file=${HOME}/.config/fish/$(basename "${file}")
    cp -r "${potential_file}" "fish_config/$(basename "${file}")"
done

git add dot_files
git add fish_config

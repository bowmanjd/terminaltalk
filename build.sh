#!/bin/sh

mkdir ./dist
cd slides
pnpm install
pnpm build
cd ..

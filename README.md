# Elephant Detection & Alert System

An embedded deep-learning system that detects elephants in real time and 
triggers a hardware alert, aimed at reducing human-elephant conflict in 
forest-border regions of India.

## Overview
- Trained a MobileNetV2 CNN via transfer learning in MATLAB R2024b on a 
  custom 854-image dataset (420 elephant, 434 non-elephant), achieving 
  ~95% validation accuracy.
- Deployed the model on a Raspberry Pi 4B (headless, legacy 64-bit OS), 
  controlled remotely via MATLAB's `raspi()` interface.
- Live camera frames are classified in real time; when elephant confidence 
  exceeds 0.80, a GPIO-driven PWM buzzer (1000 Hz) triggers an audible alert.
- Beta tested with 44 real-world detection events — 93.6% average 
  classification confidence.

## Tech Stack
MATLAB (Deep Learning Toolbox), MobileNetV2, Raspberry Pi 4B, GPIO/PWM, 
Python (image preprocessing)

## System Architecture
Camera → Frame capture → MobileNetV2 classification → Confidence threshold 
gate (>0.80) → GPIO PWM buzzer alert → CSV logging

## Results
| Metric | Value |
| Validation Accuracy | ~95% |
| Beta Test Detections | 44 |
| Avg. Confidence (Elephant) | 93.18% |
| Avg. Confidence (Non-Elephant) | 94.11% |
| Inference Time / Frame | ~1.5s |

## Full Report
See `docs/project_report.pdf` for complete methodology, math, and results.

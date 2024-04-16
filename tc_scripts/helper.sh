#!/usr/bin/env bash
# ---- Clang Build Scripts ----
# Copyright (C) 2023-2024 fadlyas07 <mhmmdfdlyas@proton.me>

# Function to show an informational message
function kecho() {
    echo -e "\e[1;32m$*\e[0m"
}

function kerror() {
    echo -e "\e[1;41m$*\e[0m"
}

# Inlined function to post a message to telegram
function telegram_message() {
    curl -s \
        -X POST "https://api.telegram.org/bot${tgbot_token}/sendMessage" \
        -d chat_id="${tgchannel_chatid}" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="${1}"
}

function telegram_file() {
    curl \
        -F document=@"${1}" "https://api.telegram.org/bot${tgbot_token}/sendDocument" \
        -F chat_id="${tguser_chatid}" \
        -F "disable_web_page_preview=true" \
        -F "parse_mode=html" \
        -F caption="${2}"
}

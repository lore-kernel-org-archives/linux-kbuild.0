Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34597 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727479AbfBHOV2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Feb 2019 09:21:28 -0500
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 8 Feb 2019 15:21:15 +0100
Message-ID: <CA+icZUUs-OYuSs184jC+RivsyLmB5sLZdkfxckSTYrq2ibJS=w@mail.gmail.com>
Subject: Re: [PATCH 3/4] Makefile: lld: tell clang to use lld
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Nick,

why don't you simply check for CONFIG_LD_IS_LLD existing (when [1] applied)?

If you want a specific version of ld.lld (you mentioned kernel module
linking failure was fixed recently) why not transfer this into a
scripts/lld-version.sh file?

Greetings,
- Sedat -

[1] https://lore.kernel.org/patchwork/patch/1039719/ ("[1/4]
init/Kconfig: add config support for detecting linker")

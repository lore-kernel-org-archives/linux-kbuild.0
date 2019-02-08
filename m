Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40657 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfBHQY3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Feb 2019 11:24:29 -0500
Date: Fri, 8 Feb 2019 09:24:24 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 3/4] Makefile: lld: tell clang to use lld
Message-ID: <20190208162424.GA636@archlinux-ryzen>
References: <CA+icZUUs-OYuSs184jC+RivsyLmB5sLZdkfxckSTYrq2ibJS=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUUs-OYuSs184jC+RivsyLmB5sLZdkfxckSTYrq2ibJS=w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 08, 2019 at 03:21:15PM +0100, Sedat Dilek wrote:
> Hi Nick,
> 
> why don't you simply check for CONFIG_LD_IS_LLD existing (when [1] applied)?
> 

Hi Sedat,

This section runs before Kconfig so we can't rely on the symbols it
generates. See commit 995167420797 ("kbuild: remove cc-name variable")
for Masahiro's explanation.

> If you want a specific version of ld.lld (you mentioned kernel module
> linking failure was fixed recently) why not transfer this into a
> scripts/lld-version.sh file?
> 

We'll probably need that eventually but given that lld isn't ready for
widespread use, I don't think it's necessary.

> Greetings,
> - Sedat -
> 
> [1] https://lore.kernel.org/patchwork/patch/1039719/ ("[1/4]
> init/Kconfig: add config support for detecting linker")

Nathan

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f68.google.com ([209.85.166.68]:36102 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfJ2BlF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Oct 2019 21:41:05 -0400
MIME-Version: 1.0
References: <20191028155639.30330-1-e5ten.arch@gmail.com> <CAK7LNAS41TxKMLBj3_N=WE57CT7ttHes+7GdLWNW-mAgPkvW7w@mail.gmail.com>
In-Reply-To: <CAK7LNAS41TxKMLBj3_N=WE57CT7ttHes+7GdLWNW-mAgPkvW7w@mail.gmail.com>
From: Ethan Sommer <e5ten.arch@gmail.com>
Date: Mon, 28 Oct 2019 21:40:51 -0400
Message-ID: <CAMEGPiq+Z7kbjJSNA0m=1TAymamQExud_7v5yzakSPdciPbq1Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support byacc as alternative YACC to bison
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

> I applied this patch, and tried the latest byacc,
> but I still cannot build kconfig probably because
> %destructor is not supported.
> byacc does not seem to work anyway.

Hi Masahiro, because I hadn't built it in a while I completely forgot
that to support %destructor byacc needs to be built with
--enable-btyacc, should I update the commit message to include that
detail?

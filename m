Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:22836 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729295AbfFRPEb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Jun 2019 11:04:31 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x5IF4RZm007098
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jun 2019 00:04:28 +0900
Received: by mail-ua1-f42.google.com with SMTP id o2so6259031uae.10
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Jun 2019 08:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoBWHw2yPgT_25UVF_3tTx6_FfZMBbDqVW5TASb4aPu2JKHZg@mail.gmail.com>
In-Reply-To: <CAJoBWHw2yPgT_25UVF_3tTx6_FfZMBbDqVW5TASb4aPu2JKHZg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 19 Jun 2019 00:03:50 +0900
Message-ID: <CAK7LNASaP4PtiPqcv_tBkgJNJQuUaVFWLmdqjs6f86pXbKeYNA@mail.gmail.com>
Subject: Re: Adding new build target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Derrick McKee <derrick.mckee@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Jun 8, 2019 at 1:58 AM Derrick McKee <derrick.mckee@gmail.com> wrote:
>
> Hi all,
>
> Now that the kernel can be built with clang, I'd like to implement a
> new build target to generate LLVM bytecode for all C source files
> involved for a specific build configuration.  I am thinking that this
> should be very simple if I know the make variables that captures the
> needed information.  Specifically, I think I just need to perform the
> following command for all C files:
>
> clang -emit-llvm -c <appropriate CFLAGS and include paths> <source
> file> -o <corresponding object file location>.bc
>
> My problem is that I don't know how to get the info in the brackets,
> but I am thinking that I should make a new build target `bytecode`.
> Any help would be appreciated.  Thanks.
>
> Derrick McKee

Commit 433db3e260bc supported a single target to
generate llvm bytecode,
but it is not used for the final vmlinux or modules.

For what reason,
do you need to generate llvm bytecode for every file?

-- 
Best Regards
Masahiro Yamada

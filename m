Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:35379 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728697AbfJWFW7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 01:22:59 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x9N5MnFA005835
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2019 14:22:49 +0900
Received: by mail-ua1-f49.google.com with SMTP id l13so5639637uap.8
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2019 22:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191003031312.157994411@gmail.com> <20191003031312.252507322@gmail.com>
In-Reply-To: <20191003031312.252507322@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 23 Oct 2019 14:22:12 +0900
Message-ID: <CAK7LNAQzY6LgYyJLS7jxpksi4R-v+kVLESdDzM5Xijxw5oFBUg@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts: namespace.pl: handle lib-ksyms.o as lib.a
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rd.dunlab@gmail.com
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>

Randy,

On Thu, Oct 3, 2019 at 12:18 PM <rd.dunlab@gmail.com> wrote:


> In scripts/Makefile.build, any resulting lib-ksyms.o file is renamed to
> lib.a, so handle that rename here also.

This description is incorrect.
lib-ksyms.o is included in built-in.a


The code attempts to suppress the warnings
in a strange way.


I think the following is a more straightforward way.


diff --git a/scripts/namespace.pl b/scripts/namespace.pl
index 4a545ba868f8..f0c94333a23d 100755
--- a/scripts/namespace.pl
+++ b/scripts/namespace.pl
@@ -166,6 +166,7 @@ sub linux_objects
        if (/.*\.o$/ &&
                ! (
                m:/built-in.a$:
+               || m:/lib-ksyms.o$:
                || m:arch/x86/vdso/:
                || m:arch/x86/boot/:
                || m:arch/ia64/ia32/ia32.o$:





--
Best Regards
Masahiro Yamada

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:34678 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1764123AbdKRBvH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 20:51:07 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAThpT3_kEpR=m=pXh9YV27bgaytER33JadjxvaWJGWKWw@mail.gmail.com>
References: <CAK7LNAThpT3_kEpR=m=pXh9YV27bgaytER33JadjxvaWJGWKWw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Nov 2017 17:51:05 -0800
Message-ID: <CA+55aFy4y+-WM=fh4nhvTqTk0nF_c1525CLGCu44Q7rpbBRDZg@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v4.15
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Nov 17, 2017 at 9:22 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Here are Kbuild updates for v4.15.  Please pull!

Mind checking that I got the CFLAGS_KCOV behavior right. The conflict
looked pretty simple, but somebody should check the ordering of the

   export CFLAGS_KCOV

vs the actual setting (that is now in scripts/Makefile.kcov.

It probably doesn't matter, but our makefiles are black magic.

              Linus

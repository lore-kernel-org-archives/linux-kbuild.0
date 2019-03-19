Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52656 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbfCSJDc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Mar 2019 05:03:32 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAK7LNAS4zVusQRQLFNmmza9U_zbNBrjyx4qyDcH8g1oL0AzHTQ@mail.gmail.com>
References: <CAK7LNAS4zVusQRQLFNmmza9U_zbNBrjyx4qyDcH8g1oL0AzHTQ@mail.gmail.com> <23500.1552920217@warthog.procyon.org.uk>
Subject: Re: Commit seems to prevent use of GNUmakefile wrappers
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4206.1552986209.1@warthog.procyon.org.uk>
Date: Tue, 19 Mar 2019 09:03:29 +0000
Message-ID: <4207.1552986209@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: dhowells@redhat.com, Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Manoj Srivastava <srivasta@debian.org>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> How about this patch?
> https://patchwork.kernel.org/patch/10858809/
> 
> I hope you will be able to wrap the top Makefile again.

That works for me.

Tested-by: David Howells <dhowells@redhat.com>

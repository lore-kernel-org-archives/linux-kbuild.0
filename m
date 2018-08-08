Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55230 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726834AbeHHNFJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Aug 2018 09:05:09 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAK7LNARPPskMNPkOjOZ9Xq06aVwWTocMXcVdqBHWWN+KZsOPRw@mail.gmail.com>
References: <CAK7LNARPPskMNPkOjOZ9Xq06aVwWTocMXcVdqBHWWN+KZsOPRw@mail.gmail.com> <1533694454-7086-1-git-send-email-yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] kbuild: make samples really depend on headers_install
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <706.1533725158.1@warthog.procyon.org.uk>
Date: Wed, 08 Aug 2018 11:45:58 +0100
Message-ID: <707.1533725158@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Could you check this patch, please?

That seems to work.

Tested-by: David Howells <dhowells@redhat.com>

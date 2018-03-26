Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42094 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751249AbeCZPyc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Mar 2018 11:54:32 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAK7LNASa=QrQRQ03KQNKdFb-EW-maWbhSi8=iYz5fJ7kEfPEFg@mail.gmail.com>
References: <CAK7LNASa=QrQRQ03KQNKdFb-EW-maWbhSi8=iYz5fJ7kEfPEFg@mail.gmail.com> <1521810279-6282-1-git-send-email-yamada.masahiro@socionext.com> <1521810279-6282-8-git-send-email-yamada.masahiro@socionext.com>
Subject: Re: [PATCH 08/10] kbuild: rename *-asn1.[ch] to *.asn.[ch]
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3227.1522079152.1@warthog.procyon.org.uk>
Date: Mon, 26 Mar 2018 16:45:52 +0100
Message-ID: <3228.1522079152@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: dhowells@redhat.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Rowand <frank.rowand@sony.com>, Geert Uytterhoeven <geert@linux-m68k.org>

The subject isn't consistent with the patch.  I presume you mean:

	kbuild: rename *-asn1.[ch] to *.asn1.[ch]

David

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:43326 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfFCLqE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 07:46:04 -0400
MIME-Version: 1.0
References: <20190603104902.23799-1-yamada.masahiro@socionext.com> <3dcacca3f71c46cc98fa64b13a405b59@AcuMS.aculab.com>
In-Reply-To: <3dcacca3f71c46cc98fa64b13a405b59@AcuMS.aculab.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 3 Jun 2019 20:45:16 +0900
Message-ID: <CAK7LNATt=P5rHrnK_8PTmjMb+tdtPg2qBgopRUDBFw_fkP2SsQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use more portable 'command -v' for cc-cross-prefix
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Laight <David.Laight@aculab.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>, Alexey Brodkin <abrodkin@synopsys.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, linux-stable <stable@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 3, 2019 at 8:16 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Masahiro Yamada
> > Sent: 03 June 2019 11:49
> >
> > To print the pathname that will be used by shell in the current
> > environment, 'command -v' is a standardized way. [1]
> >
> > 'which' is also often used in scripting, but it is not portable.
>
> All uses of 'which' should be expunged.
> It is a bourne shell script that is trying to emulate a csh builtin.
> It is doomed to fail in corner cases.
> ISTR it has serious problems with shell functions and aliases.

OK, I do not have time to check it treewide.
I expect somebody will contribute to it.



BTW, I see yet another way to get the command path.

'type -path' is bash-specific.

Maybe, we should do this too:

diff --git a/scripts/mkuboot.sh b/scripts/mkuboot.sh
index 4b1fe09e9042..77829ee4268e 100755
--- a/scripts/mkuboot.sh
+++ b/scripts/mkuboot.sh
@@ -1,14 +1,14 @@
-#!/bin/bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0

 #
 # Build U-Boot image when `mkimage' tool is available.
 #

-MKIMAGE=$(type -path "${CROSS_COMPILE}mkimage")
+MKIMAGE=$(command -v "${CROSS_COMPILE}mkimage")

 if [ -z "${MKIMAGE}" ]; then
-       MKIMAGE=$(type -path mkimage)
+       MKIMAGE=$(command -v mkimage)
        if [ -z "${MKIMAGE}" ]; then
                # Doesn't exist
                echo '"mkimage" command not found - U-Boot images will
not be built' >&2


-- 
Best Regards
Masahiro Yamada

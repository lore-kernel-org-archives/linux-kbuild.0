Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:53523 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754040Ab3KRTAk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Nov 2013 14:00:40 -0500
Received: by mail-we0-f182.google.com with SMTP id q59so4660993wes.13
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Nov 2013 11:00:37 -0800 (PST)
Date: Mon, 18 Nov 2013 20:00:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH]kconfig:qconf: Add an option to the "find" dialog for
 search in the description.
Message-ID: <20131118190033.GE3458@free.fr>
References: <526C1E31.2040604@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <526C1E31.2040604@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "v1kt0p.rus@gmail.com" <v1kt0p.rus@gmail.com>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, james.hogan@imgtec.com, ralf@linux-mips.org, tkhai@yandex.ru

Victor, All,

On 2013-10-26 22:55 +0300, v1kt0p.rus@gmail.com spake thusly:
> Adding the ability to search in description.
> 
> Signed-off-by: Victor Danchenko <v1kt0p.rus@gmail.com>

Your patch is space-mangled, and does not apply:

$ pwclient git-am 3098691
Applying patch #3098691 using 'git am'
Description: kconfig:qconf: Add an option to the "find" dialog for search in the description.
Applying: kconfig:qconf: Add an option to the "find" dialog for search in the description.
error: patch failed: scripts/kconfig/lkc_proto.h:35
error: scripts/kconfig/lkc_proto.h: patch does not apply
error: patch failed: scripts/kconfig/mconf.c:430
error: scripts/kconfig/mconf.c: patch does not apply
error: patch failed: scripts/kconfig/nconf.c:720
error: scripts/kconfig/nconf.c: patch does not apply
error: patch failed: scripts/kconfig/qconf.cc:1197
error: scripts/kconfig/qconf.cc: patch does not apply
error: patch failed: scripts/kconfig/qconf.h:5
error: scripts/kconfig/qconf.h: patch does not apply
error: patch failed: scripts/kconfig/symbol.c:990
error: scripts/kconfig/symbol.c: patch does not apply
Patch failed at 0001 kconfig:qconf: Add an option to the "find" dialog
for search in the description.
The copy of the patch that failed is found in:
   /home/ymorin/dev/linux/linux-kconfig/.git/rebase-apply/patch
When you have resolved this problem, run "git am --resolved".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Sending via a webmail (eg. gmail) is broken. Please use git 'send-email'
to send your patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

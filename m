Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38341 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753195AbcFGJ6j (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Jun 2016 05:58:39 -0400
Subject: Re: Regression in "kbuild: fix if_change and friends to consider
 argument order"
References: <1465263518.3885.9.camel@intel.com> <5756960E.5020706@suse.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <57569ACC.8050503@suse.cz>
Date: Tue, 7 Jun 2016 11:58:36 +0200
MIME-Version: 1.0
In-Reply-To: <5756960E.5020706@suse.com>
Content-Type: multipart/mixed;
 boundary="------------090707070505000601020503"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>

This is a multi-part message in MIME format.
--------------090707070505000601020503
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 2016-06-07 11:38, Michal Marek wrote:
> On 2016-06-07 03:38, Zanoni, Paulo R wrote:
>> Hi
>>
>> I recently noticed that alternating between "make" and "make targz-pkg"
>> rebuilds the whole Kernel. This was not happening before. As a Kernel
>> developer, my build/install/test environment heavily relies on the fact
>> that "make targz-pkg" only quickly generates the tarball if everything
>> is already built, so this change is heavily impacting my development
>> environment.
>>
>> I did some bisection and concluded that the first bad commit is:
>>
>> commit 9c8fa9bc08f60ac657751daba9fccf828a36cfed
>> Author: Masahiro Yamada
>> Date:   Sat May 7 15:48:26 2016 +0900
>>     kbuild: fix if_change and friends to consider argument order
>>
>> I also verified that if I just revert this commit on top of the
>> most recent tree it goes back to the usual behavior.
>>
>> I read the commit message and it seems that some unneeded rebuilds are
>> somewhat expected, but I can't understand why such a change in the
>> command line like the one I did triggers everything to be rebuilt.
>> IMHO, it really shouldn't. I also wonder that maybe the regression I'm
>> experiencing was not expected in the original change, so maybe there's
>> a way to keep the original improvement caused by the mentioned patch
>> without the regression I'm experiencing.
>>
>> How to reproduce (exact commands I used at every bisect step):
>>
>> $ make tinyconfig
>> $ time make -j4 V=2 # this should build things
>> $ time make -j4 V=2 # just to make sure nothing will be rebuilt
>> $ time make -j4 V=2 targz-pkg
> 
> I can reproduce it.

Try the attached patch.

Michal


--------------090707070505000601020503
Content-Type: text/x-patch;
 name="0001-kbuild-Initialize-NOSTDINC_CFLAGS.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-kbuild-Initialize-NOSTDINC_CFLAGS.patch"

From 86536cfcd776b5d9e238a4690756028799122a86 Mon Sep 17 00:00:00 2001
From: Michal Marek <mmarek@suse.com>
Date: Tue, 7 Jun 2016 11:57:02 +0200
Subject: [PATCH] kbuild: Initialize NOSTDINC_CFLAGS

The variable is exported, so it needs to be cleared to avoid duplicating
its content when running make from within make (e.g. in the packaging
targets).

Signed-off-by: Michal Marek <mmarek@suse.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 0f9cb36d45c2..1a85efa216ac 100644
--- a/Makefile
+++ b/Makefile
@@ -359,6 +359,7 @@ CHECK		= sparse
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void $(CF)
+NOSTDINC_FLAGS  =
 CFLAGS_MODULE   =
 AFLAGS_MODULE   =
 LDFLAGS_MODULE  =
-- 
2.6.2


--------------090707070505000601020503--

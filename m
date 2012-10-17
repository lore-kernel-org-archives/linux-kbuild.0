Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ezexch.ezchip.com ([212.179.42.101]:55868 "EHLO
	ezexch.ezchip.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756445Ab2JQJgV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Oct 2012 05:36:21 -0400
From: Noam Camus <noamc@ezchip.com>
Date: Wed, 17 Oct 2012 11:35:39 +0200
Subject: Race betwwen make jobs
Message-ID: <264C179F799EF24AB26D5319053335E80CC3001309@ezexch.ezchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "mmarek@suse.cz" <mmarek@suse.cz>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Hello,

Once in a while make fails when source tree is distcleaned (mrproper).
Actually it is while trying to compile scripts/mod/empty.c.

The error is because empty.o depends on some headers from arch/<arch>/include/generated/asm/.

From my analysis I see that there is a race between two targets one is scripts_basic and the other is asm-generic (both in main Makefile).

First target in make job:
	running target asm-generic to generate all wrappers in architecure include/generated.

Second target in make job:
	trying to compile scripts/mod/empty.c since it is under target "always" which is dependency for __build (see scripts/Makefile.build).


My naive patch for main Makefile is:
 # Basic helpers built in scripts/
 PHONY += scripts_basic
-scripts_basic:
+scripts_basic: asm-generic
        $(Q)$(MAKE) $(build)=scripts/basic
        $(Q)rm -f .tmp_quiet_recordmcount


Please comment.

Noam Camus

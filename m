Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:37141 "EHLO
	e06smtp10.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751715AbbKULAG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 Nov 2015 06:00:06 -0500
Received: from localhost
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Sat, 21 Nov 2015 11:00:04 -0000
From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH 0/2] kbuild: add AFLAGS_REMOVE
Date: Sat, 21 Nov 2015 11:59:57 +0100
Message-Id: <1448103599-6660-1-git-send-email-heiko.carstens@de.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

Hi Michal,

these are just two simple patches which add
1) an AFLAGS_REMOVE option which works just like CFLAGS_REMOVE and
2) one user of it in s390 code.

If you agree this is ok, then these two patches could go upstream either
via your tree or the s390 tree.

Thanks,
Heiko

Heiko Carstens (2):
  kbuild: add AFLAGS_REMOVE_(basename).o option
  s390: compile head.s always with -march=z900

 arch/s390/kernel/Makefile | 6 ++++--
 scripts/Makefile.lib      | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.3.9


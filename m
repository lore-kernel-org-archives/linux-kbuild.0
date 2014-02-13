Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:56045 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752760AbaBMM5H (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Feb 2014 07:57:07 -0500
Received: from tacticalops.localnet ([95.112.149.120]) by smtp.web.de
 (mrweb003) with ESMTPSA (Nemesis) id 0MDPI5-1VxltN2dJN-00Gp6u for
 <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2014 13:57:05 +0100
From: Martin Walch <walch.martin@web.de>
Subject: [PATCH 0/2] kconfig: Remove bad inference rules expr_eliminate_dups2()
Date: Thu, 13 Feb 2014 13:57:03 +0100
Message-ID: <2015312.oM82sdiqfh@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Martin Walch <walch.martin@web.de>
Date: Thu, 13 Feb 2014 12:22:18 +0100
Subject: [PATCH 0/2] kconfig: Remove bad inference rules expr_eliminate_dups2()

PATCH 1: Removes expr_eliminate_dups2() and other related code.
This does not seem to actually affect the behaviour when using Kconfig files
from the mainline kernel. But there is a slight possibility that there are
configuration files in other branches or in other projects that use the Linux
Kernel configuration system that may be affected or may even rely on the
behaviour. So, there is a small chance to break something somewhere (on the
other hand, there is also a small chance to fix something somewhere). Maybe
some warning should be documented in case this patch gets accepted?

PATCH 2: Fix some comments when touching expr.c anyway. No code changes.

Martin Walch (2):
  kconfig: completely remove expr_eliminate_dups2() and related code
  kconfig: trivial - adjust comments

 scripts/kconfig/expr.c | 112 +------------------------------------------------
 scripts/kconfig/expr.h |   3 --
 2 files changed, 2 insertions(+), 113 deletions(-)

-- 
1.8.3.2



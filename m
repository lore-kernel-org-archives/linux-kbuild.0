Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:56321 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161026AbaDRVkr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Apr 2014 17:40:47 -0400
From: Martin Walch <walch.martin@web.de>
Subject: [PATCH v2 0/2] kconfig: Remove bad inference rules expr_eliminate_dups2()
Date: Fri, 18 Apr 2014 23:33:55 +0200
Message-ID: <6889353.LzkExyTh9u@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

So far, I have not seen any answers to the first version of this patch.
Accordingly, v2 contains only few changes.

PATCH 1: Remove expr_eliminate_dups2() and other related code.
This does not seem to actually affect the behaviour when using Kconfig files
from the mainline kernel. But there is a slight possibility that there are
configuration files in other branches or in other projects that use the Linux
Kernel configuration system that may be affected or may even rely on the
behaviour. So, there is a small chance to break something somewhere (on the
other hand, there is also a small chance to fix something somewhere). Maybe
some warning should be documented in case this patch gets accepted?
v2 updates line numbers after latest changes

PATCH 2: Fix some comments when touching expr.c anyway. No code changes.
v2 additionally converts C99 style comments to traditional ones.

Martin Walch (2):
  kconfig: completely remove expr_eliminate_dups2() and related code
  kconfig: trivial - adjust comments

 scripts/kconfig/expr.c | 146 +++++++------------------------------------------
 scripts/kconfig/expr.h |   3 -
 2 files changed, 19 insertions(+), 130 deletions(-)

-- 
1.8.3.2


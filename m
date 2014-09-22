Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:53361 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754213AbaIVROC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Sep 2014 13:14:02 -0400
From: Martin Walch <walch.martin@web.de>
Subject: [Resending PATCH v2 0/2] kconfig: fix bad syntactic transformation
Date: Mon, 22 Sep 2014 19:13:17 +0200
Message-Id: <1411405999-20212-1-git-send-email-walch.martin@web.de>
In-Reply-To: <3491939.FtiyjGE4Of@tacticalops>
References: <3491939.FtiyjGE4Of@tacticalops>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Walch <walch.martin@web.de>

PATCH 1: Remove these two not semantics preserving inference rules:

(FOO || BAR) && (!FOO && !BAR) -> n
(FOO && BAR) || (!FOO || !BAR) -> y

When applied, they silently alter the meaning of symbol dependencies.

PATCH 2: When touching expr.c anyway, fix some comments and convert C99 style
comments to traditional ones.

Martin Walch (2):
  kconfig: fix bad syntactic transformation in expr.c
  kconfig: trivial - adjust comments

 scripts/kconfig/expr.c | 146 +++++++------------------------------------------
 scripts/kconfig/expr.h |   3 -
 2 files changed, 19 insertions(+), 130 deletions(-)

-- 
1.8.5.5


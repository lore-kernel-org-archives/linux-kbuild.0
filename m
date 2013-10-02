Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:57308 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752122Ab3JBFYQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Oct 2013 01:24:16 -0400
Received: from tacticalops.localnet ([93.132.133.153]) by smtp.web.de
 (mrweb103) with ESMTPSA (Nemesis) id 0MC1nQ-1Va0LO0scK-008v9G for
 <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2013 07:24:14 +0200
From: Martin Walch <walch.martin@web.de>
Subject: [PATCH 0/4]kconfig: minor cleanups and corrections
Date: Wed, 02 Oct 2013 07:24:11 +0200
Message-ID: <2239119.8z7hSRUtxP@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Jiri Kosina <trivial@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Benjamin Poirier <bpoirier@suse.de>, Dirk Gouders <dirk@gouders.net>, Wang YanQing <udknight@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jean Delvare <jdelvare@suse.de>, Kees Cook <keescook@chromium.org>, Alan Cox <alan@linux.intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

these are some simple fixes to correct minor things I came across while reading the code.

Martin Walch (4):
  kconfig: add short explanation to SYMBOL_WRITE
  kconfig: trivial: fix typos in comments
  kconfig: adjust warning message for conflicting types
  kconfig: remove unused definition from scanner

 scripts/kconfig/expr.h   | 2 +-
 scripts/kconfig/mconf.c  | 2 +-
 scripts/kconfig/menu.c   | 4 ++--
 scripts/kconfig/symbol.c | 2 +-
 scripts/kconfig/zconf.l  | 1 -
 5 files changed, 5 insertions(+), 6 deletions(-)

-- 
1.8.1.5


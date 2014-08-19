Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:52656 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752680AbaHSHeu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Aug 2014 03:34:50 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 0/4] kbuild: Fix the dependency handling of multi-objs targets
Date: Tue, 19 Aug 2014 16:34:19 +0900
Message-Id: <1408433663-17435-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>


1/4 and 2/4 fix the core scripts.

3/4 and 4/4 refactors scripts/kconfig/Makefile based on 2/4.



Masahiro Yamada (4):
  kbuild: handle multi-objs dependency appropriately
  kbuild: handle the dependency of multi-objs hostprogs appropriately
  kbuild: refactor script/kconfig/Makefile
  kbuild: remove redundant clean-files from scripts/kconfig/Makefile

 scripts/Makefile.build   | 10 ++++------
 scripts/Makefile.host    |  6 ++++--
 scripts/Makefile.lib     |  9 +++++++++
 scripts/kconfig/Makefile | 35 +++--------------------------------
 4 files changed, 20 insertions(+), 40 deletions(-)

-- 
1.9.1


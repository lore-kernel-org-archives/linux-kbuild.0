Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:57519 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751810AbbCMGWW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 02:22:22 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/6] kbuild: mergeconfig: fix bugs, improve readability, and add generic entry point
Date: Fri, 13 Mar 2015 15:21:37 +0900
Message-Id: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Josh Boyer <jwboyer@redhat.com>, Darren Hart <dvhart@linux.intel.com>, john stultz <johnstul@us.ibm.com>, Michal Marek <mmarek@suse.cz>, Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>


This series is related to mergeconfig (scripts/kconfig/merge_config.sh):

1/6 and 2/6 fix bugs related to the parallel build. (-j option).
3/6 thru 5/6 are minor clean-ups.
6/6 is a new feature; add a generic entry point of mergeconfig.

The last one is RFC.

Masahiro Yamada (6):
  kbuild: mergeconfig: fix "jobserver unavailable" warning
  kbuild: mergeconfig: move an error check to merge_config.sh
  kbuild: mergeconfig: remove redundant $(objtree)
  merge_config.sh: improve indentation
  merge_config.sh: rename MAKE to RUNMAKE
  kbuild: add generic mergeconfig target, %.config

 scripts/kconfig/Makefile        | 20 +++++++++-----------
 scripts/kconfig/merge_config.sh | 25 ++++++++++++++-----------
 2 files changed, 23 insertions(+), 22 deletions(-)

-- 
1.9.1


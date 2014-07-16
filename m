Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:41332 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759145AbaGPHMi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 03:12:38 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v3 0/5] kbuild: Clean-up and bug fixes of scripts/Makefile.host
Date: Wed, 16 Jul 2014 16:12:18 +0900
Message-Id: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Masahiro Yamada <yamada.m@jp.panasonic.com>



Masahiro Yamada (5):
  kbuild: fix a typo in scripts/Makefile.host
  kbuild: fix a bug of C++ host program handling
  kbuild: drop shared library support from Makefile.host
  kbuild: clean up scripts/Makefile.host
  kbuild: clean-up and bug fix of scripts/Makefile.host

 Documentation/kbuild/makefiles.txt | 39 +++++-------------------
 scripts/Makefile.host              | 61 ++++++--------------------------------
 2 files changed, 17 insertions(+), 83 deletions(-)

-- 
1.9.1


Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:49931 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750741AbaFIEaQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 00:30:16 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2 0/5] kbuild: Clean-up and bug fixes of scripts/Makefile.host
Date: Mon,  9 Jun 2014 13:16:29 +0900
Message-Id: <1402287394-31133-1-git-send-email-yamada.m@jp.panasonic.com>
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

 scripts/Makefile.host | 62 +++++++++------------------------------------------
 1 file changed, 10 insertions(+), 52 deletions(-)

-- 
1.9.1


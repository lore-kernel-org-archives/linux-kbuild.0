Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef010-v.nifty.com ([210.131.4.247]:41469 "EHLO
	condef010-v.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751053AbbGXFVv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Jul 2015 01:21:51 -0400
Received: from conuserg010-v.nifty.com ([10.16.229.197])by condef010-v.nifty.com with ESMTP id t6O5JNR2011022
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Jul 2015 14:19:23 +0900
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] kbuild: Minor cleanups of fixdep
Date: Fri, 24 Jul 2015 14:18:44 +0900
Message-Id: <1437715126-6421-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org




Masahiro Yamada (2):
  kbuild: fixdep: optimize code slightly
  kbuild: fixdep: drop meaningless hash table initialization

 scripts/basic/fixdep.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

-- 
1.9.1


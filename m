Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:41691 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751419AbaFFBbM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Jun 2014 21:31:12 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile14) with ESMTP id s561VADA022506
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili11) with ESMTP id s561VAR21775
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 0/5] kbuild: Clean-up and bug fixes of scripts/Makefile.host
Date: Fri,  6 Jun 2014 10:30:58 +0900
Message-Id: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>


Masahiro Yamada (5):
  kbuild: fix a typo in scripts/Makefile.host
  kbuild: fix a bug of C++ host program handling
  kbuild: clean up scripts/Makefile.host
  kbuild: clean-up and bug fix of scripts/Makefile.host
  kbuild: create directory of .o files from shlib-objs notation

 scripts/Makefile.host | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

-- 
1.9.1


Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:53617 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753868AbaFICRI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2014 22:17:08 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2 0/7] scripts: objdiff: various clean-up, fix and new features
Date: Mon,  9 Jun 2014 11:16:33 +0900
Message-Id: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Masahiro Yamada <yamada.m@jp.panasonic.com>



Masahiro Yamada (7):
  scripts: objdiff: get the path to .tmp_objdiff more simply
  scripts: objdiff: direct error messages to stderr
  scripts: objdiff: remove unnecessary code
  scripts: objdiff: improve path flexibility for record command
  scripts: objdiff: change the extension of disassembly from .o to .dis
  scripts: objdiff: fix a comment
  scripts: objdiff: support directories for the augument of record
    command

 scripts/objdiff | 74 +++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 46 insertions(+), 28 deletions(-)

-- 
1.9.1


Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:53313 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751919AbaE3LME (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 May 2014 07:12:04 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 0/7] scripts: objdiff: various clean-up, fix and new features
Date: Fri, 30 May 2014 20:11:48 +0900
Message-Id: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, Jason Cooper <jason@lakedaemon.net>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>

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


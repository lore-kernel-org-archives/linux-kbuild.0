Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52877 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752831AbZLXLNH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Dec 2009 06:13:07 -0500
Date: Thu, 24 Dec 2009 22:13:04 +1100
From: Simon Horman <horms@verge.net.au>
Subject: [patch] Makefile: Unexport LANG
Message-ID: <20091224111300.GA31932@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <mmarek@sues.cz>, Roland Dreier <rdreier@cisco.com>, Sam Ravnborg <sam@ravnborg.org>, Masami Hiramatsu <mhiramat@redhat.com>

The recent changes to setting and unexport various LC_ variables
produces a problem on my system (Debian sid).

$ locale
LANG=ja_JP.utf8
LANGUAGE=ja_JP.utf8
LC_CTYPE="ja_JP.utf8"
LC_NUMERIC="ja_JP.utf8"
LC_TIME="ja_JP.utf8"
LC_COLLATE="ja_JP.utf8"
LC_MONETARY="ja_JP.utf8"
LC_MESSAGES="ja_JP.utf8"
LC_PAPER="ja_JP.utf8"
LC_NAME="ja_JP.utf8"
LC_ADDRESS="ja_JP.utf8"
LC_TELEPHONE="ja_JP.utf8"
LC_MEASUREMENT="ja_JP.utf8"
LC_IDENTIFICATION="ja_JP.utf8"
LC_ALL=ja_JP.utf8

Without this patch:
$ make
make[2]: ??: ?? make ? -jN ?????????: jobserver ??????????.
make[2]: ??: ?? make ? -jN ?????????: jobserver ??????????.

With this patch:
$ make
...
make[2]: warning: -jN forced in submake: disabling jobserver mode.
make[2]: warning: -jN forced in submake: disabling jobserver mode.
...

Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Michal Marek <mmarek@sues.cz>
Cc: Roland Dreier <rdreier@cisco.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Masami Hiramatsu <mhiramat@redhat.com>
Signed-off-by: Simon Horman <horms@verge.net.au>

Index: linux-2.6/Makefile
===================================================================
--- linux-2.6.orig/Makefile	2009-12-24 22:09:29.000000000 +1100
+++ linux-2.6/Makefile	2009-12-24 22:10:58.000000000 +1100
@@ -17,6 +17,7 @@ NAME = Man-Eating Seals of Antiquity
 MAKEFLAGS += -rR --no-print-directory
 
 # Avoid funny character set dependencies
+unexport LANG
 unexport LC_ALL
 LC_CTYPE=C
 LC_COLLATE=C

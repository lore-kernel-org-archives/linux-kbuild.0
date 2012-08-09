Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:46827 "EHLO
	viridian.itc.Virginia.EDU" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755487Ab2HINcY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Aug 2012 09:32:24 -0400
From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 0/4] minor changes to kconfig/streamline_config.pl
Date: Thu,  9 Aug 2012 09:23:19 -0400
Message-Id: <1344518603-19508-1-git-send-email-wfp5p@virginia.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: rostedt@goodmis.org

All of these are changes to streamline_config.pl

The first one fixes a warning message that perl emits when running the
script.  It also has the the side effect of fixing a bug.

The second two convert the open calls to use the 3 parameter open that
is now preferred in modern perl.

The last one is a simple fix to make perlcritic happy.

Bill Pemberton (4):
  localmodconfig: set default value for ksource in streamline_config.pl
  localmodconfig: rework find_config in streamline_config.pl
  localmodconfig: use 3 parameter open in streamline_config.pl
  localmodconfig: use my variable for loop in streamline_config.pl

 scripts/kconfig/streamline_config.pl | 48 +++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

-- 
1.7.11.3


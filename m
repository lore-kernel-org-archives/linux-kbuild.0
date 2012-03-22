Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e31.co.us.ibm.com ([32.97.110.149]:55980 "EHLO
	e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758318Ab2CVWGo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Mar 2012 18:06:44 -0400
Received: from /spool/local
	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <jstultz@us.ibm.com>;
	Thu, 22 Mar 2012 16:06:44 -0600
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com [9.17.195.228])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 967A03E40048
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Mar 2012 16:06:07 -0600 (MDT)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q2MM62mw159922
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Mar 2012 16:06:03 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q2MM5uFN006451
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Mar 2012 16:05:57 -0600
From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 0/2] merge_config.sh updates for 3.4?
Date: Thu, 22 Mar 2012 15:05:47 -0700
Message-Id: <1332453949-5872-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: John Stultz <john.stultz@linaro.org>, Michal Marek <mmarek@suse.cz>, Bruce.Ashfield@windriver.com, Darren Hart <dvhart@linux.intel.com>

Hey Michal,
	Just wanted to send you a few small updates
for the merge_config.sh script.

Let me know if these look ok for 3.4, or if you'd like to
defer them for later.

thanks
-john


CC: Michal Marek <mmarek@suse.cz>
CC: Bruce.Ashfield@windriver.com
CC: Darren Hart <dvhart@linux.intel.com>

John Stultz (2):
  merge_config.sh: Set execute bit
  merge_config.sh: Add option to display redundant configs

 scripts/kconfig/merge_config.sh |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 scripts/kconfig/merge_config.sh

-- 
1.7.3.2.146.gca209


Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e3.ny.us.ibm.com ([32.97.182.143]:48667 "EHLO e3.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756718Ab2CVWF5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Mar 2012 18:05:57 -0400
Received: from /spool/local
	by e3.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <jstultz@us.ibm.com>;
	Thu, 22 Mar 2012 18:05:56 -0400
Received: from d01relay06.pok.ibm.com (d01relay06.pok.ibm.com [9.56.227.116])
	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 013116E8053
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Mar 2012 18:05:54 -0400 (EDT)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay06.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q2MM5rDk3014894
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Mar 2012 18:05:53 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q2MM5rfL030560
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Mar 2012 18:05:53 -0400
From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 1/2] merge_config.sh: Set execute bit
Date: Thu, 22 Mar 2012 15:05:48 -0700
Message-Id: <1332453949-5872-2-git-send-email-john.stultz@linaro.org>
In-Reply-To: <1332453949-5872-1-git-send-email-john.stultz@linaro.org>
References: <1332453949-5872-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: John Stultz <john.stultz@linaro.org>, Michal Marek <mmarek@suse.cz>, Bruce.Ashfield@windriver.com, Darren Hart <dvhart@linux.intel.com>

Somehow the merge_config.sh script didn't get its execute bit
set when it was merged. Fix this.

CC: Michal Marek <mmarek@suse.cz>
CC: Bruce.Ashfield@windriver.com
CC: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 scripts/kconfig/merge_config.sh

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
old mode 100644
new mode 100755
-- 
1.7.3.2.146.gca209


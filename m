Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:45634 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751870AbYLZHtB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Dec 2008 02:49:01 -0500
Subject: add a piece of code to each module
From: Shaohua Li <shaohua.li@intel.com>
Content-Type: text/plain
Date: Fri, 26 Dec 2008 15:48:59 +0800
Message-Id: <1230277739.4780.9.camel@sli10-desk.sh.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org

Hi,
I'm now porting dyn ftrace to IA64. To make modules work, I must add a
piece of code (trampoline code) to each module. I can't add the
trampoline code in module load, because at that time, only PLT
trampoline code can be added, and that code isn't ok for ftrace. I
wonder if this can be done in kbuild. If yes, how can I do it?

Thanks,
Shaohua


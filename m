Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:51161 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752117Ab0HSQvO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Aug 2010 12:51:14 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2010 09:51:02 -0700
Date: Thu, 19 Aug 2010 09:51:02 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: xconfig oddity
Message-Id: <20100819095102.f418cd9c.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

In xconfig, when I enable (on menu) Option/Show Debug Info,
the symbol's help/symbol info box (window) often says:

type: tristate
unknown property: symbol
^^^^^^^^^^^^^^^^^^^^^^^^

Is this expected?  (not by me)

thnx,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

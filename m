Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:44454 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753699Ab2EHSWw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 May 2012 14:22:52 -0400
From: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Subject: [PATCH 00/23] x86, realmode: new infrastructure for realmode code
Date: Tue,  8 May 2012 21:22:23 +0300
Message-Id: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Joseph Cihula <joseph.cihula@intel.com>, Shane Wang <shane.wang@intel.com>, hpa@linux.intel.com, Jarkko Sakkinen <jarkko.sakkinen@intel.com>

I've been working together with H. Peter Anvin in order
replace the ad-hoc real-mode code inside .x86_trampoline
section with an encapsulated binary that is fully relocatable
to any memory location under 1MB. Everything that is needs to
be relocated is relocated during initialization.

Benefits:
- Simplifies things. Real-mode code does not have to find its
own location any more. This makes maintaining and extending 
this code much nicer experience.
- Cleans up code base a lot. Now real-mode code is encapsulated
from kernel both in source tree and in vmlinux.
- We can set proper permissions to pages of text, data/bss
and rodata. Before, .x86_trampoline had just rwx permissions.

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:59071 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S933390Ab1ERSHV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 May 2011 14:07:21 -0400
Received: from static-50-53-38-135.bvtn.or.frontiernet.net ([50.53.38.135] helo=chimera.site)
	by box742.bluehost.com with esmtpa (Exim 4.69)
	(envelope-from <rdunlap@xenotime.net>)
	id 1QMl9S-00082H-Ep
	for linux-kbuild@vger.kernel.org; Wed, 18 May 2011 12:07:18 -0600
Date: Wed, 18 May 2011 11:07:16 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: kconfig dependencies question
Message-Id: <20110518110716.464ab10b.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


I see some builds that have this kconfig warning:

warning: (IA32_EMULATION) selects COMPAT_BINFMT_ELF which has unmet direct dependencies (COMPAT && BINFMT_ELF)

so I was trying to fix it.  We have:

IA32_EMULATION selects COMPAT_BINFMT_ELF
COMPAT_BINFMT_ELF depends on COMPAT && BINFMT_ELF
COMPAT depends on IA32_EMULATION

Is this not circular?  or is it just almost circular?  or am I just
confuzed?

Suggestions?

thanks,
---
~Randy

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:36761 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1756284Ab0KVEqI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 21 Nov 2010 23:46:08 -0500
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Sun, 21 Nov 2010 20:46:00 -0800
Date: Sun, 21 Nov 2010 20:46:00 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: scripted kconfig replies?
Message-Id: <20101121204600.83bfd043.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I'd like to be able to write a script that handles 'make oldconfig'
queries for unknown kconfig symbols.  The script would take options
like:  set all tristate prompts to one of y/m/n, set all boolean prompts
to one of y/n.  (and just use defaults for numeric or string symbols)

This would allow me to automate some kernel configs.  I don't think
that kconfig itself is the right place for this feature.

Should this be doable?  Can anyone give me a pointer of what to use,
where to begin?


thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

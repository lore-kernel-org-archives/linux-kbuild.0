Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60509 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759704AbaGRIYS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Jul 2014 04:24:18 -0400
Message-ID: <53C8D9AE.8030902@suse.cz>
Date: Fri, 18 Jul 2014 10:24:14 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: allow to override Python command name
References: <1405658411-27346-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1405658411-27346-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: linux-ia64@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, linux-kernel@vger.kernel.org

Dne 18.7.2014 06:40, Masahiro Yamada napsal(a):
> The specification of Python 3 is largely different from that of
> Python 2.
> 
> For example, arch/ia64/scripts/unwcheck.py seems to be written
> in Python 2, not compatible with Python 3.
> 
> It is not a good idea to invoke python scripts with the hard-coded
> command name 'python'. The command 'python' could possibly be
> Python 3 on some systems.
> For that case, it is reasonable to allow to override the command name
> by giving 'PYTHON=python2' from the command line.
> 
> The 'python' in arch/ia64/Makefile should be replaced with '$(PYTHON)'.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: linux-ia64@vger.kernel.org

Thanks, applied to kbuild.git#kbuild.

Michal


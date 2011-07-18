Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47122 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751670Ab1GRO3u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2011 10:29:50 -0400
Date: Mon, 18 Jul 2011 16:29:47 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kconfig: fix missing "0x" prefix from S_HEX symbol in
 autoconf.h
Message-ID: <20110718142947.GA4482@sepie.suse.cz>
References: <1310671867-5107-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1310671867-5107-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Mauro Carvalho Chehab <mchehab@infradead.org>

On Thu, Jul 14, 2011 at 03:31:07PM -0400, Arnaud Lacombe wrote:
> The specialized printer for headers (espectially autoconf.h) is missing fixup
> code for S_HEX symbol's "0x" prefix. As long as kconfig does not warn for such
> missing prefix, this code is needed. Fix this.
> 
> In the same time, fix some nits in `header_print_symbol()'.
> 
> Cc: Randy Dunlap <rdunlap@xenotime.net>
> Cc: Mauro Carvalho Chehab <mchehab@infradead.org>
> 
> Broken-by: Arnaud Lacombe <lacombar@gmail.com>
> (Somehow-)Reported-by: Randy Dunlap <rdunlap@xenotime.net>
> Reported-by: Mauro Carvalho Chehab <mchehab@infradead.org>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

Thanks, applied kbuild-2.6.git#kconfig. It did actually compare the
kconfig generated files after your previous patch, but I only compared
defconfig and it didn't trigger this bug.

Michal

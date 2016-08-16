Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58468 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753396AbcHPIey (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2016 04:34:54 -0400
Subject: Re: [PATCH] builddeb: Skip gcc-plugins when not configured
References: <20160815173622.GA24820@www.outflux.net>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57B2D021.9010402@suse.com>
Date: Tue, 16 Aug 2016 10:34:41 +0200
MIME-Version: 1.0
In-Reply-To: <20160815173622.GA24820@www.outflux.net>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Frank Paulsen <frobnic+lkml@gmail.com>, Christian Kujau <lists@nerdbynature.de>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Dne 15.8.2016 v 19:36 Kees Cook napsal(a):
> When attempting to build a Debian kernel package, the "scripts/gcc-plugins"
> directory does not exist in the output tree unless CONFIG_GCC_PLUGINS=y.
> To avoid errors when not defined, this wraps the failing "find" in a config
> test.
> 
> Reported-by: Frank Paulsen <frobnic+lkml@gmail.com>
> Tested-by: Christian Kujau <lists@nerdbynature.de>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> This should go into v4.8...

Applied to kbuild.git#rc-fixes.

Thanks,
Michal


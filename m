Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42607 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751601AbcGRUOl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2016 16:14:41 -0400
Date: Mon, 18 Jul 2016 22:14:39 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH v2 05/11] Kbuild: don't add obj tree in additional
 includes
Message-ID: <20160718201439.GA9053@sepie.suse.cz>
References: <20160615154553.3177021-1-arnd@arndb.de>
 <20160615154553.3177021-6-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160615154553.3177021-6-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Jun 15, 2016 at 05:45:47PM +0200, Arnd Bergmann wrote:
> When building with separate object directories and driver specific
> Makefiles that add additional header include paths, Kbuild adjusts
> the gcc flags so that we include both the directory in the source
> tree and in the object tree.
> 
> However, due to another bug I fixed earlier, this did not actually
> include the correct directory in the object tree, so we know that
> we only really need the source tree here. Also, including the
> object tree sometimes causes warnings about nonexisting directories
> when the include path only exists in the source.
> 
> This changes the logic to only emit the -I argument for the srctree,
> not for objects. We still need both $(srctree)/$(src) and $(obj)
> though, so I'm adding them manually.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

I applied the series up to this patch to kbuild.git#kbuild. The rest
seem to be related but not dependent patches, so I'll leave it up to the
respective maintainers to pick them up. Is that OK with you?

Thanks,
Michal

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38770 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751975AbcFUOPt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Jun 2016 10:15:49 -0400
Date: Tue, 21 Jun 2016 05:58:07 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 2/4] Add the latent_entropy gcc plugin
Message-ID: <20160621125807.GA19065@infradead.org>
References: <20160620203910.a8b6b5b10d18f24661916e7b@gmail.com>
 <20160620204119.6299c961570a7a9ad6cbdd51@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160620204119.6299c961570a7a9ad6cbdd51@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emese Revfy <re.emese@gmail.com>
Cc: kernel-hardening@lists.openwall.com, pageexec@freemail.hu, spender@grsecurity.net, mmarek@suse.com, keescook@chromium.org, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, tytso@mit.edu, akpm@linux-foundation.org, linux-mm@kvack.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, paulmck@linux.vnet.ibm.com, mingo@redhat.com, tglx@linutronix.de, bart.vanassche@sandisk.com, davem@davemloft.net

On Mon, Jun 20, 2016 at 08:41:19PM +0200, Emese Revfy wrote:
> --- /dev/null
> +++ b/scripts/gcc-plugins/latent_entropy_plugin.c
> @@ -0,0 +1,639 @@
> +/*
> + * Copyright 2012-2016 by the PaX Team <pageexec@freemail.hu>
> + * Copyright 2016 by Emese Revfy <re.emese@gmail.com>
> + * Licensed under the GPL v2
> + *
> + * Note: the choice of the license means that the compilation process is
> + *       NOT 'eligible' as defined by gcc's library exception to the GPL v3,
> + *       but for the kernel it doesn't matter since it doesn't link against
> + *       any of the gcc libraries

I remember we used to have architectures that actually linked against
libgcc.  Isn't that the case anymore?

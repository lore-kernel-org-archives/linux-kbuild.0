Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:35151 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751922AbcFUQNz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Jun 2016 12:13:55 -0400
Received: by mail-lb0-f170.google.com with SMTP id o4so14434817lbp.2
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jun 2016 09:13:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160621125807.GA19065@infradead.org>
References: <20160620203910.a8b6b5b10d18f24661916e7b@gmail.com>
 <20160620204119.6299c961570a7a9ad6cbdd51@gmail.com> <20160621125807.GA19065@infradead.org>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 21 Jun 2016 09:13:52 -0700
Message-ID: <CAGXu5jJ+seDJgknrFTNVw8A3CuVkjnKH6LFfti5zyJgFTM2q+A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] Add the latent_entropy gcc plugin
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Emese Revfy <re.emese@gmail.com>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>, Paul McKenney <paulmck@linux.vnet.ibm.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, bart.vanassche@sandisk.com, "David S. Miller" <davem@davemloft.net>

On Tue, Jun 21, 2016 at 5:58 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Jun 20, 2016 at 08:41:19PM +0200, Emese Revfy wrote:
>> --- /dev/null
>> +++ b/scripts/gcc-plugins/latent_entropy_plugin.c
>> @@ -0,0 +1,639 @@
>> +/*
>> + * Copyright 2012-2016 by the PaX Team <pageexec@freemail.hu>
>> + * Copyright 2016 by Emese Revfy <re.emese@gmail.com>
>> + * Licensed under the GPL v2
>> + *
>> + * Note: the choice of the license means that the compilation process is
>> + *       NOT 'eligible' as defined by gcc's library exception to the GPL v3,
>> + *       but for the kernel it doesn't matter since it doesn't link against
>> + *       any of the gcc libraries
>
> I remember we used to have architectures that actually linked against
> libgcc.  Isn't that the case anymore?

There are a few, but they don't (and won't) select HAVE_GCC_PLUGINS.

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security

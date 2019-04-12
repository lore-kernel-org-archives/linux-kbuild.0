Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40666 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726987AbfDLJCl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Apr 2019 05:02:41 -0400
Date: Fri, 12 Apr 2019 11:02:37 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v3 3/9] livepatch: Add klp-convert tool
In-Reply-To: <20190410182220.GB13083@redhat.com>
Message-ID: <alpine.LSU.2.21.1904121101220.773@pobox.suse.cz>
References: <20190410155058.9437-1-joe.lawrence@redhat.com> <20190410155058.9437-4-joe.lawrence@redhat.com> <20190410182220.GB13083@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On Wed, 10 Apr 2019, Joe Lawrence wrote:

> On Wed, Apr 10, 2019 at 11:50:52AM -0400, Joe Lawrence wrote:
> >
> > [ ... snip ... ]
> >
> > diff --git a/scripts/livepatch/klp-convert.c b/scripts/livepatch/klp-convert.c
> > new file mode 100644
> > index 000000000000..62bd26941081
> > --- /dev/null
> > +++ b/scripts/livepatch/klp-convert.c
> > 
> > [ ... snip ... ]
> >
> > +	if (argc != 4) {
> > +		WARN("Usage: %s <Symbols.list> <input.ko> <out.ko>", argv[0]);
>                                                ^^^^^^^^^^
> nit: since we're using .klp.o prefix, should this be "input.klp.o"

I'd leave input.ko there. It is clear then that it is an ordinary kernel 
module and nothing special, but it is up to you.

I would change out.ko to output.ko for consistency.

Miroslav

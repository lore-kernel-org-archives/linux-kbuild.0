Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43704 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727583AbfDJSWX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Apr 2019 14:22:23 -0400
Date: Wed, 10 Apr 2019 14:22:20 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v3 3/9] livepatch: Add klp-convert tool
Message-ID: <20190410182220.GB13083@redhat.com>
References: <20190410155058.9437-1-joe.lawrence@redhat.com>
 <20190410155058.9437-4-joe.lawrence@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190410155058.9437-4-joe.lawrence@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Miroslav Benes <mbenes@suse.cz>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On Wed, Apr 10, 2019 at 11:50:52AM -0400, Joe Lawrence wrote:
>
> [ ... snip ... ]
>
> diff --git a/scripts/livepatch/klp-convert.c b/scripts/livepatch/klp-convert.c
> new file mode 100644
> index 000000000000..62bd26941081
> --- /dev/null
> +++ b/scripts/livepatch/klp-convert.c
> 
> [ ... snip ... ]
>
> +	if (argc != 4) {
> +		WARN("Usage: %s <Symbols.list> <input.ko> <out.ko>", argv[0]);
                                               ^^^^^^^^^^
nit: since we're using .klp.o prefix, should this be "input.klp.o"

-- Joe

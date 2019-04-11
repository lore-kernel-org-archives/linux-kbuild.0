Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55852 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726588AbfDKTEE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 15:04:04 -0400
Date: Thu, 11 Apr 2019 21:04:01 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v3 2/9] kbuild: Support for Symbols.list creation
In-Reply-To: <20190410155058.9437-3-joe.lawrence@redhat.com>
Message-ID: <alpine.LSU.2.21.1904112100400.18787@pobox.suse.cz>
References: <20190410155058.9437-1-joe.lawrence@redhat.com> <20190410155058.9437-3-joe.lawrence@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>


> diff --git a/samples/livepatch/Makefile b/samples/livepatch/Makefile
> index 2472ce39a18d..8b9b42a258ad 100644
> --- a/samples/livepatch/Makefile
> +++ b/samples/livepatch/Makefile
> @@ -1,3 +1,4 @@
> +LIVEPATCH_livepatch-sample := y
>  obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-sample.o
>  obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-shadow-mod.o
>  obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-shadow-fix1.o

We discussed this and I think there has been no conclusion yet. Shouldn't 
we do the same (add LIVEPATCH_) for the other samples here as well? So 
they are not picked up by cmd_klp_map and their symbols stored in 
Symbols.list?

Miroslav

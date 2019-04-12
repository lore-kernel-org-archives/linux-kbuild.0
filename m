Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43452 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726384AbfDLKni (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Apr 2019 06:43:38 -0400
Date: Fri, 12 Apr 2019 12:43:33 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v3 6/9] modpost: Add modinfo flag to livepatch modules
In-Reply-To: <20190410155058.9437-7-joe.lawrence@redhat.com>
Message-ID: <alpine.LSU.2.21.1904121236220.773@pobox.suse.cz>
References: <20190410155058.9437-1-joe.lawrence@redhat.com> <20190410155058.9437-7-joe.lawrence@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>


> diff --git a/samples/livepatch/Makefile b/samples/livepatch/Makefile
> index 8b9b42a258ad..5fb3280bbdc4 100644
> --- a/samples/livepatch/Makefile
> +++ b/samples/livepatch/Makefile
> @@ -1,4 +1,8 @@
>  LIVEPATCH_livepatch-sample := y
> +LIVEPATCH_livepatch-shadow-fix1 := y
> +LIVEPATCH_livepatch-shadow-fix2 := y
> +LIVEPATCH_livepatch-callbacks-demo := y

You could also remove MODULE_INFO(livepatch, "Y") from the three files.

Miroslav

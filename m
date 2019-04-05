Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56856 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729785AbfDEIdp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Apr 2019 04:33:45 -0400
Date: Fri, 5 Apr 2019 10:33:43 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v2] kbuild: use -flive-patching when CONFIG_LIVEPATCH is
 enabled
In-Reply-To: <20190404201855.xtvtgxaaomcmowrt@treble>
Message-ID: <alpine.LSU.2.21.1904051028480.13155@pobox.suse.cz>
References: <20190404184411.1392-1-mbenes@suse.cz> <20190404201855.xtvtgxaaomcmowrt@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, pmladek@suse.com, jikos@kernel.org, joe.lawrence@redhat.com, ggherdovich@suse.cz, linux-kbuild@vger.kernel.org, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org


> While we're on the subject, I'm glad to see ongoing activity on
> klp-convert (though I haven't had a chance to follow the discussions).
> What's the status of the rest of the needed bits?
> 
> - kgraft-analysis-tool - will this also be submitted for inclusion in
>   the kernel tree?

Yes, it is the next step.
 
> - Documentation about how to create a patch

I know we talked about it, but I don't remember what we came up with. We 
should probably tie to Nicolai's work. It will change the process a lot.

> - The other bits I think Nicolai has been working on to eliminate all
>   the manual steps

Miroslav

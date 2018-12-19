Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36892 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727310AbeLSQ64 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Dec 2018 11:58:56 -0500
Date: Wed, 19 Dec 2018 17:58:53 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] kbuild: use -flive-patching when CONFIG_LIVEPATCH is
 enabled
In-Reply-To: <20181219165428.5udrppedpdvf2u7k@treble>
Message-ID: <nycvar.YFH.7.76.1812191756450.17216@cbobk.fhfr.pm>
References: <20181219141744.32392-1-mbenes@suse.cz> <20181219165428.5udrppedpdvf2u7k@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Miroslav Benes <mbenes@suse.cz>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, jeyu@kernel.org, pmladek@suse.com, linux-kbuild@vger.kernel.org, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 19 Dec 2018, Josh Poimboeuf wrote:

> This option only makes sense for source-based patch generation, so isn't 
> it a bit premature to make this change without proper source-based patch 
> tooling?

The reality is though that before the full-fledged patch tooling exists, 
people are actually already writing livepatches by hand, so this option is 
useful for them.

> Also the commit message needs an analysis of the performance impacts.

Agreed. Especially as it's expected (*) to be completely in the noise 
particularly for the kernel, it'd be good to have that documented in the 
changelog.

(*) actually measured already for some subset of the IPA optimizations

Thanks,

-- 
Jiri Kosina
SUSE Labs

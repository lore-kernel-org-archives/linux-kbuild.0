Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:59688 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726269AbfDDLtR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Apr 2019 07:49:17 -0400
Date: Thu, 4 Apr 2019 13:49:13 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v2 0/8] klp-convert
In-Reply-To: <0580fe97-7882-68c1-54f2-5778f47c5564@redhat.com>
Message-ID: <alpine.LSU.2.21.1904041346350.32428@pobox.suse.cz>
References: <20190301141313.15057-1-jmoreira@suse.de> <20190318191843.GA22702@redhat.com> <3423e586-5ae7-1dd2-8e5f-3930f168143b@suse.de> <0580fe97-7882-68c1-54f2-5778f47c5564@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Joao Moreira <jmoreira@suse.de>, live-patching@vger.kernel.org, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

 
> BTW, something I *just* noticed when putting together that toy out-of-tree
> module to test out multi-object livepatch modules is that we aren't
> considering out-of-tree symbols in Symbols.list.
> 
> Perhaps we can save that for v4 or beyond, but maybe we want to re-arrange the
> klp-convert arguments to "klp-convert <input.ko> <out.ko> <Symbols.list>
> [Symbols.list ...]" where we treat everything after <out.ko> as a symbol list
> file?  (This would assume we would generate a separate out-of-tree module
> Symbols.list file.)    /thinking-out-loud

I understand it could help the testing quite a bit right now, but do we 
care about out-of-tree modules in general?

Miroslav

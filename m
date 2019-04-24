Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51284 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbfDXTXl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Apr 2019 15:23:41 -0400
Date: Wed, 24 Apr 2019 14:23:34 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH v3 0/9] klp-convert livepatch build tooling
Message-ID: <20190424192334.pdtbzpuz2dclsxsg@treble>
References: <20190410155058.9437-1-joe.lawrence@redhat.com>
 <20190417201316.GA690@redhat.com>
 <alpine.LSU.2.21.1904242013310.30239@pobox.suse.cz>
 <bcedf943-6c94-5d23-a637-4f29daf21eda@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bcedf943-6c94-5d23-a637-4f29daf21eda@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joao Moreira <jmoreira@suse.de>
Cc: Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On Wed, Apr 24, 2019 at 04:13:59PM -0300, Joao Moreira wrote:
> > > Future Work
> > > -----------
> > > 
> > > I don't see an easy way to support multiple homonym <object, name>
> > > symbols with unique <position> values in the current livepatch module
> > > Elf format.  The only solutions that come to mind right now include
> > > renaming homonym symbols somehow to retain the relocation->symbol
> > > relationship when separate object files are combined.  Perhaps an
> > > intermediate linker step could make annotated symbols unique in some way
> > > to achieve this.  /thinking out loud
> > 
> > I'd set this aside for now and we can return to it later. I think it could
> > be quite rare in practice.
> > 
> > I was thinking about renaming the symbol too. We can extend the symbol
> > naming convention we have now and deal with it in klp_resolve_symbols(),
> > but maybe Josh will come up with something clever and cleaner.
> 
> I think this could work well, but (sorry if I understood Joe's idea wrongly)
> not as a linker step. Instead of modifying the linker, I think we could
> create another tool and plug it into the kbuild pipeline prior to the
> livepatch module linking. This way, we would parse the .o elf files, check
> for homonyms and rename them based on a convention that is later understood
> by klp-convert, as suggested.
> 
> If I am not missing something, this would fix the case where we have
> homonyms pointing to the same or different positions, without additional
> user intervention other then adding the SYMPOS annotations.
> 
> If you consider this to be useful I can start experiencing.

I tend to agree with Miroslav that it's probably ok to ignore this issue
for now, as long as klp-convert can detect it and spit out an error.  I
assume the patch author could work around it with a kallsyms hack.  If
we encounter it much in the real world then we could figure out a
solution at that point.

-- 
Josh

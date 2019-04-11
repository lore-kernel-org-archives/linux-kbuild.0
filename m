Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40282 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbfDKPsf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 11:48:35 -0400
Date: Thu, 11 Apr 2019 10:48:27 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH v3 1/9] livepatch: Create and include UAPI headers
Message-ID: <20190411154827.v2vkxlc2ecqkxyjv@treble>
References: <20190410155058.9437-1-joe.lawrence@redhat.com>
 <20190410155058.9437-2-joe.lawrence@redhat.com>
 <CAK7LNAQ_=bp0VTOze7ckfXSwFy0m_g6OYPxS5K-ac7jjoutB+A@mail.gmail.com>
 <141bbc68-95a7-3444-08a5-3794b6dc84ce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <141bbc68-95a7-3444-08a5-3794b6dc84ce@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Michael Matz <matz@suse.de>, Miroslav Benes <mbenes@suse.cz>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On Thu, Apr 11, 2019 at 10:30:45AM -0400, Joe Lawrence wrote:
> On 4/10/19 8:32 PM, Masahiro Yamada wrote:
> > On Thu, Apr 11, 2019 at 12:52 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
> > > 
> > > From: Josh Poimboeuf <jpoimboe@redhat.com>
> > > 
> > > Define klp prefixes in include/uapi/linux/livepatch.h, and use them for
> > > replacing hard-coded values in kernel/livepatch/core.c.
> > > 
> > > [ ... snip ... ]
> >>
> > > diff --git a/include/uapi/linux/livepatch.h b/include/uapi/linux/livepatch.h
> > > new file mode 100644
> > > index 000000000000..bb86243de805
> > > --- /dev/null
> > > +++ b/include/uapi/linux/livepatch.h
> > > @@ -0,0 +1,17 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > 
> > 
> > In my understanding, UAPI headers should be licensed under:
> > 
> > /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > 
> > 
> 
> Good eye, that is an interesting licensing detail.  Easy enough to update
> assuming Josh (original author) is fine with adding the modifier.

Sure.

(and sorry, still behind on reviewing the rest of the changes...)

-- 
Josh

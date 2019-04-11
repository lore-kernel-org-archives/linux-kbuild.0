Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49014 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726603AbfDKSl3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 14:41:29 -0400
Date: Thu, 11 Apr 2019 20:41:26 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v3 1/9] livepatch: Create and include UAPI headers
In-Reply-To: <141bbc68-95a7-3444-08a5-3794b6dc84ce@redhat.com>
Message-ID: <alpine.LSU.2.21.1904112039290.18787@pobox.suse.cz>
References: <20190410155058.9437-1-joe.lawrence@redhat.com> <20190410155058.9437-2-joe.lawrence@redhat.com> <CAK7LNAQ_=bp0VTOze7ckfXSwFy0m_g6OYPxS5K-ac7jjoutB+A@mail.gmail.com> <141bbc68-95a7-3444-08a5-3794b6dc84ce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Michael Matz <matz@suse.de>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

> >> +
> >> +/*
> >> + * livepatch.h - Kernel Live Patching Core
> >> + *
> >> + * Copyright (C) 2016 Josh Poimboeuf <jpoimboe@redhat.com>
> >> + */
> >> +
> >> +#ifndef _UAPI_LIVEPATCH_H
> >> +#define _UAPI_LIVEPATCH_H
> >> +
> >> +#include <linux/types.h>
> > 
> > 
> > Why is this include needed?
> > 
> >> +#define KLP_RELA_PREFIX                ".klp.rela."
> >> +#define KLP_SYM_PREFIX         ".klp.sym."
> > 
> > These do not depend on <linux/types.h>
> > 
> 
> Hmmm, types.h has been included since v1, but I just verified that removing it
> results in a clean build, so you are correct that it is (now) unnecessary.

Yes, I mentioned it while reviewing v2. Unfortunately, it seems to get 
lost due to unexplained submitting hiccups. Better to walk through my 
emails again and make sure nothing more falls through the cracks...

Miroslav

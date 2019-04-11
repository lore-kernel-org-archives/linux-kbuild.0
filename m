Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:17163 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfDKAdG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Apr 2019 20:33:06 -0400
MIME-Version: 1.0
References: <20190410155058.9437-1-joe.lawrence@redhat.com> <20190410155058.9437-2-joe.lawrence@redhat.com>
In-Reply-To: <20190410155058.9437-2-joe.lawrence@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 Apr 2019 09:32:21 +0900
Message-ID: <CAK7LNAQ_=bp0VTOze7ckfXSwFy0m_g6OYPxS5K-ac7jjoutB+A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] livepatch: Create and include UAPI headers
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Miroslav Benes <mbenes@suse.cz>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On Thu, Apr 11, 2019 at 12:52 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> From: Josh Poimboeuf <jpoimboe@redhat.com>
>
> Define klp prefixes in include/uapi/linux/livepatch.h, and use them for
> replacing hard-coded values in kernel/livepatch/core.c.
>
> Update MAINTAINERS.
>
> Note: Add defines to uapi as these are also to be used by a newly
> introduced klp-convert script.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Joao Moreira <jmoreira@suse.de>
> Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> ---
>  MAINTAINERS                    |  1 +
>  include/linux/livepatch.h      |  1 +
>  include/uapi/linux/livepatch.h | 17 +++++++++++++++++
>  kernel/livepatch/core.c        |  4 ++--
>  4 files changed, 21 insertions(+), 2 deletions(-)
>  create mode 100644 include/uapi/linux/livepatch.h



> diff --git a/include/uapi/linux/livepatch.h b/include/uapi/linux/livepatch.h
> new file mode 100644
> index 000000000000..bb86243de805
> --- /dev/null
> +++ b/include/uapi/linux/livepatch.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */


In my understanding, UAPI headers should be licensed under:

/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */


> +
> +/*
> + * livepatch.h - Kernel Live Patching Core
> + *
> + * Copyright (C) 2016 Josh Poimboeuf <jpoimboe@redhat.com>
> + */
> +
> +#ifndef _UAPI_LIVEPATCH_H
> +#define _UAPI_LIVEPATCH_H
> +
> +#include <linux/types.h>


Why is this include needed?

> +#define KLP_RELA_PREFIX                ".klp.rela."
> +#define KLP_SYM_PREFIX         ".klp.sym."

These do not depend on <linux/types.h>



> +
> +#endif /* _UAPI_LIVEPATCH_H */



-- 
Best Regards
Masahiro Yamada

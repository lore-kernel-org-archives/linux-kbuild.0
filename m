Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17417 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfHPLgL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Aug 2019 07:36:11 -0400
MIME-Version: 1.0
References: <20190509143859.9050-1-joe.lawrence@redhat.com> <20190509143859.9050-8-joe.lawrence@redhat.com>
In-Reply-To: <20190509143859.9050-8-joe.lawrence@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Aug 2019 20:35:16 +0900
Message-ID: <CAK7LNARmkRi1ug9C780egxUn1m1FMxAE+uN1d08hLNYZF1724Q@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] livepatch: Add sample livepatch module
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Joe,

On Thu, May 9, 2019 at 11:39 PM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> From: Josh Poimboeuf <jpoimboe@redhat.com>
>
> Add a new livepatch sample in samples/livepatch/ to make use of
> symbols that must be post-processed to enable load-time relocation
> resolution. As the new sample is to be used as an example, it is
> annotated with KLP_MODULE_RELOC and with KLP_SYMPOS macros.
>
> The livepatch sample updates the function cmdline_proc_show to
> print the string referenced by the symbol saved_command_line
> appended by the string "livepatch=1".
>
> Update livepatch-sample.c to remove livepatch MODULE_INFO
> statement.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Joao Moreira <jmoreira@suse.de>
> Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> ---


> --- /dev/null
> +++ b/samples/livepatch/livepatch-annotated-sample.c
> @@ -0,0 +1,102 @@
> +/*
> + * livepatch-annotated-sample.c - Kernel Live Patching Sample Module
> + *
> + * Copyright (C) 2014 Seth Jennings <sjenning@redhat.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.

Please use SPDX instead of the license boilerplate.

Thanks.


-- 
Best Regards
Masahiro Yamada

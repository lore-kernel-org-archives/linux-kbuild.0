Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46123 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgCCGK4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 01:10:56 -0500
MIME-Version: 1.0
References: <202002242114.CBED7F1@keescook> <202003022046.4185359A@keescook>
In-Reply-To: <202003022046.4185359A@keescook>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 2 Mar 2020 22:10:42 -0800
Message-ID: <CAADnVQKgQWmMgcxynzTRhGv1dZ=6oJDB79txrc8tmGy5sPejTg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove debug info from kallsyms linking
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>

On Mon, Mar 2, 2020 at 8:48 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Feb 24, 2020 at 09:16:17PM -0800, Kees Cook wrote:
> > When CONFIG_DEBUG_INFO is enabled, the two kallsyms linking steps spend
> > time collecting and writing the dwarf sections to the temporary output
> > files. kallsyms does not need this information, and leaving it off
> > halves their linking time. This is especially noticeable without
> > CONFIG_DEBUG_INFO_REDUCED. The BTF linking stage, however, does still
> > need those details.
> >
> > Refactor the BTF and kallsyms generation stages slightly for more
> > regularized temporary names. Skip debug during kallsyms links.
> >
> > For a full debug info build with BTF, my link time goes from 1m06s to
> > 0m54s, saving about 12 seconds, or 18%.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Ping. Masahiro what do you think of this? It saves me a fair bit of time
> on the link stage... I bet the BPF folks would be interested too. :)

The build time improvement sound great.
Could you please resubmit for bpf-next tree?
So we can test and apply properly?
Thanks!

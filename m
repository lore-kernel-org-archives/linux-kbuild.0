Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35441 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732305AbgCCVGr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 16:06:47 -0500
Received: by mail-pf1-f196.google.com with SMTP id i19so2117412pfa.2
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Mar 2020 13:06:45 -0800 (PST)
Date: Tue, 3 Mar 2020 13:06:43 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: Remove debug info from kallsyms linking
Message-ID: <202003031301.083CF048C2@keescook>
References: <202002242114.CBED7F1@keescook>
 <CAEf4BzYrBoQJ1tPMRMQ_-G6e76=zj4zyC=HrY-mxH_9QK65oqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4BzYrBoQJ1tPMRMQ_-G6e76=zj4zyC=HrY-mxH_9QK65oqg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Mon, Mar 02, 2020 at 10:55:04PM -0800, Andrii Nakryiko wrote:
> On Mon, Feb 24, 2020 at 9:17 PM Kees Cook <keescook@chromium.org> wrote:
> >
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
> > ---
> 
> I've tested locally, seems to be generating BTF properly (I haven't
> timed anything, though). See nit below, but otherwise:
> 
> Acked-by: Andrii Nakryiko <andriin@fb.com>

Thanks!

> 
> >  scripts/link-vmlinux.sh | 28 +++++++++++++++++++---------
> >  1 file changed, 19 insertions(+), 9 deletions(-)
> >
> 
> [...]
> 
> > @@ -106,6 +114,8 @@ gen_btf()
> >  {
> >         local pahole_ver
> >         local bin_arch
> > +       local bin_format
> > +       local bin_file
> >
> >         if ! [ -x "$(command -v ${PAHOLE})" ]; then
> >                 echo >&2 "BTF: ${1}: pahole (${PAHOLE}) is not available"
> > @@ -118,8 +128,9 @@ gen_btf()
> >                 return 1
> >         fi
> >
> > -       info "BTF" ${2}
> >         vmlinux_link ${1}
> > +
> > +       info "BTF" ${2}
> 
> Any reason to exclude linking from "BTF" step? It's still a part of
> BTF generation, so seems fair to have BTF encompass both vmlinux
> linking and BTF generation/deduplication?

I'm not sure I'm following what you're saying here. If you're asking why
BTF linking is separate from the final vmlinux link, it's because of how
kallsyms is generated. Currently it's using a rather brute-force
approach to figure out exactly where everything is going to be in the
final link, and for that it need to have both the BTF symbols present
and the kallysms symbols present. So, unfortunately, each needs to be a
separate step. I spent some time trying to merge BTF and kallsyms phase
1, but I didn't find a viable solution. I'm *sure* there is a better way
to handle kallsyms, but I haven't had the time to really investigate it.
I think it would require some close coordination with linker behavior
changes...

> 
> >         LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${1}
> >
> >         # dump .BTF section into raw binary file to link with final vmlinux

BTW, in looking at BTF generation, why is this cut up into three steps:
pahole, objcopy, objcopy... shouldn't pahole just gross an output method
to dump the final .o file? That would be MUCH nicer. Especially since
the first step ends up rewriting (?!) the original ELF. This is a lot of
needless IO...

-- 
Kees Cook

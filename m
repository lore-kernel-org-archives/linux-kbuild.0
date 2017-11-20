Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:34313 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751151AbdKTVEx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 16:04:53 -0500
Message-ID: <1511211881.4822.61.camel@oracle.com>
Subject: Re: [PATCH 2/7] kbuild: Add P= command line flag to run checkpatch
From: Knut Omang <knut.omang@oracle.com>
Date: Mon, 20 Nov 2017 22:04:41 +0100
In-Reply-To: <CAK7LNASBKPMG5eZ2yXPL_xOYUjr+0J56YMC5VRsE6o=xqz=DzA@mail.gmail.com>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
         <716fa938a4ab0ad66490b72e2ed750cd6583728f.1510840787.git-series.knut.omang@oracle.com>
         <CAK7LNASBKPMG5eZ2yXPL_xOYUjr+0J56YMC5VRsE6o=xqz=DzA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, 2017-11-21 at 01:18 +0900, Masahiro Yamada wrote:
> 2017-11-17 2:01 GMT+09:00 Knut Omang <knut.omang@oracle.com>:
> > Add interpretation of a new environment variable P={1,2} in spirit of the
> > C= option, but executing checkpatch instead of sparse.
> > 
> > Signed-off-by: Knut Omang <knut.omang@oracle.com>
> > Reviewed-by: Håkon Bugge <haakon.bugge@oracle.com>
> > Acked-by: Åsmund Østvold <asmund.ostvold@oracle.com>
> > ---
> >  Makefile               | 20 +++++++++++++++++++-
> >  scripts/Makefile.build | 13 +++++++++++++
> >  2 files changed, 32 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index ccd9818..eb4bca9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -176,6 +176,20 @@ ifndef KBUILD_CHECKSRC
> >    KBUILD_CHECKSRC = 0
> >  endif
> > 
> > +# Run scripts/checkpatch.pl with --ignore-cfg checkpatch.cfg
> > +#
> > +# Use 'make P=1' to enable checking of only re-compiled files.
> > +# Use 'make P=2' to enable checking of *all* source files, regardless
> > +#
> > +# See the file "Documentation/dev-tools/run-checkpatch.rst" for more
> > details,
> > +#
> > +ifeq ("$(origin P)", "command line")
> > +  KBUILD_CHECKPATCH = $(P)
> > +endif
> > +ifndef KBUILD_CHECKPATCH
> > +  KBUILD_CHECKPATCH = 0
> > +endif
> 
> 
> I am unhappy about adding a new interface
> for each checker.

I see your point. I wanted to extend C= to handle checkpatch as well but see no
obvious good non-intrusive solution.

> The default of CHECK is "sparse", but
> users can override it to use another checker.
> 
> 
> 
> As Decumentation/dev-tools/coccinelle.rst says,
> if you want to use coccinelle as a checker,
> 
> make C=1 CHECK="scripts/coccicheck"

That works well with coccinelle since both sparse and coccinelle rely on getting
the same command line options as what's passed to the compiler, while checkpatch
is quite different:

  make C=2 CHECK="\$(srctree)/scripts/checkpatch.pl" 

fails, complaining about every single compiler flag.

Thanks,
Knut

> Recently, I saw a patch to use scripts/kernel-doc as a checker.
> https://patchwork.kernel.org/patch/10030521/
> 
> 
> 
> If I accept your patch,
> we would end up with
> 
> KBUILD_CHECKPATCH,
> KBUILD_CHECKCOCCI
> KBUILD_CHECKDOC,
> ...
> 
> This is ugly.


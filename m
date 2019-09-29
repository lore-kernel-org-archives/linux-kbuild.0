Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:51339 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728569AbfI2AVU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Sep 2019 20:21:20 -0400
MIME-Version: 1.0
References: <20190129204319.15238-1-jacob.e.keller@intel.com>
 <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org> <02874ECE860811409154E81DA85FBB58968DBE54@ORSMSX121.amr.corp.intel.com>
In-Reply-To: <02874ECE860811409154E81DA85FBB58968DBE54@ORSMSX121.amr.corp.intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 29 Sep 2019 09:20:31 +0900
Message-ID: <CAK7LNARyUEakeG_N9TWcO2cjFSzbgY__k_QJm6C+oOz+fW0aeg@mail.gmail.com>
Subject: Re: [PATCH] namespace: fix namespace.pl script to support relative paths
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Keller, Jacob E" <jacob.e.keller@intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Sat, Sep 28, 2019 at 8:30 AM Keller, Jacob E
<jacob.e.keller@intel.com> wrote:
>
> > -----Original Message-----
> > From: Randy Dunlap [mailto:rdunlap@infradead.org]
> > Sent: Friday, September 27, 2019 4:12 PM
> > To: Keller, Jacob E <jacob.e.keller@intel.com>
> > Cc: intel-wired-lan@lists.osuosl.org; linux-kernel@vger.kernel.org; linux-kbuild <linux-
> > kbuild@vger.kernel.org>; Masahiro Yamada <yamada.masahiro@socionext.com>
> > Subject: Re: [PATCH] namespace: fix namespace.pl script to support relative paths
> >
> >
> > re: https://lore.kernel.org/lkml/20190129204319.15238-1-jacob.e.keller@intel.com/
> >
> > Did anything happen with this patch?
> >
> > Please send it to linux-kbuild@vger.kernel.org and
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> >
> > You can also add:
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> >
> >
> > I was just about to fix this script but I decided to first see if anyone else
> > had already done so.  Thanks.
> >
> > --
> > ~Randy
>
> Done, thanks.
>
> Regards,
> Jake


Applied to linux/kbuild. Thanks.

-- 
Best Regards
Masahiro Yamada

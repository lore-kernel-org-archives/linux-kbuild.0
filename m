Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:40181 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751337AbaHAL4q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Aug 2014 07:56:46 -0400
Date: Fri, 01 Aug 2014 20:55:50 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH,RESEND] arm: Do not define "comma" twice
In-Reply-To: <20140711205900.E6FA.AA925319@jp.panasonic.com>
References: <1396228057-1488-1-git-send-email-yamada.m@jp.panasonic.com> <20140711205900.E6FA.AA925319@jp.panasonic.com>
Message-Id: <20140801205550.D532.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kbuild@vger.kernel.org

Hello Russel King,


Could you apply this trivial patch for 3.17 merge window, please?

Thanks.

Masahiro Yamada



On Fri, 11 Jul 2014 20:59:00 +0900
Masahiro Yamada <yamada.m@jp.panasonic.com> wrote:

> Hi.
> 
> 
> 
> This is a ping.
> 
> It has been three months since I posted this trivial patch.
> Any comments?
> 
> If this patch looks good, could you apply it
> for Linux 3.17-rc1 ?
> 
> Thanks,
> 
> Masahiro Yamada
> 
> 
> 
> On Mon, 31 Mar 2014 10:07:37 +0900
> Masahiro Yamada <yamada.m@jp.panasonic.com> wrote:
> 
> > We have the definition of "comma" in scripts/Kbuild.include.
> > We should not double it.
> > 
> > Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> > ---
> > 
> > First I posted this patch to linux-kbuild ML.
> > But, Michal Marek recommended me to send it to linux-arm-kernel ML.
> > 
> > So this is here now.
> > 
> > 
> >  arch/arm/Makefile   | 2 --
> >  arch/arm64/Makefile | 2 --
> >  2 files changed, 4 deletions(-)
> > 
> > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > index 08a9ef5..72f7b8c 100644
> > --- a/arch/arm/Makefile
> > +++ b/arch/arm/Makefile
> > @@ -50,8 +50,6 @@ AS		+= -EL
> >  LD		+= -EL
> >  endif
> >  
> > -comma = ,
> > -
> >  # This selects which instruction set is used.
> >  # Note that GCC does not numerically define an architecture version
> >  # macro, but instead defines a whole series of macros which makes
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index 2fceb71..473a050 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -30,8 +30,6 @@ AS		+= -EL
> >  LD		+= -EL
> >  endif
> >  
> > -comma = ,
> > -
> >  CHECKFLAGS	+= -D__aarch64__
> >  
> >  # Default value
> > -- 
> > 1.8.3.2
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
パナソニック（株） システムLSIビジネスユニット
第二事業ディビジョン
開発グループ 第三開発チーム
山田　真弘 <yamada.m@jp.panasonic.com>
〒617-8520  京都府長岡京市神足焼町1番地
外線 : 050-3783-5420
内線 : 7-664-2813, 社内ポスト: 664-772


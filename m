Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42508 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725748AbeKNGfz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Nov 2018 01:35:55 -0500
Received: by mail-pg1-f196.google.com with SMTP id d72so2795235pga.9
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Nov 2018 12:36:05 -0800 (PST)
Date: Wed, 14 Nov 2018 05:36:02 +0900
From: Stafford Horne <shorne@gmail.com>
Subject: Re: [kbuild-all] [kbuild:kbuild 2/4]
 arch/openrisc/include/asm/spr.h:20:27: error: impossible constraint in 'asm'
Message-ID: <20181113203602.GE2718@lianli.shorne-pla.net>
References: <201811120258.np3G1anC%fengguang.wu@intel.com>
 <CAAfxs76Qe7ORo7RFqSXc28bY15DR3zCy6rUAvg9T76xWS1TsWw@mail.gmail.com>
 <CAAfxs76m4uk0VDah1AsMQMxtKUimc7LFKcuEGMtQbEQ_1xw9gQ@mail.gmail.com>
 <20181112143605.a6evj3jrsnwpnush@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181112143605.a6evj3jrsnwpnush@mail.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: kbuild test robot <lkp@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, kbuild-all@01.org, linux-kbuild@vger.kernel.org

On Mon, Nov 12, 2018 at 10:36:06PM +0800, Changbin Du wrote:
> On Mon, Nov 12, 2018 at 06:51:57AM +0900, Stafford Horne wrote:
> > Again, in plain text mode:
> > 
> > Did something change with the compiler setup?  The error here says gcc
> > 6.0.0.  however the version in the make.cross tool is 5.4.0, which is
> > strange.  Fyi, We have binaries for 7.2.0 and 9.x which can be used.
> > 
> > Also our toolchain is all upstream as of last week.
> > 
> > On Mon, Nov 12, 2018 at 6:03 AM Stafford Horne <shorne@gmail.com> wrote:
> > >
> > > Hello,
> > >
> > > Did something change with the compiler setup?  The error here says gcc 6.0.0.  however the version in the make.cross tool is 5.4.0, which is strange.  Fyi, We have binaries for 7.2.0 and 9.x which can be used.
> > >
> > > Also our toolchain is all upstream as of last week.
> > >
> > > -stafford
> > >
> I added a patch which disables gcc auto-inlining by '-fno-inline-functions 
> -fno-inline-small-functions -fno-inline-functions-called-once' (but default
> option is false).
> 
> See series https://lkml.org/lkml/2018/5/9/213.
> 
> I am trying to make gcc happy for this corner case. Thanks!

Thanks, this looks like a really useful debug feature.  Also, thanks for sending
the other patch to fix the build issue in openrisc.

-Stafford

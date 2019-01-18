Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55422 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726062AbfARJWo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Jan 2019 04:22:44 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x0I9JU5A001187
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Jan 2019 04:22:43 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2q3ana3fud-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Jan 2019 04:22:42 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
        Fri, 18 Jan 2019 09:22:40 -0000
Date: Fri, 18 Jan 2019 10:22:35 +0100
From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH v2 2/4] s390: make thin archives not directly depend on
 *.o.chkbss files
References: <1547719364-18849-1-git-send-email-yamada.masahiro@socionext.com>
 <1547719364-18849-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <1547719364-18849-2-git-send-email-yamada.masahiro@socionext.com>
Message-Id: <20190118092235.GB4160@osiris>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>

On Thu, Jan 17, 2019 at 07:02:42PM +0900, Masahiro Yamada wrote:
> When I was refactoring cmd_ar_builtin in scripts/Makefile.build,
> I noticed the build breakage of s390.
> 
> Some Makefiles of s390 add extra dependencies to built-in.a;
> built-in.a depends on timestamp files *.o.chkbss, but $(AR) does
> not want to include them into built-in.a.
> 
> Insert a phony target 'chkbss' in between so that $(AR) can take
> $(filter-out $(PHONY), $^) as input.
> 
> While I was here, I refactored Makefile.chkbss a little bit.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> I want Acked-by from a s390 maintainer so this series can go
> into kbuild tree.
> 
> Changes in v2:
>  - New patch
> 
>  arch/s390/boot/Makefile            |  4 ++--
>  arch/s390/boot/compressed/Makefile |  4 ++--
>  arch/s390/scripts/Makefile.chkbss  | 25 +++++++++++--------------
>  3 files changed, 15 insertions(+), 18 deletions(-)

Tested and still seems to work like before.

Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com>

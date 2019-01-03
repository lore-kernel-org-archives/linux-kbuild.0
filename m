Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57922 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730063AbfACHhC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Jan 2019 02:37:02 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x037Xwfl038437
        for <linux-kbuild@vger.kernel.org>; Thu, 3 Jan 2019 02:37:01 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2psdtngp2m-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Jan 2019 02:37:01 -0500
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
        Thu, 3 Jan 2019 07:36:58 -0000
Date: Thu, 3 Jan 2019 08:36:52 +0100
From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH] kbuild: use assignment instead of define ... endef for
 filechk_* rules
References: <1546478214-20394-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <1546478214-20394-1-git-send-email-yamada.masahiro@socionext.com>
Message-Id: <20190103073652.GA3957@osiris>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Hendrik Brueckner <brueckner@linux.vnet.ibm.com>

On Thu, Jan 03, 2019 at 10:16:54AM +0900, Masahiro Yamada wrote:
> You do not have to use define ... endef for filechk_* rules.
> 
> For simple cases, the use of assignment looks cleaner, IMHO.
> 
> I updated the usage for scripts/Kbuild.include in case somebody
> misunderstands the 'define ... endif' is the requirement.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Kbuild                             |  4 +---
>  Makefile                           |  3 +--
>  arch/s390/kernel/syscalls/Makefile | 12 +++---------
>  arch/s390/tools/Makefile           |  7 ++-----
>  scripts/Kbuild.include             |  8 ++++----
>  scripts/kconfig/Makefile           |  4 +---
>  6 files changed, 12 insertions(+), 26 deletions(-)

For the s390 bits:
Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com>

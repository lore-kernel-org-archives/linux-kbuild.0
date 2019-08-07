Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62670 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727331AbfHGIBr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Aug 2019 04:01:47 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x777xBT5099440
        for <linux-kbuild@vger.kernel.org>; Wed, 7 Aug 2019 04:01:46 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2u7swtt6ys-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Aug 2019 04:01:45 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Wed, 7 Aug 2019 09:01:43 +0100
Date: Wed, 7 Aug 2019 10:01:39 +0200
From: Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH 1/2] kbuild: add OBJSIZE variable for the size tool
References: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
 <CAK7LNATL8aGReDm+BYk74tH1EdK1NKVgaWF6sJ7m1NtBL1kqkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNATL8aGReDm+BYk74tH1EdK1NKVgaWF6sJ7m1NtBL1kqkw@mail.gmail.com>
Message-Id: <your-ad-here.call-01565164899-ext-1604@work.hours>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Aug 07, 2019 at 11:32:04AM +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Tue, Aug 6, 2019 at 7:56 PM Vasily Gorbik <gor@linux.ibm.com> wrote:
> >
> > Define and export OBJSIZE variable for "size" tool from binutils to be
> > used in architecture specific Makefiles (naming the variable just "SIZE"
> > would be too risky). In particular this tool is useful to perform checks
> > that early boot code is not using bss section (which might have not been
> > zeroed yet or intersects with initrd or other files boot loader might
> > have put right after the linux kernel).
> >
> > Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> 
> I think you want to apply both to the s390 tree. If so,
> 
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> 
> Thanks.

Yes, I would take it via s390 tree. Thank you!

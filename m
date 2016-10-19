Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:37239 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754262AbcJSTv4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Oct 2016 15:51:56 -0400
MIME-Version: 1.0
In-Reply-To: <4fe8b518-6145-5322-a852-beeb61abd559@users.sourceforge.net>
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
 <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com>
 <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net>
 <CA+r1ZhhqEBvV0ivz=MvaHhRquhFS2mxddJ-GOx81ZeSerKsD3g@mail.gmail.com>
 <ec3a7283-3c41-9879-49ae-8924b8daf65f@users.sourceforge.net>
 <CA+r1Zhj3AQAbL_Hu4w=gX8kaR0zKoYhTmAYyVcvBMPLXpfZ3gA@mail.gmail.com> <4fe8b518-6145-5322-a852-beeb61abd559@users.sourceforge.net>
From: Jim Davis <jim.epost@gmail.com>
Date: Wed, 19 Oct 2016 12:51:44 -0700
Message-ID: <CA+r1Zhiat4d8FqFcD1BBCxe5jyWOtSDZp99_CLV0qE1D3REquw@mail.gmail.com>
Subject: Re: Challenges around the usage of different "HOSTCFLAGS" for kernel
 build configuration and module generation
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Oct 19, 2016 at 12:25 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>
> Are you interested that a software generation parameter like "-S"
> (for output of assembler source files) could be directly supported
> for a special build variant?

No, if you want to see the assembly code then something like

make defconfig; make EXTRA_CFLAGS="-g" drivers/md/; objdump -S
drivers/md/whatever.o

seems easy enough.  You could write a little shell wrapper to save
some keystrokes if you find you're running those commands frequently.

-- 
Jim

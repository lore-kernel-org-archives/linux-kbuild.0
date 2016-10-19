Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:60824 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752418AbcJSWEh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Oct 2016 18:04:37 -0400
Date: Wed, 19 Oct 2016 17:03:47 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: Challenges around the usage of different "HOSTCFLAGS" for kernel build configuration and module generation
Message-ID: <20161019220346.GA20054@gate.crashing.org>
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net> <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com> <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net> <CA+r1ZhhqEBvV0ivz=MvaHhRquhFS2mxddJ-GOx81ZeSerKsD3g@mail.gmail.com> <ec3a7283-3c41-9879-49ae-8924b8daf65f@users.sourceforge.net> <CA+r1Zhj3AQAbL_Hu4w=gX8kaR0zKoYhTmAYyVcvBMPLXpfZ3gA@mail.gmail.com> <4fe8b518-6145-5322-a852-beeb61abd559@users.sourceforge.net> <CA+r1Zhiat4d8FqFcD1BBCxe5jyWOtSDZp99_CLV0qE1D3REquw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+r1Zhiat4d8FqFcD1BBCxe5jyWOtSDZp99_CLV0qE1D3REquw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Oct 19, 2016 at 12:51:44PM -0700, Jim Davis wrote:
> On Wed, Oct 19, 2016 at 12:25 AM, SF Markus Elfring
> <elfring@users.sourceforge.net> wrote:
> >
> > Are you interested that a software generation parameter like "-S"
> > (for output of assembler source files) could be directly supported
> > for a special build variant?
> 
> No, if you want to see the assembly code then something like
> 
> make defconfig; make EXTRA_CFLAGS="-g" drivers/md/; objdump -S
> drivers/md/whatever.o
> 
> seems easy enough.  You could write a little shell wrapper to save
> some keystrokes if you find you're running those commands frequently.

Don't forget -r when running objdump on an object file.  But, you
want to use  make drivers/md/whatever.s  if you want to see the
assembler code.

And that doesn't work for build-time tools, which I think is what
the original discussion was about.


Segher

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:51243 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755473AbcJSRHB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Oct 2016 13:07:01 -0400
Subject: Re: Challenges around the usage of different "HOSTCFLAGS" for kernel
 build configuration and module generation
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
 <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com>
 <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net>
 <CA+r1ZhhqEBvV0ivz=MvaHhRquhFS2mxddJ-GOx81ZeSerKsD3g@mail.gmail.com>
 <ec3a7283-3c41-9879-49ae-8924b8daf65f@users.sourceforge.net>
 <CA+r1Zhj3AQAbL_Hu4w=gX8kaR0zKoYhTmAYyVcvBMPLXpfZ3gA@mail.gmail.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <4fe8b518-6145-5322-a852-beeb61abd559@users.sourceforge.net>
Date: Wed, 19 Oct 2016 09:25:44 +0200
MIME-Version: 1.0
In-Reply-To: <CA+r1Zhj3AQAbL_Hu4w=gX8kaR0zKoYhTmAYyVcvBMPLXpfZ3gA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Can it be that the passing of the adjusted parameter "HOSTCFLAGS" has got a significant
>> influence (with unwanted side effects) in this use case?
> 
> That's probably it.  If I strip down your advanced original example to just
> 
> make defconfig
> make HOSTCFLAGS=-S
> 
> then I get a similar error:
> 
>   HOSTCC  scripts/basic/fixdep
> scripts/basic/fixdep: 1: scripts/basic/fixdep: .file: not found
…
> and so forth.

Thanks that you could reproduce my observation also with a simple example
on your test system.


> The problem is that, with -S, fixdep isn't build as an executable:
> 
> jim@krebstar:~/linux-next/scripts/basic$ file fixdep
> fixdep: assembler source, ASCII text

Are you interested that a software generation parameter like "-S"
(for output of assembler source files) could be directly supported
for a special build variant?

* Does this issue indicate further development challenges?

* How are the chances that the involved software dependencies can be
  handled better in more detail?


> I'm guessing that in your original example you wanted to look at the
> assembly output gcc produced;

Yes. - I became interested in this use case once more.


> you'd probably have better luck using objdump for that.

This approach can occasionally work to some degree. I am looking for
a better (or more convenient) solution.

I got the impression that I need to put special build parameters into
the make files directly so far while I would prefer to pass extra settings
as command line arguments for the tool "make".

Will it make sense to distinguish such parameters for development phases
(or stages) like "kernel build configuration" and corresponding
"module generation" any more?

Regards,
Markus

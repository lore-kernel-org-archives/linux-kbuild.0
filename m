Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44448 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgBVSMv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 13:12:51 -0500
Date: Sat, 22 Feb 2020 11:12:49 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
Message-ID: <20200222181249.GA23843@ubuntu-m2-xlarge-x86>
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca>
 <20200222003820.220854-1-alex_y_xu@yahoo.ca>
 <20200222021619.GA51223@ubuntu-m2-xlarge-x86>
 <1582341758.yo66djba3t.none@localhost>
 <20200222080140.GA40311@ubuntu-m2-xlarge-x86>
 <1582381271.1karmgahx0.none@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582381271.1karmgahx0.none@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: Russell King <linux@armlinux.org.uk>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, masahiroy@kernel.org, michal.lkml@markovi.net

On Sat, Feb 22, 2020 at 09:24:14AM -0500, Alex Xu (Hello71) wrote:
> Excerpts from Nathan Chancellor's message of February 22, 2020 3:01 am:
> > I used hyperfine [1] to run a quick benchmark with a freshly built
> > GCC 9.2.0 for x86 and aarch64 and here are the results:
> > 
> > In both cases it seems like performance regresses (by 1% but still) but
> > maybe it is my machine, even though this benchmark was done on a
> > different machine than the one from my commit back in 2018.
> > 
> > I am not sure I would write off these results, since I did the benchmark
> > 25 times on each one back to back, eliminating most of the variance that
> > you described.
> > 
> > [1]: https://github.com/sharkdp/hyperfine
> > 
> > Cheers,
> > Nathan
> > 
> 
> What kernel version are you running? Do you have the 5.6 pipe reworks?

No, it is a stock Ubuntu 18.04 kernel, which is running 4.15.0.

$ uname -a
Linux c2-medium-x86 4.15.0-50-generic #54-Ubuntu SMP Mon May 6 18:46:08 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

If you are curious about the specs:

$ neofetch --stdout
nathan@c2-medium-x86 
-------------------- 
OS: Ubuntu 18.04.3 LTS x86_64 
Host: PowerEdge R6415 
Kernel: 4.15.0-50-generic 
Uptime: 126 days, 12 hours, 39 mins 
Packages: 686 
Shell: zsh 5.4.2 
Terminal: /dev/pts/0 
CPU: AMD EPYC 7401P 24- (48) @ 2.794GHz 
Memory: 2974MiB / 64018MiB 

Cheers,
Nathan

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725987AbgELI2q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 04:28:46 -0400
Date: Tue, 12 May 2020 01:28:43 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v5 0/5] Allow ld.lld to link the MIPS VDSO
Message-ID: <20200512082843.GA3815743@ubuntu-s3-xlarge-x86>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
 <20200512080509.GA9433@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512080509.GA9433@alpha.franken.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

On Tue, May 12, 2020 at 10:05:09AM +0200, Thomas Bogendoerfer wrote:
> On Tue, Apr 28, 2020 at 03:14:14PM -0700, Nathan Chancellor wrote:
> > [..]
> > Please let me know if there are any issues!
> 
> I found no issues in my tests. Is this the final state ? If yes, I'm
> going to apply it to mips-next.
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

Maciej seemed to have some issue with the way I worded the commit
message of patch 4 but I have not heard anything back about my
suggestion and Fangrui commented that --eh-frame-hdr might not be
necessary but if everything works fine for you with this version, I
am not inclined to touch it.

If you feel this is good to go, I am happy to let it go in. Thanks for
accepting it!

Cheers,
Nathan

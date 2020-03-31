Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0188.hostedemail.com ([216.40.44.188]:52270 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725999AbgCaR6R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 13:58:17 -0400
Message-ID: <78a8ba04459f8a4ea6bcb8811f35490018b763f2.camel@perches.com>
Subject: Re: single target builds are broken
From: Joe Perches <joe@perches.com>
Date: Tue, 31 Mar 2020 10:56:20 -0700
In-Reply-To: <CAK7LNAT-8TbLRPB=PNsbAORKYvYL+m3JmA-iSDieK8Uv7MAvGA@mail.gmail.com>
References: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
         <CAK7LNAQ8LZMPxrjVkuLizHjVZyBtSmLFZ=EvDCCAPb-XGfJLHA@mail.gmail.com>
         <8c491e3b-a622-14c1-15c3-8cff061017ba@oracle.com>
         <CAK7LNAT-8TbLRPB=PNsbAORKYvYL+m3JmA-iSDieK8Uv7MAvGA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, 2020-04-01 at 01:03 +0900, Masahiro Yamada wrote:
> On Tue, Mar 31, 2020 at 8:02 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
> > It's really useful to be able to build object files separately, but as
> > if it was part of the kernel (so e.g. with all the gcc flags, include
> > paths, etc.).
[]
> So, there were lots of cases where single builds did not work:
> 
> https://www.spinics.net/lists/linux-kbuild/msg21921.html
> 
> The way to do this correctly is to
> descend directories one by one, parsing Makefiles.
> 
> With no entry in obj-y/m,
> Kbuild cannot determine where to build that object.
> 
> > At the very least, can we find a way to reduce the typing overhead for
> > testing one-offs like that? 'make STANDALONE=1 test.o' or something?
> 
> Probably, I do not want to do this.
> 
> Supporting everybody's demand is not a good idea.
> So, I draw a line somewhere.
> 
> Saving some typing is less important.

I too find this regression less than desirable.

make <single_object> is/was quite useful even
if it didn't always work.

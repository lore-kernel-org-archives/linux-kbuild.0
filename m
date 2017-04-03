Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33527 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752683AbdDCNZR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Apr 2017 09:25:17 -0400
Subject: Re: [PATCH] Kbuild.include: addtree: Remove quotes before matching
 path
References: <20170318215823.GS4152@decadent.org.uk>
 <CAK7LNAQFx-yPj2c52sZ0LSv=UnQz-ATGJGkzT5wV7tq-GmvARw@mail.gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <7bebf377-1268-ee02-c19b-f2d16d69cf79@suse.com>
Date: Mon, 3 Apr 2017 15:25:10 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQFx-yPj2c52sZ0LSv=UnQz-ATGJGkzT5wV7tq-GmvARw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, stable@vger.kernel.org, 856474@bugs.debian.org

On 2017-04-03 09:42, Masahiro Yamada wrote:
> Each Makefile knows it wants to see
> additional headers in the source tree, or objtree.
> 
> I am guessing the right approach in a long run is,
> we require -I to specify $(srctree) or $(objtree) explicitly.
> 
> ccflags-y := -I$(srctree)/foo/bar/baz
> 
> or
> 
> ccflags-y := -I$(objtree)/foo/bar/baz
> 
> 
> (For the latter, we can omit $(objtree)/ as it is ./)
> 
> 
> Then, delete $(call flags,_c_flags) after the conversion.

Agreed. The addtree function is more of a hack to make things just work
with O=, but AFAIK there is no clean way to implement VPATH for -I
arguments. So it's sensible to get rid of the hack. It looks like it's
going to be lot of work though:

$ git grep -e '-I' -- '*Makefile*' | wc -l
732
$ git grep -e '-I *\$(\(src\|obj\)tree)' -- '*Makefile*' | wc -l
166

Michal

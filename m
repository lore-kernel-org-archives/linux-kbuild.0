Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:48292 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbeHJTOT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Aug 2018 15:14:19 -0400
Subject: Re: HELP: Count Lines of Code in Custom Compiled Kernel
References: <CAL8qismn-pAKiGRi-BjadSBHd=KoMAjG2di9h9dLjDTQzeejtA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8de39769-b67b-a12f-c4fd-5d19ef8ddf0b@infradead.org>
Date: Fri, 10 Aug 2018 09:43:40 -0700
MIME-Version: 1.0
In-Reply-To: <CAL8qismn-pAKiGRi-BjadSBHd=KoMAjG2di9h9dLjDTQzeejtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Faisal Mehmood <f.m3hm00d@gmail.com>, linux-kbuild@vger.kernel.org

On 08/10/2018 12:30 AM, Faisal Mehmood wrote:
> So I compiled a custom minimal Linux Kernel. I want to list all the
> source files used for this particular .config file. I also want to
> count the lines of code against that .config file compilation.

Hi,

We have a tradition of not doing people's homework for them.  :)

> I tried using 'make  > logfile', but that only lists the generated
> object files. Source files are not listed.

Did you try other build options?

E.g., using "make V=1 ... " will give you verbose output.  It might give
you a list of source files that are compiled.  OTOH, it's probably too verbose.

Or did you look at "make C=1 ..." to invoke the "CHECK" tool on each source
file that is built?

That should be enough of a hint to get you going...

> 'find . -type f -name *.[ch]' includes all the source files, while I
> only need those that are being used by my .config file.


BTW, it would be helpful if one could override "CHECKFLAGS" on the
'make' command line.
As is, CHECKFLAGS is (too) sparse-specific.

-- 
~Randy

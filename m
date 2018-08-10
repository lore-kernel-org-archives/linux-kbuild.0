Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:48928 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbeHJUZQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Aug 2018 16:25:16 -0400
Subject: Re: HELP: Count Lines of Code in Custom Compiled Kernel
From: Randy Dunlap <rdunlap@infradead.org>
References: <CAL8qismn-pAKiGRi-BjadSBHd=KoMAjG2di9h9dLjDTQzeejtA@mail.gmail.com>
 <8de39769-b67b-a12f-c4fd-5d19ef8ddf0b@infradead.org>
Message-ID: <bfb44a8e-14b3-f862-97e1-e59118cd0587@infradead.org>
Date: Fri, 10 Aug 2018 10:54:20 -0700
MIME-Version: 1.0
In-Reply-To: <8de39769-b67b-a12f-c4fd-5d19ef8ddf0b@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Faisal Mehmood <f.m3hm00d@gmail.com>, linux-kbuild@vger.kernel.org

On 08/10/2018 09:43 AM, Randy Dunlap wrote:
> On 08/10/2018 12:30 AM, Faisal Mehmood wrote:
>> So I compiled a custom minimal Linux Kernel. I want to list all the
>> source files used for this particular .config file. I also want to
>> count the lines of code against that .config file compilation.
> 
> Hi,
> 
> We have a tradition of not doing people's homework for them.  :)
> 
>> I tried using 'make  > logfile', but that only lists the generated
>> object files. Source files are not listed.
> 
> Did you try other build options?
> 
> E.g., using "make V=1 ... " will give you verbose output.  It might give
> you a list of source files that are compiled.  OTOH, it's probably too verbose.
> 
> Or did you look at "make C=1 ..." to invoke the "CHECK" tool on each source
> file that is built?
> 
> That should be enough of a hint to get you going...
> 
>> 'find . -type f -name *.[ch]' includes all the source files, while I
>> only need those that are being used by my .config file.
> 
> 
> BTW, it would be helpful if one could override "CHECKFLAGS" on the
> 'make' command line.
> As is, CHECKFLAGS is (too) sparse-specific.

Aha, it is c_flags that gets in the way.
CHECKFLAGS=   does work to override its value.

So Faisal, I had to use a patch like this and then using CHECK=<some script file>
and CHECKFLAGS=      works to count each source file that is built.


---
 scripts/Makefile.build |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20180810.orig/scripts/Makefile.build
+++ linux-next-20180810/scripts/Makefile.build
@@ -86,10 +86,10 @@ __build: $(if $(KBUILD_BUILTIN),$(builti
 ifneq ($(KBUILD_CHECKSRC),0)
   ifeq ($(KBUILD_CHECKSRC),2)
     quiet_cmd_force_checksrc = CHECK   $<
-          cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $< ;
+          cmd_force_checksrc = $(CHECK) $(CHECKFLAGS)  $< ;
   else
       quiet_cmd_checksrc     = CHECK   $<
-            cmd_checksrc     = $(CHECK) $(CHECKFLAGS) $(c_flags) $< ;
+            cmd_checksrc     = $(CHECK) $(CHECKFLAGS)  $< ;
   endif
 endif
 




-- 
~Randy

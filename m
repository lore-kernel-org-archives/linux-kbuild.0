Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:64574 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753573AbdKMQcl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 11:32:41 -0500
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1711110826330.2161@hadrien>
References: <1510210850-28866-1-git-send-email-yamada.masahiro@socionext.com>
 <alpine.DEB.2.20.1711101634225.3187@hadrien> <alpine.DEB.2.20.1711110826330.2161@hadrien>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 14 Nov 2017 01:31:41 +0900
Message-ID: <CAK7LNATBizoVPcvAodovEtPVzo3pKq20Ps5qNtzuOiD043rYwg@mail.gmail.com>
Subject: Re: [Cocci] [PATCH v2] coccinelle: fix parallel build with CHECK=scripts/coccicheck
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cocci@systeme.lip6.fr

Hi Julia,


2017-11-11 16:30 GMT+09:00 Julia Lawall <julia.lawall@lip6.fr>:
>
>
> On Fri, 10 Nov 2017, Julia Lawall wrote:
>
>>
>>
>> On Thu, 9 Nov 2017, Masahiro Yamada wrote:
>>
>> > The command "make -j8 C=1 CHECK=scripts/coccicheck" produces lots of
>> > "coccicheck failed" error messages.
>>
>> The question is where parallelism should be specified.  Currently, make
>> coccicheck picks up the number of cores on the machine and passes that to
>> Coccinelle.
>>
>> OPTIONS="$OPTIONS --jobs $NPROC --chunksize 1"
>>
>> On my 80 core machine with hyperthreading, this runs 160 jobs in parallel,
>> while in practice that degrades the performance as compared to 40 or 80
>> cores.
>>
>> On the other hand, if we use the make command line argument (-j), then we
>> will only get parallelism up to the number of semantic patches.  Since
>> some finish quickly, there will be a lot of wasted cycles.
>>
>> The best would be that the user knows what works well for his machine, and
>> specifies it on the command line, and then that value gets propagated to
>> Coccinelle, eg so that -j8 would cause not 8 semantic patches to run in
>> parallel but instead would cause Coccinelle to run one semantic patch on 8
>> files in parallel.  But I don't know if that can be done.
>
> Sorry for these fairly nonsensical comments.  make -j is going to consider
> every file, then parse and run every semantic patch on that file.  If the
> parallelism is pushed down into Coccinelle, each semantic patch will be
> parsed only once, and then Coccinelle will choose the files for which it
> is relevant.  If indexing is used (idutils, glimpse), then for semantic
> patches that focus on specific keywords, Coccinelle will efficiently
> ignore files that are not relevant.  I don't think there would be many
> cases where make -j would win.  Perhaps it would be possible to detect
> its used and abort with an appopriate message?


I am afraid you and I are talking different things.


For a usual usage of coccicheck, only one thread runs scripts/coccicheck
even if -j is passed from the command line.

coccicheck provides "J" to specify parallelism.

if [ -z "$J" ]; then
        NPROC=$(getconf _NPROCESSORS_ONLN)
else
        NPROC="$J"
fi


If you are unhappy with 160 threading, you can give J=40 from the command line.



My patch addresses a problem where coccicheck is used as CHECK.
The default of CHECK is "sparse", but you can use any checker tool.

In CHECK=scripts/coccicheck case, if -j is passed, all tasks run in parallel
under control of GNU Make, so scripts/coccicheck is also invoked from
multiple threads.
Passing --jobs to spatch is not sensible because it checks only one file.




> julia
>
>
>>
>> julia
>>
>> >
>> > I do not know the coccinelle internals, but I guess --jobs does not
>> > work well if spatch is invoked from Make running in parallel.
>> > Disable --jobs in this case.
>> >
>> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> > ---
>> >
>> > Changes in v2:
>> >   - Grep '-j' instead of '--jobserver-auth'.
>> >     '--jobserver-*' is not a stable option flag.
>> >     Make 4.2 change '--jobserver-fds' into '--jobserver-auth'
>> >   - Add -q option to grep
>> >
>> >  scripts/coccicheck | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/scripts/coccicheck b/scripts/coccicheck
>> > index 040a8b1..8bab11e 100755
>> > --- a/scripts/coccicheck
>> > +++ b/scripts/coccicheck
>> > @@ -70,6 +70,9 @@ if [ "$C" = "1" -o "$C" = "2" ]; then
>> >      # Take only the last argument, which is the C file to test
>> >      shift $(( $# - 1 ))
>> >      OPTIONS="$COCCIINCLUDE $1"
>> > +
>> > +    # --jobs does not work if Make is running in parallel
>> > +    echo $MAKEFLAGS | grep -q -E '(^| )-j' && USE_JOBS="no"
>> >  else
>> >      ONLINE=0
>> >      if [ "$KBUILD_EXTMOD" = "" ] ; then
>> > --
>> > 2.7.4
>> >
>> >
>> _______________________________________________
>> Cocci mailing list
>> Cocci@systeme.lip6.fr
>> https://systeme.lip6.fr/mailman/listinfo/cocci
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada

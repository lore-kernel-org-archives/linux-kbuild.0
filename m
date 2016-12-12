Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:19006 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933455AbcLLRNP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Dec 2016 12:13:15 -0500
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] tags: honor COMPILED_SOURCE with apart output directory
References: <1476736079-11963-1-git-send-email-robert.jarzmik@free.fr>
        <8737i12rxt.fsf@belgarion.home>
        <7aea4608-2a38-ab02-6c24-beba5a737935@suse.com>
Date: Mon, 12 Dec 2016 18:13:07 +0100
In-Reply-To: <7aea4608-2a38-ab02-6c24-beba5a737935@suse.com> (Michal Marek's
        message of "Sun, 11 Dec 2016 22:20:37 +0100")
Message-ID: <871sxd136k.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Michal Marek <mmarek@suse.com> writes:

> Dne 6.12.2016 v 12:54 Robert Jarzmik napsal(a):
>> Robert Jarzmik <robert.jarzmik@free.fr> writes:
>> 
>>> When the kernel is compiled with an "O=" argument, the object files are
>>> not necessarily in the source tree, and more probably in another tree.
>>>
>>> In this situation, the current used check doesn't work, and
>>> COMPILED_SOURCE tags is broken with O= builds.
>>>
>>> This patch fixes it by looking for object files both in source tree and
>>> potential destination tree.
>>>
>>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>> 
>> Hi Marek, ping about this patch ?
>
> Sorry, I missed the patch.
>
>>> --- a/scripts/tags.sh
>>> +++ b/scripts/tags.sh
>>> @@ -106,7 +106,9 @@ all_compiled_sources()
>>>  		case "$i" in
>>>  			*.[cS])
>>>  				j=${i/\.[cS]/\.o}
>>> -				if [ -e $j ]; then
>>> +				k=${i/"$tree"/"$O"\/}
>>> +				k=${k/\.[cS]/\.o}
>>> +				if [ -e $j -o -e "$k" ]; then
>
> Please use the KBUILD_OUTPUT variable and not O.
Well, I can't as far as I know. I tried, see below ...

Explanation :
 - if I add just below the line "j=${i/\.[cS]/\.o}" the following :
	k="$O/${j#$tree}"
        echo "tree=$tree; O=$O; KBUILD_OUTPUT=$KBUILD_OUTPUT; i=$i, j=$j, k=$k"
 - and I launch:
	make O=out cscope COMPILED_SOURCE=1
 
I get these kind of lines :
tree=../; O=/home/rj/mio_linux/kernel/out; KBUILD_OUTPUT=;
i=../kernel/sched/core.c, j=../kernel/sched/core.o, k=../kernel/sched/core.o

From here I understand that :
 - $KBUILD_OUTPUT is not usable

> should only match at the beginning of the filename (so use something
> like ${i#$tree}).
Ok, I can use then : k="$O/${j#$tree}". The subtle part is when O is empty, in
which case this returns /xxxx, which doesn't look nice, while the former
expression returned either a substituted path or the source path.

> Last, but not least, the .[cS] -> .o substitution only
> needs to be done once. The k variable can use the value of j instead of i.
Yeah, definitely.

Cheers.

-- 
Robert

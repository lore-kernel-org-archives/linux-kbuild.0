Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53113 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752997AbcLLUlb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Dec 2016 15:41:31 -0500
Subject: Re: [PATCH] tags: honor COMPILED_SOURCE with apart output directory
References: <1476736079-11963-1-git-send-email-robert.jarzmik@free.fr>
 <8737i12rxt.fsf@belgarion.home>
 <7aea4608-2a38-ab02-6c24-beba5a737935@suse.com>
 <871sxd136k.fsf@belgarion.home>
From: Michal Marek <mmarek@suse.com>
Message-ID: <1c5303f4-94a3-0762-ddf7-2c406d836392@suse.com>
Date: Mon, 12 Dec 2016 21:41:28 +0100
MIME-Version: 1.0
In-Reply-To: <871sxd136k.fsf@belgarion.home>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Dne 12.12.2016 v 18:13 Robert Jarzmik napsal(a):
> Michal Marek <mmarek@suse.com> writes:
>> Please use the KBUILD_OUTPUT variable and not O.
> Well, I can't as far as I know. I tried, see below ...
> 
> Explanation :
>  - if I add just below the line "j=${i/\.[cS]/\.o}" the following :
> 	k="$O/${j#$tree}"
>         echo "tree=$tree; O=$O; KBUILD_OUTPUT=$KBUILD_OUTPUT; i=$i, j=$j, k=$k"
>  - and I launch:
> 	make O=out cscope COMPILED_SOURCE=1
>  
> I get these kind of lines :
> tree=../; O=/home/rj/mio_linux/kernel/out; KBUILD_OUTPUT=;
> i=../kernel/sched/core.c, j=../kernel/sched/core.o, k=../kernel/sched/core.o
> 
> From here I understand that :
>  - $KBUILD_OUTPUT is not usable

Hm, you are right, we never export $KBUILD_OUTPUT anywhere. But, we
actualy chdir into the build tree before doing anything. So you can
assume that if $KBUILD_SRC != "", the build tree is ".".


>> should only match at the beginning of the filename (so use something
>> like ${i#$tree}).
> Ok, I can use then : k="$O/${j#$tree}". The subtle part is when O is empty, in
> which case this returns /xxxx, which doesn't look nice, while the former
> expression returned either a substituted path or the source path.

... so you can simply strip the leading $tree here and obtain the path
in the build directory.

Michal

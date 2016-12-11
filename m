Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38026 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751752AbcLKVUk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Dec 2016 16:20:40 -0500
Subject: Re: [PATCH] tags: honor COMPILED_SOURCE with apart output directory
References: <1476736079-11963-1-git-send-email-robert.jarzmik@free.fr>
 <8737i12rxt.fsf@belgarion.home>
From: Michal Marek <mmarek@suse.com>
Message-ID: <7aea4608-2a38-ab02-6c24-beba5a737935@suse.com>
Date: Sun, 11 Dec 2016 22:20:37 +0100
MIME-Version: 1.0
In-Reply-To: <8737i12rxt.fsf@belgarion.home>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Dne 6.12.2016 v 12:54 Robert Jarzmik napsal(a):
> Robert Jarzmik <robert.jarzmik@free.fr> writes:
> 
>> When the kernel is compiled with an "O=" argument, the object files are
>> not necessarily in the source tree, and more probably in another tree.
>>
>> In this situation, the current used check doesn't work, and
>> COMPILED_SOURCE tags is broken with O= builds.
>>
>> This patch fixes it by looking for object files both in source tree and
>> potential destination tree.
>>
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> 
> Hi Marek, ping about this patch ?

Sorry, I missed the patch.

>> --- a/scripts/tags.sh
>> +++ b/scripts/tags.sh
>> @@ -106,7 +106,9 @@ all_compiled_sources()
>>  		case "$i" in
>>  			*.[cS])
>>  				j=${i/\.[cS]/\.o}
>> -				if [ -e $j ]; then
>> +				k=${i/"$tree"/"$O"\/}
>> +				k=${k/\.[cS]/\.o}
>> +				if [ -e $j -o -e "$k" ]; then

Please use the KBUILD_OUTPUT variable and not O. Also, the $tree prefix
should only match at the beginning of the filename (so use something
like ${i#$tree}). Last, but not least, the .[cS] -> .o substitution only
needs to be done once. The k variable can use the value of j instead of i.

Thanks,
Michal

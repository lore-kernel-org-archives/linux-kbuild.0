Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:60179 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757173Ab2EUOxV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 May 2012 10:53:21 -0400
Message-ID: <4FBA56E3.9060308@xenotime.net>
Date: Mon, 21 May 2012 07:53:23 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] scripts/patch-kernel: fix typos and compression comment
References: <4FB9AD3C.3040909@xenotime.net> <4FBA2864.5010700@suse.cz>
In-Reply-To: <4FBA2864.5010700@suse.cz>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On 05/21/2012 04:35 AM, Michal Marek wrote:

> On 21.5.2012 04:49, Randy Dunlap wrote:
>> From: Randy Dunlap <rdunlap@xenotime.net>
>>
>> Fix typo, drop trailing whitespace, and add "xz" to list of
>> compression types supported.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
>> ---
>>  scripts/patch-kernel |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> --- lnx-34-rc7-pk.orig/scripts/patch-kernel
>> +++ lnx-34-rc7-pk/scripts/patch-kernel
>> @@ -26,8 +26,8 @@
>>  #
>>  #       Nick Holloway <Nick.Holloway@alfie.demon.co.uk>, 2nd January 1995.
>>  #
>> -# Added support for handling multiple types of compression. What includes
>> -# gzip, bzip, bzip2, zip, compress, and plaintext. 
>> +# Added support for handling multiple types of compression. That includes
>> +# gzip, bzip, bzip2, zip, compress, xz, and plaintext.
>>  #
>>  #       Adam Sulmicki <adam@cfar.umd.edu>, 1st January 1997.
> 
> You are editing a changelog entry from time when xz did not exist. Why
> don't you instead add a note to the usage examples at the beginning of
> the script, that several compression formats are supported.

OK, I'll not edit the changelog entry.  duh.

> BTW, are you actually *using* this script? Wow, that would be two
> confirmed users in this calendar year alone :).


I doubt that anyone is using it successfully with 3.x, but I plan
to make it useful.

-- 
~Randy

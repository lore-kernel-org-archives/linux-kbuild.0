Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gproxy9-pub.mail.unifiedlayer.com ([69.89.20.122]:52734 "HELO
	gproxy9-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751424AbbDPTz1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 15:55:27 -0400
Message-ID: <553011F5.6090107@virtuousgeek.org>
Date: Thu, 16 Apr 2015 12:48:05 -0700
From: Jesse Barnes <jbarnes@virtuousgeek.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild/tags.sh: use cscope -q option for building symbol
 db
References: <1429211657-2486-1-git-send-email-jbarnes@virtuousgeek.org> <1429213062.16771.90.camel@x220>
In-Reply-To: <1429213062.16771.90.camel@x220>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz

On 04/16/2015 12:37 PM, Paul Bolle wrote:
> On Thu, 2015-04-16 at 12:14 -0700, Jesse Barnes wrote:
>> This takes up a bit more disk space, but really improves symbol lookup
>> performance.
>>
>> Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
>> ---
>>  scripts/tags.sh | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/tags.sh b/scripts/tags.sh
>> index cdb491d..bb35d83 100755
>> --- a/scripts/tags.sh
>> +++ b/scripts/tags.sh
>> @@ -142,7 +142,7 @@ all_defconfigs()
>>  docscope()
>>  {
>>  	(echo \-k; echo \-q; all_target_sources) > cscope.files
> 
> There's an "echo -q" there.
> 
>> -	cscope -b -f cscope.out
>> +	cscope -q -b -f cscope.out
>>  }
>>  
>>  dogtags()
> 
> man cscope tells me:
>     The -I, -c, -k, -p, -q, and -T options can also be in the cscope.files file
> 
> Doesn't the above do that correctly?

I missed that... when I did 'make cscope' after adding the -q option
things must have just gotten faster due to it all being cached, rather
than a change in the db.

Sorry for the noise!

Thanks,
Jesse

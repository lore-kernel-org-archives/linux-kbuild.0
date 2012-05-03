Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:37679 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755282Ab2ECNlL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 May 2012 09:41:11 -0400
Message-ID: <4FA28AF4.1000205@boundarydevices.com>
Date: Thu, 03 May 2012 06:41:08 -0700
From: Eric Nelson <eric.nelson@boundarydevices.com>
MIME-Version: 1.0
Subject: Re: [PATCH] checkpatch: add check for whitespace before semicolon
 at end-of-line
References: <http://lists.denx.de/pipermail/u-boot/2012-May/123595.html>	 <1336015938-3174-1-git-send-email-eric.nelson@boundarydevices.com> <1336017507.13866.2.camel@joe2Laptop>
In-Reply-To: <1336017507.13866.2.camel@joe2Laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, u-boot@lists.denx.de, rylv50@freescale.com, marex@denx.de, vapier@gentoo.org

Thanks Joe,

On 05/02/2012 08:58 PM, Joe Perches wrote:
> On Wed, 2012-05-02 at 20:32 -0700, Eric Nelson wrote:
>> This tests for a bad habits of mine like this:
>>
>> 	return 0 ;
>>
>> Signed-off-by: Eric Nelson<eric.nelson@boundarydevices.com>
>> ---
>>   scripts/checkpatch.pl |    6 ++++++
>>   1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index a3b9782..0e6977e 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -3227,6 +3227,12 @@ sub process {
>>   			 "Statements terminations use 1 semicolon\n" . $herecurr);
>>   		}
>>
>> +# check for whitespace before semicolon - not allowed at end-of-line
>> +		if ($line =~ /\s+;$/) {
>
> 		if ($line =~ /\s+;\s*$/)
>
Won't the extra space at end of line be caught by other tests?

>> +		    WARN("SPACEBEFORE_SEMICOLON",
>
> 		WARN("SPACING",
> 	

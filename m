Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:46842 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751324AbdBNHd3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Feb 2017 02:33:29 -0500
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2] tags: honor COMPILED_SOURCE with apart output directory
References: <1481819733-3002-1-git-send-email-robert.jarzmik@free.fr>
        <87lgu2cn29.fsf@belgarion.home>
Date: Tue, 14 Feb 2017 08:33:25 +0100
In-Reply-To: <87lgu2cn29.fsf@belgarion.home> (Robert Jarzmik's message of
        "Mon, 23 Jan 2017 07:22:54 +0100")
Message-ID: <87mvdpz0oq.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> Robert Jarzmik <robert.jarzmik@free.fr> writes:
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>> ---
>> Since v1: amended k expression, Marek's comments
> Hi Marek,
>
> Is this version good for you ?

Marek, could you take a look please ?

--
Robert
>> ---
>>  scripts/tags.sh | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/tags.sh b/scripts/tags.sh
>> index a2ff3388e5ea..35cb64d5211c 100755
>> --- a/scripts/tags.sh
>> +++ b/scripts/tags.sh
>> @@ -106,7 +106,8 @@ all_compiled_sources()
>>  		case "$i" in
>>  			*.[cS])
>>  				j=${i/\.[cS]/\.o}
>> -				if [ -e $j ]; then
>> +				k="${j#$tree}"
>> +				if [ -e $j -o -e "$k" ]; then
>>  					echo $i
>>  				fi
>>  				;;

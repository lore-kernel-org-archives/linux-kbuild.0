Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:17773 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680Ab0JYOnI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Oct 2010 10:43:08 -0400
Message-ID: <4CC59765.5080908@oracle.com>
Date: Mon, 25 Oct 2010 07:42:45 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: check return value of asprintf()
References: <1287757930-2766-1-git-send-email-namhyung@gmail.com> <4CC54E4D.7040401@suse.cz>
In-Reply-To: <4CC54E4D.7040401@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Namhyung Kim <namhyung@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/25/10 02:30, Michal Marek wrote:
> (adding Randy to CC)

Thanks, Michal.

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>


> On 22.10.2010 16:32, Namhyung Kim wrote:
>> Check return value of asprintf() in docsect() and exit if error
>> occurs. This removes following warning:
>>
>>   HOSTCC  scripts/basic/docproc
>> scripts/basic/docproc.c: In function ‘docsect’:
>> scripts/basic/docproc.c:336: warning: ignoring return value of ‘asprintf’,
>> 				declared with attribute warn_unused_result
>>
>> Signed-off-by: Namhyung Kim <namhyung@gmail.com>
>> ---
>> The patch is on top of v2.6.36, thanks.
>>
>>  scripts/basic/docproc.c |    5 ++++-
>>  1 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/scripts/basic/docproc.c b/scripts/basic/docproc.c
>> index fc3b18d..98dec87 100644
>> --- a/scripts/basic/docproc.c
>> +++ b/scripts/basic/docproc.c
>> @@ -333,7 +333,10 @@ static void docsect(char *filename, char *line)
>>  		if (*s == '\n')
>>  			*s = '\0';
>>  
>> -	asprintf(&s, "DOC: %s", line);
>> +	if (asprintf(&s, "DOC: %s", line) < 0) {
>> +		perror("asprintf");
>> +		exit(1);
>> +	}
>>  	consume_symbol(s);
>>  	free(s);
>>  
> 


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

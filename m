Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:61003 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755889Ab1EKVQj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 May 2011 17:16:39 -0400
Received: by iyb14 with SMTP id 14so682213iyb.19
        for <linux-kbuild@vger.kernel.org>; Wed, 11 May 2011 14:16:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.00.1105111126580.28291@pobox.suse.cz>
References: <1305064543-7401-1-git-send-email-jim.cromie@gmail.com>
	<alpine.LNX.2.00.1105111126580.28291@pobox.suse.cz>
Date: Wed, 11 May 2011 17:16:38 -0400
Message-ID: <BANLkTi=JzPH6m2aCehfE=9WbJkUiqzZgWQ@mail.gmail.com>
Subject: Re: [PATCH] fix unterminated sed cmd in export_report.pl
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Jim Cromie <jim.cromie@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi,

On Wed, May 11, 2011 at 5:27 AM, Jiri Kosina <jkosina@suse.cz> wrote:
> On Tue, 10 May 2011, jim.cromie@gmail.com wrote:
>
>> From: Jim Cromie <jim.cromie@gmail.com>
>>
>> fix following err by escaping end-of-line $ in regex.
>> perl /home/jimc/projects/lx/linux-2.6/scripts/export_report.pl > /dev/null
>> sed: -e expression #1, char 5: unterminated `s' command
>> sh: .mod.c/: not found
>>
>> without this fix, SECTION 2 of report is empty.
>>
>> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>> ---
>>  scripts/export_report.pl |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/scripts/export_report.pl b/scripts/export_report.pl
>> index 04dce7c..91fa5a2 100644
>> --- a/scripts/export_report.pl
>> +++ b/scripts/export_report.pl
>> @@ -50,7 +50,7 @@ sub usage {
>>
>>  sub collectcfiles {
>>      my @file
>> -     = `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed s/\.ko$/.mod.c/`;
>> +     = `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed s/\.ko\$/.mod.c/`;
This is bogus. the first \ is still eaten by the shell. All what
sed(1) will see is the '.'.

Btw, that's an awful lot of command to do a simple task. grep(1) and
cat(1) can be done within sed(1), so I guess the patch should looks
like:

-     = `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed s/\.ko$/.mod.c/`;
+     = `sed '/\.ko$/!d; s/\.ko$/.mod.c/' .tmp_versions/*.mod`;

[not tested]

 - Arnaud

>>      chomp @file;
>>      return @file;
>>  }
>
> Thanks for the fix, Jim.
>
> Adding Michal and linux-kbuild@, this should rather go in through his
> tree.
>
> --
> Jiri Kosina
> SUSE Labs
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

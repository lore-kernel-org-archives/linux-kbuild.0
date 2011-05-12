Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:36939 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758633Ab1ELVIB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 May 2011 17:08:01 -0400
MIME-Version: 1.0
In-Reply-To: <4DCC4365.3030907@suse.cz>
References: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>
	<4DCC4365.3030907@suse.cz>
Date: Thu, 12 May 2011 14:07:57 -0700
Message-ID: <BANLkTimKpJoUnoYx8gXi6KCYgVpnXno4ow@mail.gmail.com>
Subject: Re: [Resend PATCH] package: Makefile: fix perf target bug
From: matt mooney <mfmooney@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2011/5/12 Michal Marek <mmarek@suse.cz>:
> On 12.5.2011 20:25, mfmooney@gmail.com wrote:
>> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
>> index 1b7eaea..a32dc2d 100644
>> --- a/scripts/package/Makefile
>> +++ b/scripts/package/Makefile
>> @@ -118,10 +118,14 @@ perf-tar=perf-$(KERNELVERSION)
>>
>>  quiet_cmd_perf_tar = TAR
>>        cmd_perf_tar = \
>> -git archive --prefix=$(perf-tar)/ HEAD^{tree}                       \
>> -     $$(cat $(srctree)/tools/perf/MANIFEST) -o $(perf-tar).tar;  \
>> +git --git-dir=$(srctree)/.git --work-tree=$(srctree)                \
>
> Neither git archive not git rev-parse need the work tree, --git-dir=..
> is sufficient.

Are you sure? --git-dir points to the .git directory and --work-tree
points to the actual source code directory. Both are needed when you
are out of the source tree and the .git directory is not really
located at .git from the $PWD.

From an empirical standpoint, this as well as any git command that is
issued from outside of the working directory fails to function
properly without --work-tree.

-matt

>
>> +     archive --prefix=$(perf-tar)/ HEAD^{tree}                   \
>> +     $(addprefix $(srctree)/,                                    \
>> +       $(shell cat $(srctree)/tools/perf/MANIFEST))              \
>> +     -o $(perf-tar).tar;                                         \
>>  mkdir -p $(perf-tar);                                               \
>> -git rev-parse HEAD > $(perf-tar)/HEAD;                              \
>> +git --git-dir=$(srctree)/.git --work-tree=$(srctree)                \
>> +     rev-parse HEAD > $(perf-tar)/HEAD;                          \
>>  tar rf $(perf-tar).tar $(perf-tar)/HEAD;                            \
>>  rm -r $(perf-tar);                                                  \
>>  $(if $(findstring tar-src,$@),,                                     \
>
>



-- 
GPG-Key: 9AFE00EA

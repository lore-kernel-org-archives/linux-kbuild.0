Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34729 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707AbcFUWDq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Jun 2016 18:03:46 -0400
Received: by mail-lf0-f54.google.com with SMTP id h129so46119256lfh.1
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jun 2016 15:02:52 -0700 (PDT)
Subject: Re: Automatic dependency resolution on generated python file
References: <57438C01.6090601@bingham.xyz> <576802A4.5040804@suse.com>
From: Kieran Bingham <kieran@ksquared.org.uk>
Message-ID: <5769B985.7080208@bingham.xyz>
Date: Tue, 21 Jun 2016 23:02:45 +0100
MIME-Version: 1.0
In-Reply-To: <576802A4.5040804@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, Jan Kiszka <jan.kiszka@web.de>

On 20/06/16 15:50, Michal Marek wrote:
> On 2016-05-24 01:02, Kieran Bingham wrote:
>> Hi Kbuild / Michal,
>>
>> I've been working through a problem that Jan has reported whereby if we
>> modify a file included by our template  for constants.py, the generated
>> file is not rebuilt.
>>
>> The rule/cmd [0] to generate the python constants is
>> cmd_gen_constants_py which uses the $(CPP) with $(c_flags) to create the
>> output.
>>
>> One benefit of this is that it already creates the $(depfile) through
>> the addition of the flags provided by $(c_flags), however as yet it
>> would seem that my efforts to understand how the $(depfile) gets
>> included have failed.
>>
>> From what I can tell, the $(call if_changed...) rule is generating my
>> targets .constants.py.cmd, but the .d file is not being utilised.
>>
>> By swapping $(call if_changed, ) to $(call if_changed_dep,...) I can see
>> that my .constants.py.cmd [1] file now has (apparently) correct
>> dependency rules being generated. However they still don't take actual
>> effect. If I 'touch/modify' one of the files I have added to the
>> #includes, then my target is not rebuilt (I have added
>> include/linux/kieran.h for testing this specifically without rebuilding
>> all other objects)
> 
> Hi Kieran,
> 
> sorry for the late reply.

No problem, still useful!

> In case this is still relevant: For
> if_changed/if_changed_dep to work, you must list the target in the
> $(targets) list (without the $(obj) prefix) and add FORCE as a
> prerequisite of the rule.

Thankyou! - It works!

Now my generate rule is only called when it is supposed to be.

I'll hopefully get this fix sent in with the rest of my series by the
weekend.

> Michal

Thankyou for your support

-- 
Regards

Kieran Bingham

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:55818 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752563Ab1EEOu2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 May 2011 10:50:28 -0400
Received: by iwn34 with SMTP id 34so1884434iwn.19
        for <linux-kbuild@vger.kernel.org>; Thu, 05 May 2011 07:50:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110505133203.GE13293@sepie.suse.cz>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
	<1304561004-2684-8-git-send-email-lacombar@gmail.com>
	<20110505133203.GE13293@sepie.suse.cz>
Date: Thu, 5 May 2011 10:50:27 -0400
Message-ID: <BANLkTim_PynQaLWfg3ExmBGEwZzFfGdRCQ@mail.gmail.com>
Subject: Re: [RFC 7/9] kbuild: merge parser generation rules
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Thu, May 5, 2011 at 9:32 AM, Michal Marek <mmarek@suse.cz> wrote:
> Hi Arnaud,
>
> nice cleanup, I only have a few random comments to this and other patches.
>
> On Wed, May 04, 2011 at 10:03:22PM -0400, Arnaud Lacombe wrote:
>>  # Shipped files
>>  # ===========================================================================
>>
>>  quiet_cmd_shipped = SHIPPED $@
>>  cmd_shipped = cat $< > $@
>>
>> -$(obj)/%:: $(src)/%_shipped
>> +$(obj)/%.tab.c: $(src)/%.tab.c_shipped
>> +     $(call cmd,shipped)
>> +
>> +$(obj)/lex.%.c: $(src)/lex.%.c_shipped
>> +     $(call cmd,shipped)
>> +
>> +$(obj)/%.hash.c: $(src)/%.hash.c_shipped
>>       $(call cmd,shipped)
>
> Please don't change this rule, there are other uses of _shipped files in the
> tree than just bison/lex/gperf generated files.
>
I could not make the other implicit target work without changing this one. Ie:

$(src)/%.tab.c_shipped: $(src)/%.y
       $(call cmd,bison)

was not working with the _shipped rules left intact, but hardcoding
stem value, eg.:

$(src)/zconf.tab.c_shipped: $(src)/zconf.y
       $(call cmd,bison)

was working, at least to link the different implicit target, but
that's breaking other part. I'll try to re-investigate tonight.

 - Arnaud

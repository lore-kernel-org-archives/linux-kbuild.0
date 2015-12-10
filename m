Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37272 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752950AbbLJOpm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Dec 2015 09:45:42 -0500
Subject: Re: [PATCH] kbuild: Do not run modules_install and install in paralel
References: <CALCETrWSX1nVqyfe0Ee2rUvpHosTRyW8GSJfr52UCpT566-eWA@mail.gmail.com>
 <1402652395-28779-1-git-send-email-mmarek@suse.cz>
 <CALCETrWToro=6RvnDm023eOooqCmkRixRpLYAcFnPvJES8jAjA@mail.gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <56699013.6020800@suse.cz>
Date: Thu, 10 Dec 2015 15:45:39 +0100
MIME-Version: 1.0
In-Reply-To: <CALCETrWToro=6RvnDm023eOooqCmkRixRpLYAcFnPvJES8jAjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Dne 9.12.2015 v 22:34 Andy Lutomirski napsal(a):
> On Fri, Jun 13, 2014 at 2:39 AM, Michal Marek <mmarek@suse.cz> wrote:
>> Based on a x86-only patch by Andy Lutomirski <luto@amacapital.net>
>>
>> With modular kernels, 'make install' is going to need the installed
>> modules at some point to generate the initramfs.
>>
>> Signed-off-by: Michal Marek <mmarek@suse.cz>
>> ---
>>  Makefile | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 7680d7c..7e5e483 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -503,6 +503,12 @@ ifeq ($(KBUILD_EXTMOD),)
>>                  endif
>>          endif
>>  endif
>> +# install and module_install need also be processed one by one
>> +ifneq ($(filter install,$(MAKECMDGOALS)),)
>> +        ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
>> +               mixed-targets := 1
>> +        endif
>> +endif
>>
>>  ifeq ($(mixed-targets),1)
>>  # ===========================================================================
>> --
>> 1.9.2
>>
> 
> This patch seems to have gotten lost.  Do you still like it?  If so,
> can someone apply it, please?

Oops. I will rebase it and apply to the kbuild tree.

Michal


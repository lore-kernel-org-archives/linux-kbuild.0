Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:33719 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753204Ab0EFOqC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 May 2010 10:46:02 -0400
Received: by pwi5 with SMTP id 5so15053pwi.19
        for <linux-kbuild@vger.kernel.org>; Thu, 06 May 2010 07:46:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4BE2CAAE.1020802@suse.cz>
References: <u2l34f262ce1005052053z1cfe6d1an6c509e847ba4b40@mail.gmail.com>
	 <4BE2CAAE.1020802@suse.cz>
Date: Thu, 6 May 2010 22:46:01 +0800
Message-ID: <j2j34f262ce1005060746sec6537cej86f2075d79ed8c1c@mail.gmail.com>
Subject: Re: One question about top-level Makefile.
From: os user <gnusercn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Thu, May 6, 2010 at 9:57 PM, Michal Marek <mmarek@suse.cz> wrote:
> On 6.5.2010 05:53, os user wrote:
>> Hi, I have a question about the top-level Makefile
>>
>> # The all: target is the default when no target is given on the
>> # command line.
>> # This allow a user to issue only 'make' to build a kernel including modules
>> # Defaults vmlinux but it is usually overridden in the arch makefile
>> all: vmlinux
>>
>> From the last comment, arch makefile will override vmlinux. It seems
>> vmlinux will not be checked by `make'. But from my test, although
>> `all:' will be re-defined in arch Makefile (ARM arch), vmlinux will
>> still be checked and the commands associated will be executed. Should
>> we use another word instead of "overridden"?
>
> "Defaults to vmlinux, but the arch makefile usually adds further targets"?

It seems this makes more sense. :-)

BR

>
> Michal
>

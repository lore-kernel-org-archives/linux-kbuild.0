Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:61860 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753497Ab1FHQLK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jun 2011 12:11:10 -0400
Received: by pxi2 with SMTP id 2so464788pxi.10
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Jun 2011 09:11:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110608153843.GB4612@sepie.suse.cz>
References: <1307479931-10424-1-git-send-email-lacombar@gmail.com>
	<1307509408-2497-1-git-send-email-lacombar@gmail.com>
	<20110608153843.GB4612@sepie.suse.cz>
Date: Wed, 8 Jun 2011 12:11:09 -0400
Message-ID: <BANLkTingPzEZXbBim4-BmsvZb8SkG++vEw@mail.gmail.com>
Subject: Re: [RFCv5] Kbuild: factor parser rules
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Wed, Jun 8, 2011 at 11:38 AM, Michal Marek <mmarek@suse.cz> wrote:
> On Wed, Jun 08, 2011 at 01:03:28AM -0400, Arnaud Lacombe wrote:
>> Hi Michal,
>>
>> Here is some update concerning the parser generation merge. I do not repost the
>> whole serie as it may be overkill. You can find the latest branch at:
>>
>> git://github.com/lacombar/linux-2.6.git kbuild-implicit-parser-rule
>>
>> So let't get it done the safe way...
>>
>> Changes since v4:
>> [...]
>
>
> Hi, I found now what my problem with genksyms was. I use O= and you
> removed the -I$(src) for the lexer (which is a generated file, but needs
> genksyms.h from the source directory). With the following patch,
> everything should work again (test builds still running, but they built
> genksyms already):
>
yes, I spotted that yesterday, this is fixed in v5.

 - Arnaud

> diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
> index 0b883e3..ee1071f 100644
> --- a/scripts/genksyms/Makefile
> +++ b/scripts/genksyms/Makefile
> @@ -6,6 +6,7 @@ genksyms-objs   := genksyms.o parse.tab.o lex.lex.o
>
>  # -I needed for generated C source (shipped source)
>  HOSTCFLAGS_parse.tab.o := -Wno-uninitialized -I$(src)
> +HOSTCFLAGS_lex.lex.o := -I$(src)
>
>  $(obj)/parse.tab.o: $(obj)/parse.tab.c $(obj)/parse.tab.h
>
> Michal
>

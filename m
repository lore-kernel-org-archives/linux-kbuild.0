Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:45361 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750836Ab0ILEEH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Sep 2010 00:04:07 -0400
Received: by wwb13 with SMTP id 13so2107404wwb.1
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 21:04:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100911132208.3b11b765.rdunlap@xenotime.net>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
	<1284220282-3500-5-git-send-email-lacombar@gmail.com>
	<20100911132208.3b11b765.rdunlap@xenotime.net>
Date: Sun, 12 Sep 2010 00:04:06 -0400
Message-ID: <AANLkTinSEKhd7D8+R=stmYE=BS-ukU_dVARD4=uFjf3Y@mail.gmail.com>
Subject: Re: [PATCH 04/15] kconfig: rephrase help texts/comments not to
 include the package name
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On Sat, Sep 11, 2010 at 4:22 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On Sat, 11 Sep 2010 11:51:11 -0400 Arnaud Lacombe wrote:
>>               if (stat(name, &tmpstat)) {
>>                       fprintf(stderr, _("***\n"
>> -                             "*** You have not yet configured your kernel!\n"
>> -                             "*** (missing kernel config file \"%s\")\n"
>> +                             "*** Configuration file \"%s\" not found!\n"
>>                               "***\n"
>>                               "*** Please run some configurator (e.g. \"make oldconfig\" or\n"
>>                               "*** \"make menuconfig\" or \"make xconfig\").\n"
>
> but these *config program names are OK?
>
I'm not aware of all use cases of `conf'. That said, this case is only
relevant if the expected configuration file does not exist which can
be overridden trivially before running `conf'.

Beside that, typos have been addressed in the updated version of the
branch (I'll send a diff-to-previous shortly) as well as a couple of
other nits I noticed today (mostly compiler warnings). I will not
address the "gkc"/"qconf" issue as they're beyond the scope of this
changeset. I also amended the commit log adding a "Reviewed-by" you.

Thanks for the comments!
 - Arnaud

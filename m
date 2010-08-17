Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:56291 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753730Ab0HQP2W (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 11:28:22 -0400
Received: by wyb32 with SMTP id 32so7155704wyb.19
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2010 08:28:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100817082732.GA26082@sepie.suse.cz>
References: <1281932346-19067-1-git-send-email-lacombar@gmail.com>
	<20100817082732.GA26082@sepie.suse.cz>
Date: Tue, 17 Aug 2010 11:28:21 -0400
Message-ID: <AANLkTinLti_zp=MQ58eddBCXrDRWQgO=LW76RcTZ1K+N@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: don't assign `stdout' and `stderr'
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Nir Tzachar <nir.tzachar@gmail.com>

Hi,

On Tue, Aug 17, 2010 at 4:27 AM, Michal Marek <mmarek@suse.cz> wrote:
> On Mon, Aug 16, 2010 at 12:19:03AM -0400, Arnaud Lacombe wrote:
>> These may not be modifiable, as per C99 comment:
>>
>> section 7.19.5.4, note 232:
>> "
>> The primary use of the freopen function is to change the file associated with a
>> standard text stream (stderr, stdin, or stdout), as those identifiers need not
>> be modifiable lvalues to which the value returned by the fopen function may be
>> assigned.
>> "
>>
>> Use a duplicate of stdout as ncurses' output terminal, then redirect it
>> to /dev/null for conf_write().
>
> I would much rather get rid of this redirection completely. The config
> library should not play with stdout, but let the frontends display
> messages as they wish.
>
sounds reasonable to me, I didn't want at first to dig too much in
kconfig's internals, which would have lead to modification in other
part of the code.

 - Arnaud

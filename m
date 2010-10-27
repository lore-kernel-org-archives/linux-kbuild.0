Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41022 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752046Ab0J0W4s (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Oct 2010 18:56:48 -0400
Message-ID: <4CC8AE34.30607@suse.cz>
Date: Thu, 28 Oct 2010 00:56:52 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] kbuild: don't assign `stdout' and `stderr'
References: <1281932346-19067-1-git-send-email-lacombar@gmail.com>	<20100817082732.GA26082@sepie.suse.cz> <AANLkTimaeNoK9yDyoFHma_zLu+euSjXfni298_nEKHWK@mail.gmail.com>
In-Reply-To: <AANLkTimaeNoK9yDyoFHma_zLu+euSjXfni298_nEKHWK@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Nir Tzachar <nir.tzachar@gmail.com>

On 21.10.2010 04:22, Arnaud Lacombe wrote:
> Hi Michal,
> 
> On Tue, Aug 17, 2010 at 4:27 AM, Michal Marek <mmarek@suse.cz> wrote:
>> On Mon, Aug 16, 2010 at 12:19:03AM -0400, Arnaud Lacombe wrote:
>>> These may not be modifiable, as per C99 comment:
>>>
>>> section 7.19.5.4, note 232:
>>> "
>>> The primary use of the freopen function is to change the file associated with a
>>> standard text stream (stderr, stdin, or stdout), as those identifiers need not
>>> be modifiable lvalues to which the value returned by the fopen function may be
>>> assigned.
>>> "
>>>
>>> Use a duplicate of stdout as ncurses' output terminal, then redirect it
>>> to /dev/null for conf_write().
>>
>> I would much rather get rid of this redirection completely. The config
>> library should not play with stdout, but let the frontends display
>> messages as they wish. This patch does it for nconfig. Nir, what do you
>> think?
>>
> any news about this ? AFAICS, it not in `kbuild/kconfig'.

Sorry, I forgot about this patch. It's merged into the kconfig branch now.

Michal

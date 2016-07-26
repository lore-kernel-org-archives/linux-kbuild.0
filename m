Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45261 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756745AbcGZXQA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2016 19:16:00 -0400
Subject: Re: Officially vetted programming languages
References: <CACVxJT-YRukBirLwzeiC0agZurR28J7u2EdNo9QjQTEN_C3x8w@mail.gmail.com>
 <CA+r1ZhgLwF0EPP6TSGRE45J+cersjibnRZxtZyWWJhtQbZ3vdg@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e00ffb2f-28dd-f4fd-e85b-483e5c4f13bc@infradead.org>
Date: Tue, 26 Jul 2016 16:15:57 -0700
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhgLwF0EPP6TSGRE45J+cersjibnRZxtZyWWJhtQbZ3vdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 07/26/16 13:46, Jim Davis wrote:
> On Mon, Jul 25, 2016 at 6:11 AM, Alexey Dobriyan <adobriyan@gmail.com> wrote:
>> Do I understand correctly that POSIX sh and GNU make are
>> the only acceptable languages in kernel build
>> (ignoring optional scripts)?

python is used in several optional areas (perf, gdb, some random scripts).

> Well, Documentation/Changes mandates using GNU make (version 3.80 or
> later, though 3.80 doesn't seem to work building the 4.6.4 version of
> the kernel).  I don't know of a similar mandate for the shell; in
> practice (as enshrined in the  top level Makefile) it's /bin/bash,
> which is kind of sort of POSIX-y, except when it isn't.

I don't see "/bin/bash".  Where is that?

> The README file says Linux "aims towards POSIX and Single UNIX
> Specification compliance",  which does at least suggest staying within
> POSIX features of the shell.  Though POSIX shell compliance isn't
> always easy to sort out, as the examples at
> https://stackoverflow.com/questions/11376975/is-there-a-minimally-posix-2-compliant-shell
> illustrate.

We have merged Many patches for POSIX behavior in the past years.
I would expect that to continue.

> I've tried building defconfigs with alternate, POSIX-y shells:
> /bin/dash worked, /bin/posh didn't, and going for broke by setting
> POSIXLY_CORRECT=1 unraveled big time in a bc script in kernel/time.
> 


-- 
~Randy

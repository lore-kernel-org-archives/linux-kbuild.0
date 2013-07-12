Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:28467 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752554Ab3GLGcT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Jul 2013 02:32:19 -0400
Date: Fri, 12 Jul 2013 08:32:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: $(call cc-option) in combination with KBUILD_*FLAGS
Message-ID: <20130712063216.GA30083@merkur.ravnborg.org>
References: <CA+icZUX=sOdR5J3rM0YLw350jWJxS7+R_Bb0WkHb7Q4Ekbc6Zg@mail.gmail.com> <20130711210355.GC29911@merkur.ravnborg.org> <CA+icZUWQpoOH03MRT_r5T5vZKwU9p52tCU6MqyCfVi-k7ZGbNA@mail.gmail.com> <20130711210827.GA29928@merkur.ravnborg.org> <CA+icZUXwOSkE=mOyOuQWjnpFdka5LB4=PF-cXDAJJPUr26E0OQ@mail.gmail.com> <CA+icZUVQ=WAO2X_7Wn2pnFfm1AnYPHHmXm=Q1NSG_u8O9YrtxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUVQ=WAO2X_7Wn2pnFfm1AnYPHHmXm=Q1NSG_u8O9YrtxA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Fri, Jul 12, 2013 at 12:16:48AM +0200, Sedat Dilek wrote:
> On Thu, Jul 11, 2013 at 11:12 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > On Thu, Jul 11, 2013 at 11:08 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> >> On Thu, Jul 11, 2013 at 11:05:24PM +0200, Sedat Dilek wrote:
> >>> On Thu, Jul 11, 2013 at 11:03 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> >>> > On Fri, Jul 05, 2013 at 05:36:21PM +0200, Sedat Dilek wrote:
> >>> >> Hi,
> >>> >>
> >>> >> in which case(s) do you have to set a comma or not?
> >>> >
> >>> > Only when you specify the last option.
> >>>
> >>> You have an example for this?
> >>
> >> Example:
> >> arch/m68k/Makefile:cpuflags-$(CONFIG_M5441x)    := $(call cc-option,-mcpu=54455,-mcfv4e)
> >>
> >
> > OK, so if I have multiple cc-options separated vi comma. So a single
> > one it is not mandatory.
> >
> 
> So, this can be simplified:
> 
> [ arch/x86/realmode/rm/Makefile ]
> 
> OLD:
>                    $(call cc-option, -fno-toplevel-reorder,\
>                         $(call cc-option, -fno-unit-at-a-time)) \

It works like this:
- Use the option -fno-toplevel-reorder if supported by gcc,
  otherwise use the option -fno-unit-at-a-time if supported by gcc.

> NEW:
>                    $(call cc-option, -fno-toplevel-reorder, -fno-unit-at-a-time)
It works like this:
- Use the option -fno-toplevel-reorder if supported by gcc,
  otherwise use the option -fno-unit-at-a-time.

So the new variant fails to test if gcc supports -fno-unit-at-a-time before applying
that option.
I do not know with the current minimum gcc version if the checks are required.
But the functionality for the NEW and the OLD variant are not the same.

	Sam

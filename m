Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:36809 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756689Ab3GKVI3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jul 2013 17:08:29 -0400
Date: Thu, 11 Jul 2013 23:08:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: $(call cc-option) in combination with KBUILD_*FLAGS
Message-ID: <20130711210827.GA29928@merkur.ravnborg.org>
References: <CA+icZUX=sOdR5J3rM0YLw350jWJxS7+R_Bb0WkHb7Q4Ekbc6Zg@mail.gmail.com> <20130711210355.GC29911@merkur.ravnborg.org> <CA+icZUWQpoOH03MRT_r5T5vZKwU9p52tCU6MqyCfVi-k7ZGbNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUWQpoOH03MRT_r5T5vZKwU9p52tCU6MqyCfVi-k7ZGbNA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Thu, Jul 11, 2013 at 11:05:24PM +0200, Sedat Dilek wrote:
> On Thu, Jul 11, 2013 at 11:03 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Fri, Jul 05, 2013 at 05:36:21PM +0200, Sedat Dilek wrote:
> >> Hi,
> >>
> >> in which case(s) do you have to set a comma or not?
> >
> > Only when you specify the last option.
> 
> You have an example for this?

Example:
arch/m68k/Makefile:cpuflags-$(CONFIG_M5441x)    := $(call cc-option,-mcpu=54455,-mcfv4e)


	Sam

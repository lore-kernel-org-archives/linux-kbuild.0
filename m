Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:45073 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755513AbbLAQT5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Dec 2015 11:19:57 -0500
Date: Tue, 1 Dec 2015 16:19:44 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 1/2] scripts: Add a recorduidiv program
Message-ID: <20151201161944.GX8644@n2100.arm.linux.org.uk>
References: <1448488264-23400-1-git-send-email-sboyd@codeaurora.org>
 <1448488264-23400-2-git-send-email-sboyd@codeaurora.org>
 <20151125234711.GT8644@n2100.arm.linux.org.uk>
 <565C6714.802@suse.com>
 <20151130153208.GR8644@n2100.arm.linux.org.uk>
 <565C6DE9.2020302@suse.com>
 <565DC5A9.2010305@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565DC5A9.2010305@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kbuild@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>

On Tue, Dec 01, 2015 at 05:07:05PM +0100, Michal Marek wrote:
> On 2015-11-30 16:40, Michal Marek wrote:
> > On 2015-11-30 16:32, Russell King - ARM Linux wrote:
> >> On Mon, Nov 30, 2015 at 04:11:16PM +0100, Michal Marek wrote:
> >>> On 2015-11-26 00:47, Russell King - ARM Linux wrote:
> >>>> Do we have any resolution on these programs which modify the object
> >>>> files in-place, rather than breaking any hard-links which may be
> >>>> present (eg, as a result of using ccache in hard-link mode) ?
> >>>
> >>> Good point, but I do not think anybody is using CCACHE_HARDLINK with the
> >>> kernel.
> >>
> >> That's wrong then, because I've been using it for a very long time with
> >> my nightly builds. :)  Therefore, there is somebody!
> > 
> > OK.
> 
> So, both recordmcount and the new recordudiv program are idempotent.
> They check if the to-be-added section is already present and do nothing.

They hardly "do nothing", as the (eg) recordmcount plasters the build
log with warnings.  A solution to that would be to make recordmcount
silent if the section is already present.

> So the result is correct even with CCACHE_HARDLINK, just the
> intermediate file might be incorrect. If this still is considered an
> issue, I suggest clearing CCACHE_HARDLINK when using any of these
> postprocessors, so as not to penalize other use cases.

Another solution would be to have the top level make file unset the
CCACHE_HARDLINK environment variable if any of the options which enable
in-place editing of object files is enabled.  Looking at the ccache
code, the environment variable has to be deleted from the environment
to turn off the option - and I'm not sure whether make can delete
environment variables.  It certainly can override them, but I see
nothing in the info pages which suggests that environment variables
can be deleted by a makefile.

However, doing it outside of the kernel build system is likely error
prone especially as the kernel configuration options change and/or
their effect changes.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.

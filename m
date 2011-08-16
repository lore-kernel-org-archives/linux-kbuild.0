Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:48438 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751500Ab1HPUQn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2011 16:16:43 -0400
Subject: Re: [PATCH 1/3] kconfig/streamline_config.pl: directly access
 LSMOD from the environment
From: Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <CACqU3MXuF8J7088XpfMu4gBeBgSKqrKLz-1pVKA295UidKfDNQ@mail.gmail.com>
References: <1313472233-14094-1-git-send-email-lacombar@gmail.com>
	 <1313508664.15704.28.camel@gandalf.stny.rr.com>
	 <CACqU3MXuF8J7088XpfMu4gBeBgSKqrKLz-1pVKA295UidKfDNQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Tue, 16 Aug 2011 16:16:40 -0400
Message-ID: <1313525801.15704.29.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Tue, 2011-08-16 at 11:44 -0400, Arnaud Lacombe wrote:
> Hi,
> 
> On Tue, Aug 16, 2011 at 11:31 AM, Steven Rostedt <rostedt@goodmis.org> wrote:
> > On Tue, 2011-08-16 at 01:23 -0400, Arnaud Lacombe wrote:
> >> Cc: Steven Rostedt <rostedt@goodmis.org>
> >> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> >> ---
> >>  scripts/kconfig/Makefile             |   12 ++----------
> >>  scripts/kconfig/streamline_config.pl |    8 ++++++--
> >>  2 files changed, 8 insertions(+), 12 deletions(-)
> >
> > Hi Arnaud,
> >
> > I like these versions better. Yeah, using the LSMOD environment is the
> > better way to go.
> >
> > I'll do some tests on them and then push them up.
> >
> If you ACK them, I think this would be better if they go through the
> kconfig tree. I have other patches pending touching
> `scripts/kconfig/Makefile' which might create conflicts.

Fine with me. You can add my:

Acked-by: Steven Rostedt <rostedt@goodmis.org>

on all three patches.

-- Steve



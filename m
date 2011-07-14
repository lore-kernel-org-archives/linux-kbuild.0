Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:60096 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204Ab1GNAzB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Jul 2011 20:55:01 -0400
Subject: Re: [RFC 0/4] streamline_config clean-ups
From: Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <1310170759.2780.37.camel@fedora>
References: <1309563076-5050-1-git-send-email-lacombar@gmail.com>
	 <CACqU3MUrCODMx=8Bu+YDxy2BJwjm-77PXFob5OwHn=fr5mTdkg@mail.gmail.com>
	 <1310170759.2780.37.camel@fedora>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Wed, 13 Jul 2011 20:54:59 -0400
Message-ID: <1310604899.27864.4.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <srostedt@redhat.com>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Fri, 2011-07-08 at 20:19 -0400, Steven Rostedt wrote:
> On Fri, 2011-07-08 at 17:47 -0400, Arnaud Lacombe wrote:
> > Hi,
> > 
> > On Fri, Jul 1, 2011 at 7:31 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> > > Hi,
> > >
> > > The following series attempts to merge some redundants stuff in the kconfig
> > > Makefile, namely how streamline_config learns about its environment, avoids
> > > multi-line shell command in kconfig's Makefile. Seconds commit also removes the
> > > non-portable usage of sed(1) as -i is not POSIX compliant.
> > >
> > > Comments appreciated!
> > >
> > >  - Arnaud
> > >
> > Ping ?

I just tried your patches out. It breaks when we compile for another
directory. I just tried:

$ make LSMOD=/tmp/lsmod O=../machine/build/ localmodconfig

and it it did not work.

-- Steve



Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:36647 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751856Ab1BPPUb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Feb 2011 10:20:31 -0500
Date: Wed, 16 Feb 2011 16:20:21 +0100
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Subject: Re: [PATCH] [ANNOUNCE] kconfig: Kconfiglib: a flexible Python
 Kconfig parser
Message-ID: <20110216152020.GA20012@ulf>
References: <20110201232750.GA30800@ulf>
 <4D54715C.6060909@suse.cz>
 <20110216044830.GA19364@ulf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20110216044830.GA19364@ulf>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, rdunlap@xenotime.net, akpm@linux-foundation.org, andrea.gelmini@gelma.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>

On Wed, Feb 16, 2011 at 05:48:32AM +0100, Ulf Magnusson wrote:
> On Fri, Feb 11, 2011 at 12:14:36AM +0100, Michal Marek wrote:
> > On 2.2.2011 00:27, Ulf Magnusson wrote:
> > > Hi,
> > > 
> > > This is the initial release of Kconfiglib: a Python library for
> > > scripting, debugging, and extracting information from Kconfig-based
> > > configuration systems.  It can be used to programmatically generate a
> > > .config when the '*conf' tools are too inflexible, to quickly find out
> > > interesting information about a Kconfig configuration such as dependency
> > > relations between symbols and where undefined symbols are referenced,
> > > and in applications that need to parse and extract information from
> > > Kconfig files.
> > > 
> > > For a much longer introduction including multiple examples, see
> > > arch/kconfig/kconfiglib.py.
> > 
> > Hi,
> > 
> > this looks like a very powerful tool, but I have a similar concern like
> > Arnaud had - being completely standalone, it reimplements most of the C
> > kconfig code. One option to reduce this duplication would be a swig
> > wrapper, another one would be to let the C code parse the Kconfig files
> > and write the required information in some digested form, that would be
> > easier to parse by scripts. Something like:
> > $ scripts/kconfig/conf_inspect --kconfig=Kconfig --eval='FOO || BAR'
> > y
> > $ scripts/kconfig/conf_inspect ... --dump-symbols
> > config FOO
> > type: bool
> > valule: m
> > visible: y
> > prompt: "zzz"
> > depends: X & Y
> > select: Z
> > ...
> > $ scripts/kconfig/conf_inspect ... --dump-symbols \
> >     --fields='depends,select,value'
> > config FOO
> > depends: X & Y
> > select: Z
> > value: m
> > 
> > config BAR
> > ...
> > 
> > etc. The idea is that for instance instead of parsing the Kconfig files,
> > the Python code could fill it's data structures by reading the flat dump
> > provided by the C kconfig. There would be still lot to do in Python,
> > e.g. parsing and evaluating expressions, but it would be a small step
> > forward already. And people wanting to write quick&dirty scripts in
> > bash/awk/perl would make use of the C code as well.
> >
> Offloading some of the parsing to a new tool would probably be doable,
> though some Kconfig subleties might complicate things. For example,
> symbols that appear within choices aren't seen as real selectable choice
> items if they depend on previous symbols in specific ways (see
> _determine_actual_items() in kconfiglib.py), and capturing this
> information in the output while at the same preserving the ordering of
> the symbols could be messy. I guess you could sort this out within
> Kconfiglib instead, though other tools might then have to reimplement
> the same (messy) rules.
> 
Then again, ordering information is retained (for example, assignments
in .config files are written out in the order symbols appear within the
Kconfig files), so you could probably just iterate over all items in
Kconfig order after parsing + implicit submenu creation (which causes
the weird choice behavior) to capture such stuff as well.

> I'm not so sure about offloading anything else this way. For dynamically
> updating symbol values in a script you would need to somehow preserve
> state between invocations (or pass huge lists of assignments back and
> forth), which could lead to an unwieldy protocol. You might need to go
> the SWIG route instead.

/Ulf

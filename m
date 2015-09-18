Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:32839 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751874AbbIRQa0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Sep 2015 12:30:26 -0400
Date: Fri, 18 Sep 2015 10:30:24 -0600
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 2/2] DocBook: Use a fixed encoding for output
Message-ID: <20150918103024.7ebbb8c9@xps.lwn.net>
In-Reply-To: <1442190770.2298.31.camel@decadent.org.uk>
References: <1441147632.9215.42.camel@decadent.org.uk>
	<1441147759.9215.44.camel@decadent.org.uk>
	<20150911133059.77455c16@lwn.net>
	<1442190770.2298.31.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: =?UTF-8?B?SsOpcsOpbXk=?= Bobbio <lunar@debian.org>, reproducible-builds@lists.alioth.debian.org, linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, 14 Sep 2015 01:32:50 +0100
Ben Hutchings <ben@decadent.org.uk> wrote:

> > I guess I have to ask, though: doesn't it seem that having the docs
> > produced according to the current locale is the Right Thing to do?  Users
> > have their locale set as it is for a reason, it seems like the production
> > of textual documents should respect their choice.
> > 
> > Am I missing something here?  
> 
> Yes - the locale's character encoding applies to plain text, but rich
> text formats can have a locale-independent encoding which the viewer
> will automatically to the current locale's encoding.
> 
> For HTML, the document encoding can be explicit in the document header
> (and is, in this case).
> 
> Manual pages were already consistently encoded in UTF-8, as this is the
> default behaviour of DocBook-XSL (and is what man-db prefers as input).
> 
> PDF and Postscript documents have arbitrary and explicit mappings from
> character numbers (or names) to glyphs, and PDF documents normally have
> a mapping from glyphs back to Unicode code points to support searching
> and copying text.

OK, I guess you've talked me into it.  Can I ask you for one last favor,
though: please resubmit this patch with a couple of tweaks:

 - Based off current mainline, please (or docs-next, but that shouldn't
   be necessary).  The patch as sent doesn't apply.

 - Could you add a comment to the check-lc_ctype proglet so that somebody
   stumbling across it in the scripts directory knows why it's there?

Thanks,

jon

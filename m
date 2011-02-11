Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:40002 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757999Ab1BKTOb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Feb 2011 14:14:31 -0500
Date: Fri, 11 Feb 2011 20:14:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Specific processing during user space header generation
Message-ID: <20110211191430.GA6227@merkur.ravnborg.org>
References: <4D532BEF.1040602@zytor.com> <20110210055459.GA31333@merkur.ravnborg.org> <4D547B0C.9020508@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4D547B0C.9020508@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kbuild@vger.kernel.org

On Thu, Feb 10, 2011 at 03:55:56PM -0800, H. Peter Anvin wrote:
> On 02/09/2011 09:54 PM, Sam Ravnborg wrote:
> > On Wed, Feb 09, 2011 at 04:06:07PM -0800, H. Peter Anvin wrote:
> >> I'm stuck with a problem where a header needs specific postprocessing in
> >> addition to what headers_install.pl does.  Is that possible as things
> >> currently sit, or will that require changes to the core kbuild scripts?
> > You will nned to patch core kbuild.
> > We do no processing apart from headers_install.pl - so there is no place
> > to hook in.
> > And headers_install.pl has not been prepared to do any tricks like that.
> 
> Would you (plural) consider a patchset looking something like:
> 
> when processing foo.h, also look for foo.h.pl; if so, invoke that from
> inside headers_install.pl?

The purpose of headers_install is to install the existing kernel headers
and during the installation process do some minimal adjustments to make
then suit userspace consumption.

What you suggest smells like something else - care to explain what
you have in mind?

	Sam

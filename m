Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:39596 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414AbYKYJpX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Nov 2008 04:45:23 -0500
Date: Tue, 25 Nov 2008 10:46:47 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 8/8] kbuild: move tags support to a shell script
Message-ID: <20081125094647.GA32030@uranus.ravnborg.org>
References: <20081124205150.GA32497@uranus.ravnborg.org> <1227560095-32597-8-git-send-email-sam@ravnborg.org> <1227564434.16868.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1227564434.16868.14.camel@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ijc@hellion.org.uk>
Cc: lkml <linux-kernel@vger.kernel.org>, kbuild <linux-kbuild@vger.kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>

On Mon, Nov 24, 2008 at 10:07:14PM +0000, Ian Campbell wrote:
> On Mon, 2008-11-24 at 21:54 +0100, Sam Ravnborg wrote:
> > 
> > +# Support um (which has SUBARCH)
> > +# FIXME: add support for ALLSOURCE_ARCHS if really used
> > +if [ "${ARCH}" == "${SUBARCH}" ]; then
> > +       archs="${ARCH} ${SUBARCH}"
> > +else
> > +       archs="${SRCARCH}"
> > +fi
> 
> I've never used um but is this conditional backwards? If ${ARCH} ==
> ${SUBARCH} then archs="${ARCH} ${SUBARCH}" is equivalent to archs="
> ${ARCH} ${ARCH}", isn't it?
It is buggy.

> 
> I'm not quite sure I understand the distinction between ARCH, SRCARCH
> and SUBARCH either but is it expected that for ARCH=um, SUBARCH will be
> i386/x86_64 or x86? I think it's the former in which case I'd expect
> these days nothing will be found in arch/i386 or arch/x86_64? is a
> SRCSUBARCH required?

Something like that. But we only need to include headers for the
relavant SUBARCH. I will give it a closer look.

	Sam

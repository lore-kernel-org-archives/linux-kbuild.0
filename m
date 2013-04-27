Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:44254 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755618Ab3D0Arb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Apr 2013 20:47:31 -0400
Date: Fri, 26 Apr 2013 20:47:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
In-Reply-To: <20130426193626.GA5100@free.fr>
Message-ID: <alpine.DEB.2.02.1304262046520.3945@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric> <20130426193626.GA5100@free.fr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, 26 Apr 2013, Yann E. MORIN wrote:

> Robert, All,
>
> On Fri, Apr 26, 2013 at 03:05:02PM -0400, Robert P. J. Day wrote:
> >   probably a simple explanation for this, but my first time playing
> > with "make localmodconfig" and it appears to be tossing all my
> > ath9k-related module settings.
>
> Probably due to cset 422c809. It caused a few other issues.
> I'm working on it. In the meantime, can you just try to revert it, please?

  but that commit is in linux-next, i'm working with linus' tree which
doesn't have that commit.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

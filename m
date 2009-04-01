Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml103.kpnxchange.com ([195.121.3.7]:63241 "EHLO
	CPSMTPM-EML103.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753253AbZDASgD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 14:36:03 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: Comments on deb-pkg patch series
Date: Wed, 1 Apr 2009 20:35:57 +0200
References: <20090401162320.GY3901@baikonur.stro.at> <200904011953.53889.elendil@planet.nl> <20090401175733.GA3901@baikonur.stro.at>
In-Reply-To: <20090401175733.GA3901@baikonur.stro.at>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904012035.58852.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Andres Salomon <dilinger@debian.org>, tytso@mit.edu, sam@ravnborg.org

On Wednesday 01 April 2009, maximilian attems wrote:
> > Technically it does not matter, correct. But for the same reason
> > there is also no good reason to make it the same as the debian linux
> > images source package.
> >
> > And as it is factually incorrect I still don't like it. It would very
> > simply result in incorrect info if people query their system using
> > tools like grep-dpkg, or even if they just just view the package
> > info.
[...]
> so i still miss your point why make deb-pkg shouldn't show that too!

See quoted text above. Even if a binary package _can_ be built from the 
linux-2.6 source package using deb-pkg, in almost all cases that will 
_not_ be the case. For me that in itself is sufficient reason not to 
set "Source: linux-2.6". It very simply does not reflect the truth.

> btw this patch also fixes wrong section behaviour of make deb-pkg.

Ah, yes. I forgot about that. I do agree with that part of the patch.

With the recent restructuring of the archive the correct section for 
kernel packages would be "kernel" and not "admin", but for deb-pkg we 
probably should postpone that change for a few years as "kernel" is not 
yet valid for stable and oldstable.

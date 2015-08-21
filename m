Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:35013 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753881AbbHUOkJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2015 10:40:09 -0400
Received: by wicne3 with SMTP id ne3so17800268wic.0
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2015 07:40:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150821123823.GA24978@sepie.suse.cz>
References: <1434010298-21445-1-git-send-email-riku.voipio@linaro.org>
	<55D4867B.40802@suse.cz>
	<1440148124.2632.39.camel@decadent.org.uk>
	<20150821123823.GA24978@sepie.suse.cz>
Date: Fri, 21 Aug 2015 17:40:07 +0300
Message-ID: <CAAqcGHkg7GBd5c=uaD+ivZpSf3h5EtrYDG7_GoHQpC0qJonNJQ@mail.gmail.com>
Subject: Re: [PATCH v3] deb-pkg: add source package
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-kbuild <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>, Chris J Arges <chris.j.arges@canonical.com>, maximilian attems <maks@stro.at>

On 21 August 2015 at 15:38, Michal Marek <mmarek@suse.cz> wrote:
>
> On Fri, Aug 21, 2015 at 11:08:44AM +0200, Ben Hutchings wrote:
> > I've gone through this with Riku and found a couple of problems:
> >
> > - The 'clean' rule in the generated debian/rules calls 'make clean',
> >   but scripts/package/Makefile includes debian/ in clean-dirs.
> >   Currently that directory does not get removed for some reason, but I
> >   think that's a bug and the clean rule in debian/rules should guard
> >   against removal.
>
> Good catch. make clean is indeed supposed to delete the debian/
> directory.

It looks like debian/ directory isn't cleaned because "scripts" is
missing from "clean-dirs" in
the kernel top-level Makefile - it is in mroper-dirs, and thus debian/
vanishes when "make mrproper"
is run. I'm quite surprised that "clean-dirs" in toplevel makefile
means "recurse" but deeper in directory
tree it starts meaning "rm -rf this"..

If clean-dirs is fixed to remove debian/, this will be annoying to fix
in this patch.

> > - Building of the 'orig' tarball uses git, i.e. it depends on the
> >   kernel source being in a git repository and not simply unpacked from
> >   a tarball (or from other VCS).  The rpmpkg target doesn't have this
> >   same restriction.
>
> Right. make rpm uses the KBUILD_ALLDIRS to generate the tarball. It's
> not perfect, but it behaves consistently.

Changing this to match rpmpkg behaviour makes sense.

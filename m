Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46265 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752473AbbHUMiZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2015 08:38:25 -0400
Date: Fri, 21 Aug 2015 14:38:23 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH v3] deb-pkg: add source package
Message-ID: <20150821123823.GA24978@sepie.suse.cz>
References: <1434010298-21445-1-git-send-email-riku.voipio@linaro.org>
 <55D4867B.40802@suse.cz>
 <1440148124.2632.39.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440148124.2632.39.camel@decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, Chris J Arges <chris.j.arges@canonical.com>, maximilian attems <maks@stro.at>

On Fri, Aug 21, 2015 at 11:08:44AM +0200, Ben Hutchings wrote:
> I've gone through this with Riku and found a couple of problems:
> 
> - The 'clean' rule in the generated debian/rules calls 'make clean',
>   but scripts/package/Makefile includes debian/ in clean-dirs.
>   Currently that directory does not get removed for some reason, but I
>   think that's a bug and the clean rule in debian/rules should guard
>   against removal.

Good catch. make clean is indeed supposed to delete the debian/
directory.


> - Building of the 'orig' tarball uses git, i.e. it depends on the
>   kernel source being in a git repository and not simply unpacked from
>   a tarball (or from other VCS).  The rpmpkg target doesn't have this 
>   same restriction.

Right. make rpm uses the KBUILD_ALLDIRS to generate the tarball. It's
not perfect, but it behaves consistently.

Michal

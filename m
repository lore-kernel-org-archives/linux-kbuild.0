Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 8bytes.org ([85.214.48.195]:37224 "EHLO mail.8bytes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932521Ab3DJH52 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Apr 2013 03:57:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.8bytes.org (Postfix) with SMTP id 4CB0712B0FB
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Apr 2013 09:57:27 +0200 (CEST)
Date: Wed, 10 Apr 2013 09:57:24 +0200
From: Joerg Roedel <joro@8bytes.org>
Subject: Re: [RFC PATCH] kbuild: Build linux-tools package with 'make deb-pkg'
Message-ID: <20130410075724.GK6858@8bytes.org>
References: <CA+icZUU=SdiaPBqabf0miOM1Arsc=PjHQbY4GpaDiM4=Fbp73A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUU=SdiaPBqabf0miOM1Arsc=PjHQbY4GpaDiM4=Fbp73A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, debian-kernel@lists.debian.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM List <linux-pm@lists.linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

Hi Sedat,

On Wed, Apr 10, 2013 at 09:41:55AM +0200, Sedat Dilek wrote:
> [ CCing some involved maintainers and MLs ]
> 
> Hi Joerg,
> 
> what is the status of your proposal patch?
> Is this [1] the last version you posted?

Yes, this looks like the latest version. As far as I remember I didn't
get feedback on it and had not time to work further on the patch.

There are also problems with building a generic linux-tools package. One
is that the packages need to look differently for Debian and Ubuntu. The
other problem is that it may break automated x-compile builds.


	Joerg



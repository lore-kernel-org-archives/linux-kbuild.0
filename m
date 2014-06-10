Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59180 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751809AbaFJMtf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 08:49:35 -0400
Message-ID: <5396FEDC.8010102@suse.cz>
Date: Tue, 10 Jun 2014 14:49:32 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] deb-pkg: Add automatic support for s390x architecture
References: <1402273462.23860.62.camel@deadeye.wl.decadent.org.uk>
In-Reply-To: <1402273462.23860.62.camel@deadeye.wl.decadent.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, debian-s390@lists.debian.org, Stephen Powell <zlinuxman@wowway.com>, 750925@bugs.debian.org

On 2014-06-09 02:24, Ben Hutchings wrote:
> The Debian s390x architecture has 64-bit userland whereas s390 has
> 32-bit userland.  A 64-bit kernel can be used with either.  Now that
> Debian supports multiarch and officially supports s390x, it makes more
> sense to assign a 64-bit kernel package to s390x.
> 
> Reported-by: Stephen Powell <zlinuxman@wowway.com>
> References: https://bugs.debian.org/750925
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

Applied to kbuild.git#misc, thanks.

Michal


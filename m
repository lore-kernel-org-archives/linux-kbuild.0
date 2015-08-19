Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38945 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751512AbbHSNhC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Aug 2015 09:37:02 -0400
Subject: Re: [PATCH v3] deb-pkg: add source package
References: <1434010298-21445-1-git-send-email-riku.voipio@linaro.org>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55D4867B.40802@suse.cz>
Date: Wed, 19 Aug 2015 15:36:59 +0200
MIME-Version: 1.0
In-Reply-To: <1434010298-21445-1-git-send-email-riku.voipio@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, Chris J Arges <chris.j.arges@canonical.com>, maximilian attems <maks@stro.at>

On 2015-06-11 10:11, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> 
> Make deb-pkg build both source and binary package like make rpm-pkg does.
> For people who only need binary kernel package, there is now bindeb-pkg
> target, same target also used to build the .deb files if built from the
> source package using dpkg-buildpackage.
> 
> Generated source package will build the same kernel .config than what
> was available for make deb-pkg. The name of the source package can
> be set with KDEB_SOURCENAME enviroment variable.
> 
> The source package is useful for gpl compliance, or for feeding to a
> automated debian package builder.
> 
> Cc: Chris J Arges <chris.j.arges@canonical.com>
> Cc: maximilian attems <maks@stro.at>
> Cc: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
> v3,
>  * Allow setting source package name with KDEB_SOURCENAME
>  * Fix issues noted by Ben: drop python and fix target in debian/rules
>  * Merge "ensure $MAKE can use jobserver" oneliner from Chris J Arges

Ben,

are you OK with the v3 of this patch?

Thanks,
Michal

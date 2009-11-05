Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml102.kpnxchange.com ([195.121.3.6]:57314 "EHLO
	CPSMTPM-EML102.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753328AbZKEAa5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 19:30:57 -0500
From: Frans Pop <elendil@planet.nl>
Subject: Re: [PATCH] deb-pkg: Make deb-pkg generate a seperate linux-libc-dev deb
Date: Thu, 5 Nov 2009 01:31:01 +0100
References: <1257373849-25557-1-git-send-email-max@stro.at> <200911050020.00291.elendil@planet.nl> <20091104234023.GJ29378@baikonur.stro.at>
In-Reply-To: <20091104234023.GJ29378@baikonur.stro.at>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200911050131.02305.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, sam@ravnborg.org

On Thursday 05 November 2009, maximilian attems wrote:
> On Thu, Nov 05, 2009 at 12:19:59AM +0100, Frans Pop wrote:
> > maximilian attems wrote:
> > > userland dev likes latest incarnation of that userland API.
> > > make it easy to also build it on make deb-pkg invocation:
> >
> > I would very much prefer it if this was either optional or a separate
> > target. I have personally never had any need for such a package and
> > would like to be able to not build it.
> >
> > I agree it should be possible, just not forced.
>
> so what you propose a bindeb-pkg target for the linux-image only?

Yep, that would be fine as a solution and consistent with the targets for 
rpm. Probably bindeb-pkg should do image + firmware though?

> there is clearly demand for linux-source and linux-headers packages
> build out of deb-pkg.

No disagreement with that.

Cheers,
FJP

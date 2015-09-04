Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54047 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750803AbbIDKiU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Sep 2015 06:38:20 -0400
Date: Fri, 4 Sep 2015 12:38:18 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH v5] deb-pkg: add source package
Message-ID: <20150904103818.GA7073@sepie.suse.cz>
References: <1441187844-10660-1-git-send-email-riku.voipio@linaro.org>
 <1441201810.9215.61.camel@decadent.org.uk>
 <20150902162709.GA7332@gluino>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150902162709.GA7332@gluino>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <maks@stro.at>
Cc: linux-kbuild@vger.kernel.org, riku.voipio@linaro.org, Chris J Arges <chris.j.arges@canonical.com>, Ben Hutchings <ben@decadent.org.uk>

On Wed, Sep 02, 2015 at 09:27:10AM -0700, maximilian attems wrote:
> On Wed, Sep 02, 2015 at 02:50:10PM +0100, Ben Hutchings wrote:
> > On Wed, 2015-09-02 at 12:57 +0300, riku.voipio@linaro.org wrote:
> > > From: Riku Voipio <riku.voipio@linaro.org>
> > > 
> > > Make deb-pkg build both source and binary package like make rpm-pkg does.
> > > For people who only need binary kernel package, there is now bindeb-pkg
> > > target, same target also used to build the .deb files if built from the
> > > source package using dpkg-buildpackage.
> > > 
> > > Generated source package will build the same kernel .config than what
> > > was available for make deb-pkg. The name of the source package can
> > > be set with KDEB_SOURCENAME enviroment variable.
> > > 
> > > The source package is useful for GPL compliance, or for feeding to a
> > > automated debian package builder.
> > > 
> > > Cc: Chris J Arges <chris.j.arges@canonical.com>
> > > Cc: maximilian attems <maks@stro.at>
> > > Cc: Ben Hutchings <ben@decadent.org.uk>
> > 
> > Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
> Reviewed-by: maximilian attems <maks@stro.at>

Applied to kbuild.git#misc.

Michal

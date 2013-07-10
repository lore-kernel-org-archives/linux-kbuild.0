Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:35307 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753758Ab3GJNJQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Jul 2013 09:09:16 -0400
Received: by mail-wg0-f51.google.com with SMTP id e11so5789976wgh.6
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jul 2013 06:09:15 -0700 (PDT)
Date: Wed, 10 Jul 2013 15:09:23 +0200
From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v6 2/4] deb-pkg: split debug symbols in their own
 package
Message-ID: <20130710150923.5cd9537f@serenity>
In-Reply-To: <1372902360.22888.25.camel@deadeye.wl.decadent.org.uk>
References: <1372860126-8909-1-git-send-email-anisse@astier.eu>
	<1372860126-8909-3-git-send-email-anisse@astier.eu>
	<1372902360.22888.25.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, maximilian attems <max@stro.at>

Michal,

Every patch has now been reviewed, do you think it would be possible to
take this series for 3.12 ?

Thanks,

Anisse

On Thu, 04 Jul 2013 02:46:00 +0100, Ben Hutchings <ben@decadent.org.uk> wrote :

> On Wed, 2013-07-03 at 16:02 +0200, Anisse Astier wrote:
> > This can reduce almost 3 times the size of the linux-image package,
> > while keeping the debug symbols available for this particular build, in
> > their own package.
> > 
> > This mimics the way kernels are built in debian, ubuntu, or with
> > make-kpkg, and comes at the price of a small slowdown in the building of
> > packages.
> > 
> > Signed-off-by: Anisse Astier <anisse@astier.eu>
> > Cc: Ben Hutchings <ben@decadent.org.uk>
> > Acked-by: maximilian attems <max@stro.at>
> [...]
> 
> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
> 

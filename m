Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]:31582 "EHLO
	TX2EHSOBE006.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756085Ab2BOLUS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Feb 2012 06:20:18 -0500
Date: Wed, 15 Feb 2012 12:20:09 +0100
From: Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: [PATCH v2] kbuild: Fix link to headers in 'make deb-pkg'
Message-ID: <20120215112009.GD2238@amd.com>
References: <1329144538-21444-1-git-send-email-joerg.roedel@amd.com>
 <1329187753.3048.44.camel@deadeye>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1329187753.3048.44.camel@deadeye>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org

On Tue, Feb 14, 2012 at 02:49:13AM +0000, Ben Hutchings wrote:
> On Mon, 2012-02-13 at 15:48 +0100, Joerg Roedel wrote:
> > The Link to the kernel header files in the debian packages
> > point to the original build directory. This is a bad choice
> > if the packages were installed on a different machine. Fix
> > this in by manually re-creating the link in the builddeb
> > script.
> > 
> > Cc: Michal Marek <mmarek@suse.cz>
> > Cc: maximilian attems <max@stro.at>
> > Cc: Ben Hutchings <ben@decadent.org.uk>
> > Cc: debian-kernel@lists.debian.org
> > Cc: linux-kbuild@vger.kernel.org
> > Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
> 
> This looks good for !UML.
> 
> I wonder about the UML case though.  Did you test it?  In 3.3-rc3,
> 'make headers_install' is broken.  But if I suppress the header check,
> the resulting packages have links in the right places.

I havn't tested UML, I am not really familiar with using it. You are
probably right that for UML only the linux-image package is needed. I
can remove the UML check from this patch and post another one which
changes the script to only build linux-image for UML, how does that
sound?


	Joerg

-- 
AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632


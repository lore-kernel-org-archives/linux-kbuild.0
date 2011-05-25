Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outappmail004.snc4.facebook.com ([66.220.144.158]:45392 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751605Ab1EYTjK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 15:39:10 -0400
Date: Wed, 25 May 2011 12:39:09 -0700
From: Arun Sharma <asharma@fb.com>
Subject: Re: [PATCH 6/6] kbuild: cleanup the rpm buildroot
Message-ID: <20110525193909.GA23957@dev1756.snc6.facebook.com>
References: <1305653779-3445-1-git-send-email-asharma@fb.com>
 <1305653779-3445-6-git-send-email-asharma@fb.com>
 <20110525135458.GI2276@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110525135458.GI2276@sepie.suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arun Sharma <asharma@fb.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 25, 2011 at 03:54:58PM +0200, Michal Marek wrote:
> On Tue, May 17, 2011 at 10:36:19AM -0700, Arun Sharma wrote:
> >  echo "%build"
> > +echo 'rm -rf $RPM_BUILD_ROOT'
> 
> Don't do it, this allows another user to create their or $RPM_BUILD_ROOT
> and let you package it.

Here's the motivation for the change:

mkspec has a BuildRoot that is deterministic (i.e. the next time I
rebuild I get the same buildroot)

> echo "BuildRoot: %{_tmppath}/%{name}-%{PACKAGE_VERSION}-root"

So if I were to restart a broken build, the build root could have old files
that break the build even after the breakage is fixed.

 -Arun

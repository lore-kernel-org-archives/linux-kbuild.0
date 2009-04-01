Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml110.kpnxchange.com ([195.121.3.14]:55580 "EHLO
	CPSMTPM-EML110.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757419AbZDATLO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 15:11:14 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: Comments on deb-pkg patch series
Date: Wed, 1 Apr 2009 21:11:09 +0200
References: <20090401162320.GY3901@baikonur.stro.at> <200904012035.58852.elendil@planet.nl> <20090401184755.GC3901@baikonur.stro.at>
In-Reply-To: <20090401184755.GC3901@baikonur.stro.at>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904012111.11664.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Andres Salomon <dilinger@debian.org>, tytso@mit.edu, sam@ravnborg.org

This is going to be my last post about this as we're in danger of 
repeating ourselves. IMO the arguments are now clear; others will have
to make the decision here.

On Wednesday 01 April 2009, maximilian attems wrote:
> please get your linux-2.6 debianism out of your head. yes most of
> the time make deb-pkg will be used by an upstream tarball or git tree.
> it will certainly *not* be build by the "source" package linux.
> so that is certainly wrong.

Right. But IMO listing a non-existent source package is actually *better* 
because a .deb built using deb-pkg per definition does not _have_ a 
source package.

> i repeat my argument that you have to go for the general case of
> linux-2.6, so it will be correct in many cases instead of beeing
> always incorrect.

linux-2.6 is not the general case, it is an exception. The general case is 
building from some upstream git branch. (Unless you mean the linux-2.6 
git tree, but that is totally irrelevant as it's not a source _package_.)

The fact that the package refers to a non-existant source package has an 
informational value in itself and because there *is* no source package, 
it is perfectly correct.
It would be better to not list a source package at all, but that's 
impossible due to technical requirements.

As mentioned before, IMO "Source: linux-upstream" would be a better 
choice.

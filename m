Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml104.kpnxchange.com ([195.121.3.8]:57660 "EHLO
	CPSMTPM-EML104.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753704AbZDARx5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 13:53:57 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: Comments on deb-pkg patch series
Date: Wed, 1 Apr 2009 19:53:52 +0200
References: <20090401162320.GY3901@baikonur.stro.at> <200904011907.31585.elendil@planet.nl> <20090401173236.GZ3901@baikonur.stro.at>
In-Reply-To: <20090401173236.GZ3901@baikonur.stro.at>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904011953.53889.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Andres Salomon <dilinger@debian.org>, tytso@mit.edu, sam@ravnborg.org

On Wednesday 01 April 2009, maximilian attems wrote:
> > I continue to object to patch 4.
>
> your objection on patch 4 is disregarded.

Eh, sorry, but that's not up to you. It's fine that you disagree with me. 
But as you're not the owner or primary maintainer of the builddeb script, 
you don't get to "disregard" comments from anybody.

I'm happy to let Sam decide on this based on the given arguments. Maybe 
others will comment too.

> it does *not* matter that linux-2.6 happens to be same name
> than the debian linux images source package.

Technically it does not matter, correct. But for the same reason there is 
also no good reason to make it the same as the debian linux images source 
package.

And as it is factually incorrect I still don't like it. It would very 
simply result in incorrect info if people query their system using tools 
like grep-dpkg, or even if they just just view the package info.

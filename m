Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml104.kpnxchange.com ([195.121.3.8]:50307 "EHLO
	CPSMTPM-EML104.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932433AbZJNJ7l (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2009 05:59:41 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: [PATCH resend 0/2] fakeroot dwimery for scripts/package/*
Date: Wed, 14 Oct 2009 11:59:02 +0200
References: <20091014064622.GA8711@progeny.tock> <20091014071627.GA6256@merkur.ravnborg.org>
In-Reply-To: <20091014071627.GA6256@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200910141159.03799.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Jonathan Nieder <jrnieder@gmail.com>, linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>

On Wednesday 14 October 2009, Sam Ravnborg wrote:
>     Is ROOTCMD an established way to specify this?
>
> I asked google and not too many hits.
> So I think we should come up with something more in the
> line of the other stuff we have.
>
> That could be the longer:
>
>    KBUILD_PKG_ROOTCMD
>
> Which with the KBUILD_ prefix could be a globel environment
> variable for some.

Agreed with this change. It is also more in line with how setting a root 
command is usually done in Debian. A grep of man pages on my system shows 
the following uses:
DEBUILD_ROOTCMD, BDPEP_ROOTCMD, UUPDATE_ROOTCMD, BUILDD_ROOTCMD, 
PBUILDERROOTCMD.

I have not tested it, but the patches look good otherwise, so with Sam's 
suggested change:
Acked-by: Frans Pop <elendil@planet.nl>

Cheers,
FJP

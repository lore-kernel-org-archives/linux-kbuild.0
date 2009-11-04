Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:47192 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932649AbZKDVWU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 16:22:20 -0500
Date: Wed, 4 Nov 2009 22:22:25 +0100
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH v2 0/2] fakeroot dwimery for scripts/package/*
Message-ID: <20091104212225.GB24870@stro.at>
References: <20091014064622.GA8711@progeny.tock>
 <20091014071627.GA6256@merkur.ravnborg.org>
 <200910141159.03799.elendil@planet.nl>
 <20091014110331.GZ28231@baikonur.stro.at>
 <20091015133139.GA6718@progeny.tock>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091015133139.GA6718@progeny.tock>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Frans Pop <elendil@planet.nl>, Jonathan Nieder <jrnieder@gmail.com>

On Thu, 15 Oct 2009, Jonathan Nieder wrote:

> maximilian attems wrote:
> > Frans Pop wrote:
> >> Sam Ravnborg wrote:
> 
> >>> That could be the longer:
> >>>
> >>>    KBUILD_PKG_ROOTCMD
> >>>
> >>> Which with the KBUILD_ prefix could be a globel environment
> >>> variable for some.
> >>
> >> I have not tested it, but the patches look good otherwise, so with Sam's 
> >> suggested change:
> >> Acked-by: Frans Pop <elendil@planet.nl>
> >
> > Acked-by: maximilian attems <max@stro.at>
> >

Sam could you please push out those two patches with aboves 2 acks added,
seems author forgot to write them directly in to the -next branch?

thanks

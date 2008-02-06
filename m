Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:52235 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751031AbYBFVuy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Feb 2008 16:50:54 -0500
Date: Wed, 6 Feb 2008 22:51:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Problems with parallel building
Message-ID: <20080206215100.GA12348@uranus.ravnborg.org>
References: <20080205142343.GA9448@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080205142343.GA9448@digi.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Cc: linux-kbuild@vger.kernel.org

On Tue, Feb 05, 2008 at 03:23:43PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> using v2.6.24-7284-g9ef9dc6 (plus some patches that shouldn't affect
> kbuild) I have problems with parallel building (make -j 3).  Sometimes
> the build fails, the error isn't always the same.

Hi Uwe.

Is this new behaviour?
If it is it would be nice if you could bisect when it happened.
One suspect could be:
18c32dac75b187d1a4e858f3cfdf03e844129f5e
or
0b35786d77ba4037f181982cc8ca20a7a3bf0fd2

but they should only be relevant when you use O=...

If this is as it has always been then I am not suprised.
It is non-trivial to take all the targets supplied on the commandline
and serialize them especially as we do not know them beforehand
and we do not know which one is specified.

	Sam

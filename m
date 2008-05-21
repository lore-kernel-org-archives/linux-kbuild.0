Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:38371 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751503AbYEUTEP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 May 2008 15:04:15 -0400
Date: Wed, 21 May 2008 21:04:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
Message-ID: <20080521190453.GA12638@uranus.ravnborg.org>
References: <20080521144211.902CD37652C@pmx1.sophos.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080521144211.902CD37652C@pmx1.sophos.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: tvrtko.ursulin@sophos.com
Cc: linux-kbuild@vger.kernel.org, Andrea Arcangeli <andrea@qumranet.com>

On Wed, May 21, 2008 at 03:42:03PM +0100, tvrtko.ursulin@sophos.com wrote:
> Hi Sam, all
> 
> What are the chances $(src) variable might be broken in 2.6.26-rc3? With 
> an external module I am seeing it getting expanded to "" (null string) 
> while the same pretty straightforward Makefile works fine with 2.6.25.

Andrea Arcangeli <andrea@qumranet.com> reported a similar issue.
I have not gotten around to look at it yet.
I minimal Makefile that exhibits the problem
would be helpfull!

	Sam

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:54890 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750917AbYEYGxb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 25 May 2008 02:53:31 -0400
Date: Sun, 25 May 2008 08:54:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
Message-ID: <20080525065410.GA31573@uranus.ravnborg.org>
References: <20080521144211.902CD37652C@pmx1.sophos.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080521144211.902CD37652C@pmx1.sophos.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: tvrtko.ursulin@sophos.com, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-kbuild@vger.kernel.org

Rafael.
Can you add this to your regression list.

Handled by me.

Thanks,
	Sam

On Wed, May 21, 2008 at 03:42:03PM +0100, tvrtko.ursulin@sophos.com wrote:
> Hi Sam, all
> 
> What are the chances $(src) variable might be broken in 2.6.26-rc3? With 
> an external module I am seeing it getting expanded to "" (null string) 
> while the same pretty straightforward Makefile works fine with 2.6.25.
> 
> Thanks,
> 
> Tvrtko
> 
> 
> Sophos Plc, The Pentagon, Abingdon Science Park, Abingdon,
> OX14 3YP, United Kingdom.
> 
> Company Reg No 2096520. VAT Reg No GB 348 3873 20.
> 

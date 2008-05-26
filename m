Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:49202 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750872AbYEZPOu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 May 2008 11:14:50 -0400
From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
Date: Mon, 26 May 2008 17:15:07 +0200
References: <20080521144211.902CD37652C@pmx1.sophos.com> <20080525065410.GA31573@uranus.ravnborg.org>
In-Reply-To: <20080525065410.GA31573@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200805261715.08082.rjw@sisk.pl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: tvrtko.ursulin@sophos.com, linux-kbuild@vger.kernel.org

On Sunday, 25 of May 2008, Sam Ravnborg wrote:
> Rafael.

Hi,

Sorry for the late response.

> Can you add this to your regression list.
> 
> Handled by me.

Added as http://bugzilla.kernel.org/show_bug.cgi?id=10798 .

Thanks,
Rafael


> On Wed, May 21, 2008 at 03:42:03PM +0100, tvrtko.ursulin@sophos.com wrote:
> > Hi Sam, all
> > 
> > What are the chances $(src) variable might be broken in 2.6.26-rc3? With 
> > an external module I am seeing it getting expanded to "" (null string) 
> > while the same pretty straightforward Makefile works fine with 2.6.25.
> > 
> > Thanks,
> > 
> > Tvrtko
> > 
> > 
> > Sophos Plc, The Pentagon, Abingdon Science Park, Abingdon,
> > OX14 3YP, United Kingdom.
> > 
> > Company Reg No 2096520. VAT Reg No GB 348 3873 20.
> > 
> 
> 



-- 
"Premature optimization is the root of all evil." - Donald Knuth
